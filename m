From: Tzungder Lin <tzungder@gmail.com>
Date: Thu, 5 Jul 2007 16:26:28 +0800
Subject: [Buildroot] Error: duplicate .personality directive while building
	libstdc++ w/ ARM EABI
Message-ID: <528f811a0707050126m7b1000c0g9929325c33ae7fcc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am sorry for my incompleted subject of the last mail

Dear All,

I have ecountered the same problem as below...
My target arch is arm_generic by EABI support
I have tried gcc 4.1.2 and gcc 4.2.0 with binutils 2.17 and 2.17.50.0.14/16
but they all failed at building the same file:
libstdc++-v3/libsupc++/eh_alloc.cc
with the same error messages:
Assembler messages:
Error: duplicate .personality directive

Does anyone have any idea of it?
Thanks a lot.

jon

>>
"
I have been attempting to produce an ARM EABI toolchain (including g++)
using the buildroot.  The build fails while building libstdc++ with the
error "duplicate .personality directive".  I did some googling and it
looks like this is coming from gas from binutils.  Although the build
fails to create libstdc++ it does successfully build gcc and I have
verified that gcc produces EABI binaries.  I have also verified that if
I disable EABI (and change the GNU target suffix to linux-uclibc) in the
buildroot config that the c++ compiler along with everything else
successfully builds.

Does anyone know why enabling EABI would prevent libstdc++ from
building?

I have selected the following in the Buildroot Configuration:

Target Architecture (armeb)
Target Architecture Variant (xscale)
Target ABI (EABI)
GNU target suffix (linux-uclibcgnueabi)
Binutils Version (binutils 2.17.50.0.16)
GCC compiler Version (gcc 4.1.2)
Build/install c++ compiler and libstdc++ (y)

More context for the error is attached below.

Any ideas on this issue are greatly appreciated.

Thanks,

Jon Nalley


Making all in libsupc++
make[5]: Entering directory \
   `/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/libsupc++'
/bin/sh ../libtool --tag CXX --tag disable-shared --mode=compile \
   /uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc/xgcc \
   -shared-libgcc
-B/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc
\
   -nostdinc++ \
   -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/src
\
   -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/src/.libs
\
   -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/bin/
\
   -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/lib/
\
   -isystem /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/include
\
   -isystem /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/sys-include
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/../gcc
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/include/armeb-linux-uclibcgnueabi
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/include
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libsupc++
 \
   -g -Os -fno-implicit-templates -prefer-pic -Wall -Wextra
-Wwrite-strings -Wcast-qual \
   -fdiagnostics-show-location=once  -ffunction-sections
-fdata-sections  -c -o eh_alloc.lo \
   /uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libsupc++/eh_alloc.cc
/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc/xgcc
-shared-libgcc \
   -B/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc
-nostdinc++ \
   -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/src
\
   -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/src/.libs
\
   -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/bin/
\
   -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/lib/
\
   -isystem /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/include
\
   -isystem /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/sys-include
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/../gcc
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/include/armeb-linux-uclibcgnueabi
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-uclibcgnueabi/libstdc++-v3/include
\
   -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libsupc++
\
   -g -Os -fno-implicit-templates -Wall -Wextra -Wwrite-strings
-Wcast-qual -fdiagnostics-show-location=once \
   -ffunction-sections -fdata-sections -c
/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libsupc++/eh_alloc.cc
\
   -fPIC -DPIC -o eh_alloc.o
/tmp/ccPjsGDj.s: Assembler messages:
/tmp/ccPjsGDj.s:354: Error: duplicate .personality directive
make[5]: *** [eh_alloc.lo] Error 1
"
