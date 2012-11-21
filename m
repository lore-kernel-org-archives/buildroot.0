From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Wed, 21 Nov 2012 11:23:20 +0100
Subject: [Buildroot] crosstools build fails when hard fpu is selected
Message-ID: <50ACAB98.90607@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Using Buildroot-2012-08, I am building for arm-cortexa9-eabi,
crosstools+glibc, kernel base 2.6.38.8

I want to activate hardware floating point support, thus I have
unchecked the  "Use software floating point by default"

My final aim is to use Neon, but the defaut Hardware FPU is fine at this
time.

The build (from scratch) fails when at glibc:

[INFO ]  Installing C library headers & start files
[EXTRA]    Configuring C library
[CFG  ]    configure: loading cache
/bigdisk/shared/Buildroot/output.imx6hardfpu/build/build-toolchain/.build/arm-unknown-linux-gnueabi/build/build-libc-startfiles/config.cache
[CFG  ]    checking build system type... i686-build_pc-linux-gnu
[CFG  ]    checking host system type... arm-unknown-linux-gnueabi
[CFG  ]    checking for arm-unknown-linux-gnueabi-gcc...
arm-unknown-linux-gnueabi-gcc
[ERROR]    checking for suffix of object files... configure: error: in
`/bigdisk/shared/Buildroot/output.imx6hardfpu/build/build-toolchain/.build/arm-unknown-linux-gnueabi/build/build-libc-startfiles':
[ERROR]    configure: error: cannot compute suffix of object files:
cannot compile


The config.log shows:

configure:2477: arm-unknown-linux-gnueabi-gcc     -c  -U_FORTIFY_SOURCE
 -mlittle-endian -march=armv7-a   -mtune=cortex-a9 -mfpu=neon
-mhard-float  -O2   conftest.c >&5
conftest.c:1: sorry, unimplemented: -mfloat-abi=hard and VFP


GCC has not been generated with the harware FPU support.

I have attempted several hacks into
toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc

... with no better success

Any ideas ?

Thanks and cheers
Thierry
