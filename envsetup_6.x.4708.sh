#!/usr/bin/env bash

if [ -n "$BASH_SOURCE" ]; then
	THIS_SCRIPT=$BASH_SOURCE
elif [ -n "$ZSH_NAME" ]; then
	THIS_SCRIPT=$0
else
	THIS_SCRIPT="$(pwd)/envsetup_6.x.4708.sh"
fi

if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
	echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
	exit 1
fi

PrjDir=$(dirname "$THIS_SCRIPT")
PrjDir=$(readlink -f "$PrjDir")
SrcDir=${PrjDir}/release/src-rt-6.x.4708

# used in preconfigure scripts
export TOOLCHAIN="${SrcDir}/toolchains/hndtools-arm-linux-2.6.36-uclibc-4.5.3"
# Add the toolchain into the PATH
echo $PATH | grep ${TOOLCHAIN}/bin > /dev/null 2>&1 || export PATH="$PATH:${TOOLCHAIN}/bin"

cd ${SrcDir} > /dev/null

# unset variables in this script
unset PrjDir SrcDir THIS_SCRIPT