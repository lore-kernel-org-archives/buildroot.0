From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Tue, 10 Jun 2008 14:51:20 -0500
Subject: [Buildroot] macro `AM_PROG_LIBTOOL' not found
Message-ID: <484EDB38.8030308@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to cross compile buildroot for and Atmel at91sam9260 ARM 
processor and keep getting the same error below.
I started w/ a clean buildroot subdirectory and used the default make 
(make at91sam9260_defconfig) setup.
My native autoconf, automake and libtool are all in /usr/bin
The error references m4_pattern_allow.  Where do I add that?  How do I 
keep it if I get a new version of buildroot?
Regards,
Joe

This is the end of the build:
toolchain/patch-kernel.sh 
/home/lorenzo/buildroot/build_arm/libusb-0.1.12 package/libusb/ 
libusb-0.1.12\*.patch*

Applying libusb-0.1.12-nocpp.patch using plaintext:
patching file Makefile.am
/home/lorenzo/buildroot/toolchain_build_arm/bin/sed -i -e 
's,^all:.*,all:,g' 
/home/lorenzo/buildroot/build_arm/libusb-0.1.12/tests/Makefile.in
/home/lorenzo/buildroot/toolchain_build_arm/bin/sed -i -e 
's,^install:.*,install:,g' 
/home/lorenzo/buildroot/build_arm/libusb-0.1.12/tests/Makefile.in
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess 
/home/lorenzo/buildroot/build_arm/libusb-0.1.12
cd /home/lorenzo/buildroot/build_arm/libusb-0.1.12 && 
PATH="/home/lorenzo/buildroot/toolchain_build_arm/bin:/home/lorenzo/buildroot/build_arm/staging_dir/bin:/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/home/lorenzo/usr/cross/arm-newlib/bin:/home/JoeB/bin:/home/lorenzo/usr/cross/arm-newlib/bin:/home/lorenzo/usr/cross/arm-newlib/bin" 
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld " NM="/usr/bin/nm" 
CC="/usr/lib/ccache/gcc " GCC="/usr/lib/ccache/gcc " 
CXX="/usr/lib/ccache/g++ " CPP="/usr/bin/cpp " 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/lib/ccache/gcc" GCC_FOR_BUILD="/usr/lib/ccache/gcc" 
CXX_FOR_BUILD="/usr/lib/ccache/g++" LD_FOR_BUILD="/usr/bin/ld" 
FC_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD="" 
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD="" 
AR_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar" 
AS_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as" 
CC_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc" 
LD_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld" 
NM_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-nm" 
RANLIB_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib" 
STRIP_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip" 
OBJCOPY_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-objcopy" 
OBJDUMP_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-objdump" 
DEFAULT_ASSEMBLER="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as" 
DEFAULT_LINKER="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld" 
ORIGINAL_AS_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as" 
ORIGINAL_LD_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld" 
ORIGINAL_NM_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-nm" 
ORIGINAL_OBJDUMP_FOR_TARGET="/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-objdump" 
ACLOCAL="aclocal -I 
/home/lorenzo/buildroot/build_arm/staging_dir/usr/share/aclocal" 
autoreconf -v -f -i -I 
"/home/lorenzo/buildroot/build_arm/staging_dir/usr/share/aclocal"
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I 
/home/lorenzo/buildroot/build_arm/staging_dir/usr/share/aclocal --force
configure.in:84: warning: macro `AM_PROG_LIBTOOL' not found in library
autoreconf: configure.in: tracing
autoreconf: configure.in: not using Libtool
autoreconf: running: 
/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/autoconf 
--include=/home/lorenzo/buildroot/build_arm/staging_dir/usr/share/aclocal 
--force
configure.in:84: error: possibly undefined macro: AM_PROG_LIBTOOL
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: 
/home/lorenzo/buildroot/build_arm/staging_dir/usr/bin/autoconf failed 
with exit status: 1
make: *** [/home/lorenzo/buildroot/build_arm/libusb-0.1.12/.unpacked] 
Error 1
[JoeB at elab14_linux buildroot]$
