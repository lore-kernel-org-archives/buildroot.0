From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 11 Feb 2008 07:11:35 -0800
Subject: [Buildroot] [buildroot 0001467]: fontconfig-2.4.2 refuses to
	configure due to autoreconfig problems
Message-ID: <ec4e7886c06c12a10caa4626cc9dc31a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1467 
====================================================================== 
Reported By:                mastag
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1467
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-19-2007 16:07 PDT
Last Modified:              02-11-2008 07:11 PST
====================================================================== 
Summary:                    fontconfig-2.4.2 refuses to configure due to
autoreconfig problems
Description: 
I'm trying to build fontconfig for sh4 using gcc 3.4.6.
It unpacks and gets patched but when trying to configure it will fail.
Here is the full log:

gzip -d -c /home/mastag/buildroot/dl/fontconfig-2.4.2.tar.gz | tar -C
/home/mastag/buildroot/build_sh4   -xf -
toolchain/patch-kernel.sh
/home/mastag/buildroot/build_sh4/fontconfig-2.4.2 package/fontconfig/
\*.patch*

Applying fc-lang.patch using plaintext: 
patching file fc-lang/fc-lang.c

Applying host-tools.patch using plaintext: 
patching file fc-lang/Makefile.am
patching file fc-case/Makefile.am
patching file fc-glyphname/Makefile.am
patching file configure.in
patching file fc-arch/Makefile.am

Applying libdir-la.patch using plaintext: 
patching file ltmain.sh
Hunk http://busybox.net/bugs/view.php?id=2 succeeded at 2408 (offset 3 lines).
Hunk http://busybox.net/bugs/view.php?id=4 succeeded at 5623 (offset 8 lines).
FREETYPE_CFLAGS="-I/home/mastag/buildroot/toolchain_build_sh4/freetype-2.2.1-host/include/freetype2
-I/home/mastag/buildroot/toolchain_build_sh4/freetype-2.2.1-host/include";
\
       
FREETYPE_LIBS="-L/home/mastag/buildroot/toolchain_build_sh4/freetype-2.2.1-host/lib
-Wl,--rpath
-Wl,/home/mastag/buildroot/toolchain_build_sh4/freetype-2.2.1-host/lib
-lfreetype -lz"; \
        for dir in fc-case fc-glyphname fc-lang fc-arch; \
        do \
                /home/mastag/buildroot/toolchain_build_sh4/bin/sed -i -e
"s~^FREETYPE_CFLAGS =.*~FREETYPE_CFLAGS = $FREETYPE_CFLAGS~" \
                    -e "s~^FREETYPE_LIBS =.*~FREETYPE_LIBS =
$FREETYPE_LIBS~" \
                       
/home/mastag/buildroot/build_sh4/fontconfig-2.4.2/$dir/Makefile.in; \
        done
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess 
/home/mastag/buildroot/build_sh4/fontconfig-2.4.2
touch /home/mastag/buildroot/build_sh4/fontconfig-2.4.2/.unpacked
(cd /home/mastag/buildroot/build_sh4/fontconfig-2.4.2; rm -rf config.cache
; \
               
PATH="/home/mastag/buildroot/toolchain_build_sh4/bin:/home/mastag/buildroot/build_sh4/staging_dir/bin:/home/mastag/buildroot/build_sh4/staging_dir/usr/bin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/home/mastag/bin:/home/mastag/buildroot/build_sh4/staging_dir/bin"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/lib/ccache/gcc" GCC_FOR_BUILD="/usr/lib/ccache/gcc"
CXX_FOR_BUILD="/usr/lib/ccache/g++" LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD="" LDFLAGS_FOR_BUILD=""
AR_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ar
AS_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-as
LD_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld
NM_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-nm
RANLIB_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ranlib
STRIP_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-strip
OBJCOPY_FOR_TARGET=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-objcopy
ACLOCAL="aclocal -I
/home/mastag/buildroot/build_sh4/staging_dir/usr/share/aclocal" autoreconf
-v -f -i -I
"/home/mastag/buildroot/build_sh4/staging_dir/usr/share/aclocal" && \
               
PATH="/home/mastag/buildroot/toolchain_build_sh4/bin:/home/mastag/buildroot/build_sh4/staging_dir/bin:/home/mastag/buildroot/build_sh4/staging_dir/usr/bin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/home/mastag/bin:/home/mastag/buildroot/build_sh4/staging_dir/bin"
AR=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ar
AS=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-as
LD="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld
-L/home/mastag/buildroot/build_sh4/staging_dir/lib
-L/home/mastag/buildroot/build_sh4/staging_dir/usr/lib"
NM=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-nm
CC="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-gcc
-Os -pipe  -I/home/mastag/buildroot/build_sh4/staging_dir/usr/include
-I/home/mastag/buildroot/build_sh4/staging_dir/include"
GCC="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-gcc
-Os -pipe  -I/home/mastag/buildroot/build_sh4/staging_dir/usr/include
-I/home/mastag/buildroot/build_sh4/staging_dir/include"
CXX="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-g++
-Os -pipe  -I/home/mastag/buildroot/build_sh4/staging_dir/usr/include
-I/home/mastag/buildroot/build_sh4/staging_dir/include"
CPP="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-cpp
-Os -pipe  -I/home/mastag/buildroot/build_sh4/staging_dir/usr/include
-I/home/mastag/buildroot/build_sh4/staging_dir/include"
RANLIB=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ranlib
STRIP=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-strip
OBJCOPY=/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-objcopy
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/lib/ccache/gcc" CXX_FOR_BUILD="/usr/lib/ccache/g++"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD=""
PKG_CONFIG_SYSROOT="/home/mastag/buildroot/build_sh4/staging_dir"
PKG_CONFIG="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/mastag/buildroot/build_sh4/staging_dir/usr/lib/pkgconfig:"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
STAGING_DIR="/home/mastag/buildroot/build_sh4/staging_dir" \
                ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_c_bigendian=no \
               
CFLAGS_FOR_BUILD="-I/home/mastag/buildroot/toolchain_build_sh4/freetype-2.2.1-host/include/freetype2
-I/home/mastag/buildroot/toolchain_build_sh4/freetype-2.2.1-host/include"
\
                ./configure \
                --target=sh4-linux \
                --host=sh4-linux \
                --build=i386-pc-linux-gnu \
                --with-arch=sh4-linux \
                --prefix=/usr \
                --exec-prefix=/usr \
                --bindir=/usr/bin \
                --sbindir=/usr/sbin \
                --libdir=/usr/lib \
                --libexecdir=/usr/lib \
                --sysconfdir=/etc \
                --datadir=/usr/share \
                --localstatedir=/var \
                --includedir=/usr/include \
                --mandir=/usr/man \
                --infodir=/usr/info \
               
--with-freetype-config="/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/freetype-config"
\
               
--with-expat="/home/mastag/buildroot/build_sh4/staging_dir/usr/lib" \
               
--with-expat-lib=/home/mastag/buildroot/build_sh4/staging_dir/usr/lib \
               
--with-expat-includes=/home/mastag/buildroot/build_sh4/staging_dir/usr/include
\
                --disable-docs \
        )
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I
/home/mastag/buildroot/build_sh4/staging_dir/usr/share/aclocal --force 
configure.in:64: warning: macro `AM_PROG_LIBTOOL' not found in library
autoreconf: configure.in: tracing
autoreconf: configure.in: not using Libtool
autoreconf: running: /usr/bin/autoconf
--include=/home/mastag/buildroot/build_sh4/staging_dir/usr/share/aclocal
--force
configure.in:63: error: possibly undefined macro: AC_LIBTOOL_WIN32_DLL
      If this token and others are legitimate, please use
m4_pattern_allow.
      See the Autoconf documentation.
configure.in:64: error: possibly undefined macro: AM_PROG_LIBTOOL
autoreconf: /usr/bin/autoconf failed with exit status: 1
make: *** [/home/mastag/buildroot/build_sh4/fontconfig-2.4.2/.configured]
Fout 1
====================================================================== 

---------------------------------------------------------------------- 
 ericstjean - 02-11-08 07:11  
---------------------------------------------------------------------- 
resolved by installing libtool 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-19-07 16:07  mastag         New Issue                                    
08-19-07 16:07  mastag         Status                   new => assigned     
08-19-07 16:07  mastag         Assigned To               => buildroot       
02-11-08 07:11  ericstjean     Note Added: 0003854                          
======================================================================
