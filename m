From: William Brodie-Tyrrell <william@brodie-tyrrell.org>
Date: Wed, 25 Feb 2009 17:44:24 +0900
Subject: [Buildroot] native toolchain compilation problem
Message-ID: <20090225174424.09d0badc.william@brodie-tyrrell.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I'm using buildroot to build a linux system for the AT91SAM9G20-EK board and it's working fine except that I can't get it to build the native toolchain.  The cross-compiler works perfectly.

I'm using a patched v23434 from SVN as instructed by this website:
http://www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRootBuild

The error I'm getting is this:

arm-linux-uclibcgnueabi-gcc  -O2  -O2 -Os
-I/home/william/baes/at91sam9g20/buildroot/build_arm/staging_dir/usr/include
-I/home/william/baes/at91sam9g20/buildroot/build_arm/staging_dir/include
--sysroot=/home/william/baes/at91sam9g20/buildroot/build_arm/staging_dir/
-isysroot /home/william/baes/at91sam9g20/buildroot/build_arm/staging_dir
-mtune=arm9tdmi -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mfloat-abi=soft  -DIN_GCC    -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I.
-I/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc
-I/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/.
-I/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/../include
-I/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/../libcpp/include
-I/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/../libdecnumber
-I../libdecnumber -DL_eprintf -fvisibility=hidden -DHIDE_EXPORTS
-c /home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c
-o libgcc/./_eprintf.o

/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c: In function '__eprintf':
/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: warning: implicit declaration of function 'fprintf'
/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: warning: incompatible implicit declaration of built-in function 'fprintf'
/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: error: 'stderr' undeclared (first use in this function)
/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: error: (Each undeclared identifier is reported only once
/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: error: for each function it appears in.)
/home/william/baes/at91sam9g20/buildroot/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1974: warning: implicit declaration of function 'fflush'
make[4]: *** [libgcc/./_eprintf.o] Error 1
make[4]: Leaving directory `/home/william/baes/at91sam9g20/buildroot/build_arm/gcc-4.2.4-target/gcc'


Looks to me like the gcc build process somehow doesn't see the built uclibc (no fprintf, no stderr) - is there something I need to change to fix that?


thanks,

-- 
William Brodie-Tyrrell

Carpe Diem - fish of the day.

<william@brodie-tyrrell.org>
http://www.brodie-tyrrell.org/
