From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 20 Oct 2008 13:15:13 -0700
Subject: [Buildroot] [buildroot 0005604]: make clean crash on mkfontscale
Message-ID: <95c4b4330a3c40397cf6ab0dcd2fc7d7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5604 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5604
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-20-2008 12:47 PDT
Last Modified:              10-20-2008 13:15 PDT
====================================================================== 
Summary:                    make clean crash on mkfontscale
Description: 
root at rafbook:~/gles/buildroot# make

[...]

root at rafbook:~/gles/buildroot# make clean

[...]

>>> xapp_mkfontscale 1.0.3 Downloading
>>> xapp_mkfontscale 1.0.3 Extracting
>>> xapp_mkfontscale 1.0.3 Patching libtool
>>> xapp_mkfontscale 1.0.3 Patching package/x11r7/xapp_mkfontscale
>>> xapp_mkfontscale 1.0.3 Configuring
cd /home/roberto/gles/buildroot/build_i586/xapp_mkfontscale-1.0.3/ && rm
-f config.cache && \
	PATH="/home/roberto/gles/buildroot/toolchain_build_i586/bin:/home/roberto/gles/buildroot/build_i586/staging_dir/bin:/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
AR="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar"
AS="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
LD="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/"
NM="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm"
CC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
GCC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
CPP="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-cpp
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
CXX="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
FC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gfortran
"
RANLIB="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib"
STRIP="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip"
OBJCOPY="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar"
AS_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
CC_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc"
LD_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld"
NM_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
DEFAULT_LINKER="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/roberto/gles/buildroot/build_i586/staging_dir"
PKG_CONFIG="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/pkgconfig:"
STAGING_DIR="/home/roberto/gles/buildroot/build_i586/staging_dir" \
	ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_c_bigendian=no \
	 \
		./configure \
		--target=i586-linux \
		--host=i586-linux \
		--build=i386-pc-linux-gnu \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		 \
		
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
test: 2039: ==: unexpected operator
checking for i586-linux-strip...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip
checking whether to enable maintainer-specific portions of Makefiles...
no
checking for i586-linux-gcc...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 accepts -g... yes
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64... gcc3
checking for a BSD-compatible install... /usr/bin/install -c
checking for gzopen in -lz... yes
checking pkg-config is at least version 0.9.0... ./configure.lineno: 3709:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/pkg-config: not
found
no
checking for MKFONTSCALE... configure: error: The pkg-config script could
not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables MKFONTSCALE_CFLAGS
and MKFONTSCALE_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

To get pkg-config, see <http://www.freedesktop.org/software/pkgconfig>.
See `config.log' for more details.
make: ***
[/home/roberto/gles/buildroot/build_i586/xapp_mkfontscale-1.0.3/.stamp_configured]
Error 1

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 10-20-08 13:15  
---------------------------------------------------------------------- 
roberto at rafbook:~/gles/buildroot$ svn info | grep Last
Last Changed Author: jacmet
Last Changed Rev: 23719
Last Changed Date: 2008-10-19 09:59:19 +0200 (Sun, 19 Oct 2008) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-20-08 12:47  robang74       New Issue                                    
10-20-08 12:47  robang74       Status                   new => assigned     
10-20-08 12:47  robang74       Assigned To               => buildroot       
10-20-08 12:47  robang74       File Added: .config                          
10-20-08 12:48  robang74       Issue Monitored: robang74                    
10-20-08 13:15  robang74       Note Added: 0013904                          
======================================================================
