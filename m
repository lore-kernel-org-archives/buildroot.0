From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Wed, 31 Aug 2016 00:40:49 -0500
Subject: [Buildroot] build 2015.11 - sbin/init: error while loading shared
	libraries: libtirpc.so.1
Message-ID: <CALD51P81wh8mSgypNtVqZ+EpEtVdTAxsM27tO_njwjtJDap7nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got Marvell's  buildroot-2015.11-16.06.0 which is  buildroot-2015.11 +
Mavell packages

Compiler: gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
Kernel: 3.10.70
CPU: Marvell A38x
When I boot up rootfs,  I got the following errors:

VFS: Mounted root (ext3 filesystem) on device 8:1.
devtmpfs: mounted
Freeing unused kernel memory: 248K (c08b1000 - c08ef000)
/sbin/init: error while loading shared libraries: libtirpc.so.1: cannot
open shared object file: No such file or directory
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

I checked the libtirpc.so, it is in  /usr/lib and I also copy  ibtirpc.so*
/lib
No luck.
When I use gcc 5.,2 compile, all worked.
Any hints ? I need to use gcc4.92 as the compiler.
See my toolchain configuration -
Thank you,
Lijun QIN


root at ubutun16-Marvell-A38x:/opt/arm_gcc_49_hf/gcc49/bin#
./arm-linux-gnueabihf-gcc -v
Using built-in specs.
COLLECT_GCC=./arm-linux-gnueabihf-gcc
COLLECT_LTO_WRAPPER=/opt/arm_gcc_49_hf/gcc49/bin/../libexec/gcc/arm-linux-gnueabihf/4.9.2/lto-wrapper
Target: arm-linux-gnueabihf
Configured with:
/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/src/gcc-linaro-4.9-2014.09/configure
--build=i686-build_pc-linux-gnu --host=i686-build_pc-linux-gnu
--target=arm-linux-gnueabihf
--prefix=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/install
--with-sysroot=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/install/arm-linux-gnueabihf/libc
--enable-languages=c,c++,fortran --disable-multilib --enable-multiarch
--with-arch=armv7-a --with-tune=cortex-a9 --with-fpu=vfpv3-d16
--with-float=hard --with-pkgversion='crosstool-NG linaro-1.13.1-4.9-2014.09
- Linaro GCC 4.9-2014.09' --with-bugurl=
https://bugs.launchpad.net/gcc-linaro --enable-__cxa_atexit
--enable-libmudflap --enable-libgomp --enable-libssp
--with-gmp=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-mpfr=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-mpc=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-isl=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-cloog=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--with-libelf=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static
--enable-threads=posix --disable-libstdcxx-pch --enable-linker-build-id
--enable-plugin --enable-gold
--with-local-prefix=/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/install/arm-linux-gnueabihf/libc
--enable-c99 --enable-long-long --with-mode=thumb --disable-multilib
--with-float=hard
Thread model: posix
gcc version 4.9.2 20140904 (prerelease) (crosstool-NG
linaro-1.13.1-4.9-2014.09 - Linaro GCC 4.9-2014.09)


VFS: Mounted root (ext3 filesystem) on device 8:1.
devtmpfs: mounted
Freeing unused kernel memory: 248K (c08b1000 - c08ef000)
/sbin/init: error while loading shared libraries: libtirpc.so.1: cannot
open shared object file: No such file or dire               ctory
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160831/212cd108/attachment.html>
