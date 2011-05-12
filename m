From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 12 May 2011 16:17:55 +0200
Subject: [Buildroot] u-boot compiler issue
Message-ID: <4DCBEC13.2050802@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was building u-boot with buildroots created toolchain. Everything was working except that pointer passed via r8 was not writable (RAM was not configured etc.). But if the same code was compiled with CodeSourcery everything was working. Here gcc configuration from buidroot:

Using built-in specs.
COLLECT_GCC=arm-linux-gcc
COLLECT_LTO_WRAPPER=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr/libexec/gcc/arm-unknown-linux-uclibcgnueabi/4.5.2/lto-wrapper
Target: arm-unknown-linux-uclibcgnueabi
Configured with: /home/YegorYefremov/projects/versioned/tests/buildroot/output/toolchain/gcc-4.5.2/configure --prefix=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu --target=arm-unknown-linux-uclibcgnueabi --enable-languages=c,c++ --with-sysroot=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot --with-build-time-tools=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-libssp --disable-multilib --disable-tls --enable-shared --with-gmp=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --with-mpfr=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --with-mpc=/home/YegorYefremov/projects/versioned/tests/buildroot/output/host/usr --disable-nls --enable-threads --disa
ble-decimal-float --with-float=soft --with-abi=aapcs-linux --with-arch=armv7-a --with-tune=cortex-a8 --with-pkgversion='Buildroot 2011.05-git-00157-gf4c06f4-dirty' --with-bugurl=http://bugs.buildroot.net/
Thread model: posix
gcc version 4.5.2 (Buildroot 2011.05-git-00157-gf4c06f4-dirty)

here CodeSourcery:

Using built-in specs.
Target: arm-none-linux-gnueabi
Configured with: /scratch/mitchell/builds/4.3-arm-none-linux-gnueabi-respin/src/gcc-4.3/configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu --target=arm-none-linux-gnueabi --enable-threads --disable-libmudflap --disable-libssp --disable-libstdcxx-pch --with-gnu-as --with-gnu-ld --with-specs='%{funwind-tables|fno-unwind-tables|mabi=*|ffreestanding|nostdlib:;:-funwind-tables}' --enable-languages=c,c++ --enable-shared --enable-symvers=gnu --enable-__cxa_atexit --with-pkgversion='Sourcery G++ Lite 2009q1-203' --with-bugurl=https://support.codesourcery.com/GNUToolchain/ --disable-nls --prefix=/opt/codesourcery --with-sysroot=/opt/codesourcery/arm-none-linux-gnueabi/libc --with-build-sysroot=/scratch/mitchell/builds/4.3-arm-none-linux-gnueabi-respin/lite/install/arm-none-linux-gnueabi/libc --with-gmp=/scratch/mitchell/builds/4.3-arm-none-linux-gnueabi-respin/lite/obj/host-libs-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu/usr --with-mpfr=/scratch/mitchell/builds/4.3
-arm-none-linux-gnueabi-respin/lite/obj/host-libs-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu/usr --disable-libgomp --enable-poison-system-directories --with-build-time-tools=/scratch/mitchell/builds/4.3-arm-none-linux-gnueabi-respin/lite/install/arm-none-linux-gnueabi/bin --with-build-time-tools=/scratch/mitchell/builds/4.3-arm-none-linux-gnueabi-respin/lite/install/arm-none-linux-gnueabi/bin
Thread model: posix
gcc version 4.3.3 (Sourcery G++ Lite 2009q1-203)

My buildroot .config is also attached.

How should I configure the toolchain to able to compile OMAP3 u-boot?

Best regards,
Yegor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 28055 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110512/6da499ed/attachment-0001.wsdl>
