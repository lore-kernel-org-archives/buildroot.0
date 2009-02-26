From: William Brodie-Tyrrell <william@brodie-tyrrell.org>
Date: Thu, 26 Feb 2009 15:15:11 +0900
Subject: [Buildroot] gcc compilation issues on AT91SAM9G20
In-Reply-To: <8763iyom4z.fsf@macbook.be.48ers.dk>
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
	<8763iyom4z.fsf@macbook.be.48ers.dk>
Message-ID: <20090226151511.da1c9b65.william@brodie-tyrrell.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


OK, so I'm trying to build the latest (downloaded SVN HEAD version last
night) version of buildroot because v23434 (as indicated on
linux4sam.org) doesn't want to build a native toolchain.

The problem I'm having now is two-fold.  Firstly, the following line
appears in my .config when I run make menuconfig:
BR2_GCC_TARGET_ABI="aapcs-linux"
It causes gcc's configuration process to choke and complain about an
unknown ABI.  If I comment that out, delete the gcc build directory and
run make again, it all proceeds until I get this error:

arm-linux-uclibcgnueabi-gcc  -O2  -O2 -Os -pipe -O2
-I/home/william/baes/at91sam9g20/buildroot-head/build_arm/staging_dir/usr/include
-I/home/william/baes/at91sam9g20/buildroot-head/build_arm/staging_dir/include
--sysroot=/home/william/baes/at91sam9g20/buildroot-head/build_arm/staging_dir/
-isysroot /home/william/baes/at91sam9g20/buildroot-head/build_arm/staging_dir
-mtune=arm9tdmi -msoft-float -mfloat-abi=soft  -DIN_GCC    -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I.
-I/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc
-I/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/.
-I/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/../include
-I/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/../libcpp/include
-I/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/../libdecnumber
-I../libdecnumber -DL_eprintf -fvisibility=hidden -DHIDE_EXPORTS
-c /home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c
-o libgcc/./_eprintf.o

/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c: In function '__eprintf':
/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: warning: implicit declaration of function 'fprintf'
/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: warning: incompatible implicit declaration of built-in function 'fprintf'
/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: error: 'stderr' undeclared (first use in this function)
/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: error: (Each undeclared identifier is reported only once
/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1973: error: for each function it appears in.)
/home/william/baes/at91sam9g20/buildroot-head/toolchain_build_arm_nofpu/gcc-4.2.4/gcc/libgcc2.c:1974: warning: implicit declaration of function 'fflush'
make[4]: *** [libgcc/./_eprintf.o] Error 1
make[4]: Leaving directory `/home/william/baes/at91sam9g20/buildroot-head/build_arm/gcc-4.2.4-target/gcc'

Any ideas?


thanks...

-- 
William Brodie-Tyrrell

Carpe Diem - fish of the day.

<william@brodie-tyrrell.org>
http://www.brodie-tyrrell.org/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090226/e508b5e6/attachment.pgp>
