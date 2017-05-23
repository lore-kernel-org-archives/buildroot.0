From: lemonoje <lemonoje@gmail.com>
Date: Tue, 23 May 2017 14:23:34 -0700 (PDT)
Subject: [Buildroot] tried to add ethtool now get config error - Working
 zlib library and headers not found
Message-ID: <1495574614309-165534.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

After successfully building and using my BR rootfs on my target Arria 10 SoC
kit, I am trying to simply rebuild with enabling of the ethtool utility.  I
get the following error trying to rebuild now, whether I have ethtool
enabled or not, so that is very confusing as nothing else should have
changed.  Any ideas on the cause?  It compiles everything else fine up to
this point.

under this section:
*>>> libglib2 2.50.1 Configuring
.
.
.
.
.

configure: WARNING: unrecognized options: --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop, --enable-ipv6
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-buildroot-linux-gnueabihf-strip...
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether UID '0' is supported by ustar format... yes
checking whether GID '0' is supported by ustar format... yes
checking how to create a ustar tar archive... gnutar
checking whether to enable maintainer-specific portions of Makefiles... yes
checking whether make supports nested variables... (cached) yes
checking for arm-buildroot-linux-gnueabihf-gcc...
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc
accepts -g... yes
checking for
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc
option to accept ISO C89... none needed
checking whether
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc
understands -c and -o together... yes
checking for style of include used by make... GNU
checking dependency style of
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc...
none
checking how to run the C preprocessor...
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-cpp
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... arm-buildroot-linux-gnueabihf
checking for Win32... no
checking for the Android... no
checking for Mac OS X Carbon support... no
checking for Mac OS X Cocoa support... no
checking whether to enable garbage collector friendliness... no
checking whether to disable memory pools... no
checking for arm-buildroot-linux-gnueabihf-c++...
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-g++
checking whether we are using the GNU C++ compiler... yes
checking whether
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-g++
accepts -g... yes
checking dependency style of
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/arm-linux-gnueabihf-g++...
none
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking pkg-config is at least version 0.16... yes
checking for gawk... (cached) gawk
checking for perl5... /usr/bin/perl
checking for indent... no
checking for /usr/bin/perl... no
checking for a Python interpreter with version >= 2.5... python
checking for python... /usr/bin/python
checking for python version... 2.7
checking for python platform... linux2
checking for python script directory...
${prefix}/lib/python2.7/dist-packages
checking for python extension module directory...
${exec_prefix}/lib/python2.7/dist-packages
checking for iconv_open... yes
checking for ZLIB... no
checking for inflate in -lz... no
configure: error: *** Working zlib library and headers not found ***
make: ***
[/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/libglib2-2.50.1/.stamp_configured]
Error 1
make: Leaving directory `/sf/ArriaX/ltsi_4_1_33/buildroot'*

Thank you for any help!
John



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/tried-to-add-ethtool-now-get-config-error-Working-zlib-library-and-headers-not-found-tp165534.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
