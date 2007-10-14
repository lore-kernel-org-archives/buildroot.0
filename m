From: don <don_reid@comcast.net>
Date: Sun, 14 Oct 2007 13:09:47 -0700
Subject: [Buildroot] Libtool error with AVR32
Message-ID: <20071014200947.GA27861@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I posted this error some time ago.  With all the recent AVR32 changes, I
decided to try again.  It is still happening.

The libdaemon configure script is saying

   "*** libtool.m4 and ltmain.sh have a version mismatch! ***"

I had thought that this was related to my host files.  However examining
the "configure" for for libdaemin-0.12 shows that this check and these
message are in that file.  Why doesn't everyone get this error?

The libdaemon-0.12 directory has the 1.5.22 version.
The requirement for 1.5.24 is hard coded into that "configure" script.

...
gentoo_lt_version="1.5.24"
gentoo_ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' "$ltmain"`
if test "x$gentoo_lt_version" != "x$gentoo_ltmain_version" ; then
...

Interestingly, there are different versions of ltmain.sh in my build
tree, and this is a totally clean tree pulled from svn yesterday.

VERSION="1.5.22 Debian 1.5.22-2"
./build_avr32/pkg-config-0.21/ltmain.sh
VERSION="1.5.22 Debian 1.5.22-2"
./build_avr32/pkg-config-0.21/glib-1.2.8/ltmain.sh
VERSION="1.5.22 Debian 1.5.22-4"
./build_avr32/libdaemon-0.12/ltmain.sh
VERSION=1.4a-GCC3.0
./toolchain_build_avr32/gcc-4.1.2-avr32-2.0/ltmain.sh
VERSION=1.5.0a
./toolchain_build_avr32/gcc-4.1.2-avr32-2.0/libjava/libltdl/ltmain.sh
VERSION=1.4a-GCC3.0
./toolchain_build_avr32/gcc-4.1.2-avr32-2.0/libjava/classpath/ltmain.sh
VERSION=1.4a-GCC3.0
./toolchain_build_avr32/binutils-2.17-avr32-2.1.3/ltmain.sh
VERSION=1.5.24
./toolchain_build_avr32/gmp-4.2.2/ltmain.sh
VERSION="1.5.24 Debian 1.5.24-1"
./toolchain_build_avr32/mpfr-2.3.0/ltmain.sh



----- Forwarded message from don <don_reid@comcast.net> -----
Date: Thu, 27 Sep 2007 11:17:57 -0700
From: don <don_reid@comcast.net>
To: buildroot at uclibc.org
Subject: Libtool error with AVR32

I tried to use the latest AVR32 release from ATmel and got an error.
Is there somewhere else to post that other than this list?

The error is in build_avr32_nofpu/libdaemon-0.12 and is:

...
configure: WARNING: In the future, Autoconf will not detect cross-tools
whose name does not start with the host triplet.  If you think this
configuration is useful to you, please write to autoconf at gnu.org.
checking whether we are using the GNU Fortran 77 compiler... yes
checking whether gfortran accepts -g... yes
checking the maximum length of command line arguments... 98304
checking command to parse /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-nm output from /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe  -I/home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/include -msoft-float object... ok
checking for objdir... .libs
checking for avr32-linux-ar... /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-ar
checking for avr32-linux-ranlib... /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-ranlib
checking for avr32-linux-strip... (cached) /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-strip
checking for correct ltmain.sh version... no
configure: error:

*** [Gentoo] sanity check failed! ***
*** libtool.m4 and ltmain.sh have a version mismatch! ***
*** (libtool.m4 = 1.5.24, ltmain.sh = "1.5.22 Debian 1.5.22-4") ***

Please run:

  libtoolize --copy --force

if appropriate, please contact the maintainer of this
package (or your distribution) for help.

make: *** [/home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/libdaemon-0.12/.configured] Error 1

----- End forwarded message -----
