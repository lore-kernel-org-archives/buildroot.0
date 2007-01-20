From: Claus Klein <claus.klein@arcormail.de>
Date: Sat, 20 Jan 2007 14:10:05 +0100
Subject: [Buildroot]
	buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info:
	build error
In-Reply-To: <200701192249.57232.claus.klein@arcormail.de>
References: <200701192249.57232.claus.klein@arcormail.de>
Message-ID: <200701201410.06047.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 19 January 2007 22:49, Claus Klein wrote:
> Hi,
> 
> I got a Warning: `makeinfo' is missing on your system. 
> 	and the make failed?
> 
> Is this a known problem?
> 
> Best Regards,
> 
> Claus

I stop at this point!
I'm not able to build any toolchain under OpenSuse 10.1 without `makeinfo'

What is the stable toolchain combination today?
I expected the 'make defconfig' would work.
It seems not?

I really appreciate your help.

Thank you

Claus

----------------------- my errors from tody ------------------------------

===================================
Date:   Sa Jan 20 10:30:15 CET 2007
===================================
from uClibc nightly tests: http://www.uclibc.org/~vapier/

STAMP: snapshot 20070120 svn r17394
STAMP: toolchain used 'i386-gentoo-linux-uclibc'
STAMP: cross-i386-gentoo-linux-uclibc/binutils-2.17
STAMP: cross-i386-gentoo-linux-uclibc/gcc-4.1.1-r1
STAMP: cross-i386-gentoo-linux-uclibc/linux-headers-2.6.19
STAMP: cross-i386-gentoo-linux-uclibc/uclibc-0.9.28
      i386 |     i386 | Compile | PASS

claus at P3linux:~/src/buildroot> grep '^[^#]' .config | egrep -v 'BR2_PACKAGE_|BR2_TARGET_ROOTFS'
BR2_HAVE_DOT_CONFIG=y
BR2_i386=y
BR2_x86_i686=y
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="zcat"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS="--exclude=CVS --exclude=.svn"
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="surfnet"
BR2_STAGING_DIR="/tools/Linuxi386CDK"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_2_6_19_2=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.19.2"
BR2_UCLIBC_VERSION_0_9_28=y
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_17=y
BR2_BINUTILS_VERSION="2.17"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_1_1=y
BR2_GCC_VERSION="4.1.1"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
BR2_GCC_SHARED_LIBGCC=y
BR2_CCACHE=y
BR2_MKLIBS=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_BUSYBOX_VERSION_1_2_2_1=y
BR2_NETWORK_SUPPORT=y
claus at P3linux:~/src/buildroot>

##################################################################################

===================================
Date:   Sa Jan 20 10:30:15 CET 2007
===================================

with:   toolchain_build_i686/binutils-2.16.1
and:    toolchain_build_i686/gcc-3.4.2
        toolchain_build_i686/gcc-3.3.6
FIXME:  gcc-3.3.6 failed too!

claus at P3linux:~/src/buildroot> make

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
CXXFLAGS clean:                                 Ok
sed works:                                      Ok
which installed:                                Ok
GNU make version '3.80':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.0':                     Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
Build system dependencies:                      Ok

...


/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc/xgcc -B/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc/ -B/tools/Linuxi386CDK/i686-linux-uclibc/bin/ -B/tools/Linuxi386CDK/i686-linux-uclibc/lib/ -isystem /tools/Linuxi386CDK/i686-linux-uclibc/include -isystem /tools/Linuxi386CDK/i686-linux-uclibc/sys-include -O2 -DIN_GCC -DCROSS_COMPILE  -DUSE_UCLIBC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I. -I. -I/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2/gcc -I/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2/gcc/. -I/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2/gcc/../include   -g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions -fno-zero-initialized-in-bss -fno-unit-at-a-time -fno-omit-frame-pointer \
   -c /home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2/gcc/crtstuff.c -DCRT_BEGIN \
  -o crtbegin.o
In file included from /home/claus/src/buildroot/toolchain_build_i686/uClibc_dev//usr/include/bits/posix1_lim.h:153,
                 from /home/claus/src/buildroot/toolchain_build_i686/uClibc_dev//usr/include/limits.h:144,
                 from /home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc/include/limits.h:122,
                 from /home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc/include/syslimits.h:7,
                 from /home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc/include/limits.h:11,
                 from /home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2/gcc/tsystem.h:97,
                 from /home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2/gcc/crtstuff.c:62:
/home/claus/src/buildroot/toolchain_build_i686/uClibc_dev//usr/include/bits/local_lim.h:36:26: linux/limits.h: No such file or directory
make[2]: *** [crtbegin.o] Fehler 1
make[2]: Leaving directory `/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc'
make[1]: *** [all-gcc] Fehler 2
make[1]: Leaving directory `/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial'
make: *** [/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/.compiled] Fehler 2
claus at P3linux:~/src/buildroot> 

##################################################################################

with: toolchain_build_i686/binutils-2.16.91.0.7
and:  toolchain_build_i686/binutils-2.17.50.0.9

make[5]: Leaving directory `/home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7-build/bfd/doc'
./chew -f /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/doc.str </home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/../mmo.c >mmo.tmp
/bin/sh /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/../../move-if-change mmo.tmp mmo.texi
restore=: && backupdir=".am$$" && \
am__cwd=`pwd` && cd /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc && \
rm -rf $backupdir && mkdir $backupdir && \
for f in /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info-[0-9] /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info-[0-9][0-9] /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.i[0-9] /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.i[0-9][0-9]; do \
  if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
done; \
cd "$am__cwd"; \
if /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/missing makeinfo --split-size=5000000 --split-size=5000000   -I /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc \
 -o /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.texinfo; \
then \
  rc=0; \
  cd /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc; \
else \
  rc=$?; \
  cd /home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc && \
  $restore $backupdir/* `echo ".//home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info" | sed 's|[^/]*$||'`; \
fi; \
rm -rf $backupdir; exit $rc
WARNING: `makeinfo' is missing on your system.  You should only need it if
         you modified a `.texi' or `.texinfo' file, or any other file
         indirectly affecting the aspect of the manual.  The spurious
         call might also be the consequence of using a buggy `make' (AIX,
         DU, IRIX).  You might want to install the `Texinfo' package or
         the `GNU make' package.  Grab either from any GNU archive site.
make[4]: *** [/home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info] Fehler 1
make[4]: Leaving directory `/home/claus/src/buildroot/toolchain_build_i686/binutils-2.16.91.0.7-build/bfd/doc'
