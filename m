From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 15 Feb 2015 18:30:10 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-13
In-Reply-To: <20150214224243.47b77b67@free-electrons.com>
References: <20150214073013.E7748101008@stock.ovh.net>
 <20150214224243.47b77b67@free-electrons.com>
Message-ID: <20150215173009.GK32479@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, 14 Feb 2015 08:30:13 +0100 (CET), Thomas Petazzoni wrote:
> 
> >          sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/7e3dc7d48d2c62867ea6f95615d583dee9b42e4b/
> 
> The infamous static linking problem with uClibc, which still exists on
> SH4 because the toolchains have not been rebuilt since a long time.
> Would anyone be willing to look at fixing the SH4 support in the
> internal toolchain backend? It's broken due to SH4 requiring some form
> of multilib support.

I just build a sh4 toolchain with uClibc 0.9.33.2. No issues.
./output/host/usr/bin/sh4-buildroot-linux-uclibc-gcc -v
Using built-in specs.
COLLECT_GCC=./output/host/usr/bin/sh4-buildroot-linux-uclibc-gcc
COLLECT_LTO_WRAPPER=/home/wbx/br/output/host/usr/libexec/gcc/sh4-buildroot-linux-uclibc/4.8.4/lto-wrapper
Target: sh4-buildroot-linux-uclibc
Configured with: ./configure --prefix=/home/wbx/br/output/host/usr
--sysconfdir=/home/wbx/br/output/host/etc --enable-static
--target=sh4-buildroot-linux-uclibc
--with-sysroot=/home/wbx/br/output/host/usr/sh4-buildroot-linux-uclibc/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp
--disable-multilib --with-gmp=/home/wbx/br/output/host/usr
--with-mpfr=/home/wbx/br/output/host/usr --enable-target-optspace
--disable-libquadmath --disable-libsanitizer --enable-tls
--disable-libmudflap --enable-threads
--with-mpc=/home/wbx/br/output/host/usr --without-isl
--without-cloog --disable-decimal-float --with-pkgversion='Buildroot
2015.02-rc1-00016-gd45454d' --with-bugurl=http://bugs.buildroot.net/
--enable-languages=c --disable-largefile
--enable-poison-system-directories
--with-build-time-tools=/home/wbx/br/output/host/usr/sh4-buildroot-linux-uclibc/bin
--enable-shared --disable-libgomp
Thread model: posix
gcc version 4.8.4 (Buildroot 2015.02-rc1-00016-gd45454d)

What is the exact problem?

best regards
        Waldemar
