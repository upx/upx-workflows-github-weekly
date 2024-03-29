#! /usr/bin/env bash
## vim:set ts=4 sw=4 et:
set -e; set -o pipefail

# Copyright (C) Markus Franz Xaver Johannes Oberhumer
#
# "Gofmt's style is nobody's favourite, but gofmt is everybody's favourite." --Rob Pike
#
# NOTE: we are using clang-format-15.0.6 from upx-stubtools
# see https://github.com/upx/upx-stubtools/releases
#
# NOTE: we use .clang-format config from upx.git/.clang-format

if [[ ! -f $UPX_CLANG_FORMAT ]]; then
    UPX_CLANG_FORMAT="$HOME/local/bin/bin-upx/clang-format-15.0.6"
fi
if [[ ! -f $UPX_CLANG_FORMAT ]]; then
    UPX_CLANG_FORMAT="$HOME/.local/bin/bin-upx/clang-format-15.0.6"
fi
if [[ ! -f $UPX_CLANG_FORMAT ]]; then
    UPX_CLANG_FORMAT="$HOME/bin/bin-upx/clang-format-15.0.6"
fi
if [[ ! -f $UPX_CLANG_FORMAT ]]; then
    echo "ERROR: $0: cannot find clang-format-15.0.6"
    echo "ERROR: $0: please visit https://github.com/upx/upx-stubtools"
    exit 1
fi

# limit memory usage to 1 GiB (in case of clang-format problems with invalid files)
ulimit -v 1048576 || true

#echo $UPX_CLANG_FORMAT
exec "$UPX_CLANG_FORMAT" -style=file "$@"
exit 99
