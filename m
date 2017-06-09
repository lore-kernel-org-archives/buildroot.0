From: Brent Sink <brents_3@hotmail.com>
Date: Fri, 9 Jun 2017 14:36:26 +0000
Subject: [Buildroot] Error when building Qt5 Webengine from buildroot
In-Reply-To: <20170609090628.5f4d5af3@free-electrons.com>
References: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
 <BN6PR03MB2914ED0870804EEF5408B906BFC90@BN6PR03MB2914.namprd03.prod.outlook.com>,
 <20170609090628.5f4d5af3@free-electrons.com>
Message-ID: <BN6PR03MB29148981A29B24CED48107ADBFCE0@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

> Which version of gcc are you using? Does it support C++11 ?

The gcc version is 5.4.0, and when I pass the -std=c++11 it will build for c++11.  Here is the gcc version:

$ buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -v
Using built-in specs.
COLLECT_GCC=/home/cpa/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc.br_real
COLLECT_LTO_WRAPPER=/home/cpa/buildroot/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabihf/5.4.0/lto-wrapper
Target: arm-buildroot-linux-gnueabihf
Configured with: ./configure --prefix=/home/cpa/buildroot/output/host/usr --sysconfdir=/home/cpa/buildroot/output/host/etc --enable-static --target=arm-buildroot-linux-gnueabihf --with-sysroot=/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/home/cpa/buildroot/output/host/usr --with-mpc=/home/cpa/buildroot/output/host/usr --with-mpfr=/home/cpa/buildroot/output/host/usr --with-pkgversion='Buildroot 2017.02-git-00458-g9e4f72c-dirty' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --enable-tls --disable-libmudflap --enable-threads --without-isl --without-cloog --disable-decimal-float --with-abi=aapcs-linux --with-cpu=cortex-a9 --with-fpu=vfpv3 --with-float=hard --with-mode=arm --enable-languages=c,c++ --with-build-time-tools=/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/bin --enable-shared --disable-libgomp
Thread model: posix
gcc version 5.4.0 (Buildroot 2017.02-git-00458-g9e4f72c-dirty)

...and here is g++:
buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-g++ -v
Using built-in specs.
COLLECT_GCC=/home/cpa/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-g++.br_real
COLLECT_LTO_WRAPPER=/home/cpa/buildroot/output/host/usr/libexec/gcc/arm-buildroot-linux-gnueabihf/5.4.0/lto-wrapper
Target: arm-buildroot-linux-gnueabihf
Configured with: ./configure --prefix=/home/cpa/buildroot/output/host/usr --sysconfdir=/home/cpa/buildroot/output/host/etc --enable-static --target=arm-buildroot-linux-gnueabihf --with-sysroot=/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/home/cpa/buildroot/output/host/usr --with-mpc=/home/cpa/buildroot/output/host/usr --with-mpfr=/home/cpa/buildroot/output/host/usr --with-pkgversion='Buildroot 2017.02-git-00458-g9e4f72c-dirty' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --enable-tls --disable-libmudflap --enable-threads --without-isl --without-cloog --disable-decimal-float --with-abi=aapcs-linux --with-cpu=cortex-a9 --with-fpu=vfpv3 --with-float=hard --with-mode=arm --enable-languages=c,c++ --with-build-time-tools=/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/bin --enable-shared --disable-libgomp
Thread model: posix
gcc version 5.4.0 (Buildroot 2017.02-git-00458-g9e4f72c-dirty)


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170609/1185655f/attachment.html>
