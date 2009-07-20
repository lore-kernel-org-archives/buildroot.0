From: Amit Uttamchandani <amit.uttam@gmail.com>
Date: Mon, 20 Jul 2009 12:12:00 -0700
Subject: [Buildroot] libgcc build error on arm
Message-ID: <20090720121200.05b9f0b5@debian.canoga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Using the latest git source I get following build error when building a
toolchain for arm (build log can be found at end of message):

I tried the following approaches:

 1. Build without shared libs - fails
 2. Build with shared libs - fails
 3. Add '_nofpu' suffix for soft float toolchains - fails
 4. Git clone from scratch and rebuild - fails

For the build options I used all the default from Buildroot. Arch build
options:

BR2_armeb=y
BR2_generic_arm=y
BR2_ARM_TYPE="GENERIC_ARM"
BR2_ARM_EABI=y
BR2_ARCH="armeb"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ABI="aapcs-linux"

Any help would be appreciated.

Thanks.

/home/amit/src/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibc-ranlib
libgcov.a /home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3-initial/./gcc/xgcc
-B/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3-initial/./gcc/
-B/home/amit/src/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibc/bin/
-B/home/amit/src/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibc/lib/
-isystem /home/amit/src/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibc/include
-isystem /home/amit/src/buildroot/build_armeb/staging_dir/usr/armeb-linux-uclibc/sys-include
-g -Os -O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE   -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -I. -I.
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/gcc
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/gcc/.
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/gcc/../include
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/gcc/../libcpp/include
-I/home/amit/src/buildroot/toolchain_build_armeb/gmp/include
-I/home/amit/src/buildroot/toolchain_build_armeb/mpfr/include
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/gcc/../libdecnumber
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/gcc/../libdecnumber/dpd
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder
-fno-tree-vectorize  -I. -I. -I../.././gcc
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/.
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../gcc
-I/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../include
-o crtbegin.o -MT crtbegin.o -MD -MP -MF crtbegin.dep  \
-c /home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../gcc/crtstuff.c
-DCRT_BEGIN /home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../gcc/crtstuff.c:
In function
'__do_global_dtors_aux': /home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: '__DTOR_LIST__' undeclared (first use in this
function) /home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: (Each undeclared identifier is reported only
once /home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: for each function it appears in.) make[2]: *** [crtbegin.o]
Error 1 make[2]: Leaving directory
`/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3-initial/armeb-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2 make[1]: Leaving directory
`/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3-initial'
make: ***
[/home/amit/src/buildroot/toolchain_build_armeb/gcc-4.3.3-initial/.compiled]
Error 2
