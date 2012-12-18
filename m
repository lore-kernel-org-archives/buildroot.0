From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue, 18 Dec 2012 13:42:07 +0100
Subject: [Buildroot] Using a precompiled busybox toolchain as an external
	toolchain
Message-ID: <CAKvQZ_0sLwXqmGeTdeC6EBqqZ_FN4s6cVcnM3OwVrSHHYHfWDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have played a bit with buildroot for some weeks so I'm now trying to
do things correctly. One on my first aim was to save a previsouly
compiled buildroot toolchain and use it as an external toolchain as
suggested by the manual at section "5.3.2. Using an external
toolchain".

What I did is :
_ create a .config and a plain working system with the internal
compiled toolchain
_ copy ouptut/host/usr in ${MY_TOOLCHAIN_PATH}
_ use the "same" .config twice in changing just the toolchain to an
external one at ${MY_TOOLCHAIN_PATH} location with related
largefile,C++,,...
_ make clean
_ make

It ends in error with "configure: error: C compiler cannot create executables"

BTW, is there a way to ask buildroot to *only* build the toolchain
(not the linux rootfs) ? So I can have among my buildroot configs a
toolchain-****.config


Enclosed my : utput/build/libtirpc-0.2.2/config.log
Here is an extract of my build output :

>>> libtirpc 0.2.2 Configuring
(cd /wix/buildroot/output/build/libtirpc-0.2.2/ && rm -rf config.cache
&& PATH="/wix/buildroot/output/host/bin:/wix/buildroot/output/host/usr/bin:/wix/buildroot/output/host/usr/sbin/:/home/ard/ccache:/opt/ros_addons/orocos_toolchain/orogen/bin:/opt/ros_addons/orocos_toolchain/.gems/bin:/opt/ros/ros/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
AR="/wix/buildroot/output/host/usr/bin/i686-linux-ar"
AS="/wix/buildroot/output/host/usr/bin/i686-linux-as"
LD="/wix/buildroot/output/host/usr/bin/i686-linux-ld"
NM="/wix/buildroot/output/host/usr/bin/i686-linux-nm"
CC="/wix/buildroot/output/host/usr/bin/i686-linux-gcc"
GCC="/wix/buildroot/output/host/usr/bin/i686-linux-gcc"
CPP="/wix/buildroot/output/host/usr/bin/i686-linux-cpp"
CXX="/wix/buildroot/output/host/usr/bin/i686-linux-g++"
FC="/wix/buildroot/output/host/usr/bin/i686-linux-gfortran"
RANLIB="/wix/buildroot/output/host/usr/bin/i686-linux-ranlib"
READELF="/wix/buildroot/output/host/usr/bin/i686-linux-readelf"
STRIP="/wix/buildroot/output/host/usr/bin/i686-linux-strip"
OBJCOPY="/wix/buildroot/output/host/usr/bin/i686-linux-objcopy"
OBJDUMP="/wix/buildroot/output/host/usr/bin/i686-linux-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/home/ard/ccache/gcc"
GCC_FOR_BUILD="/home/ard/ccache/gcc"
CXX_FOR_BUILD="/home/ard/ccache/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/wix/buildroot/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2 -I/wix/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2 -I/wix/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/wix/buildroot/output/host/lib
-L/wix/buildroot/output/host/usr/lib
-Wl,-rpath,/wix/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/wix/buildroot/output/host/usr/bin/i686-linux-as"
DEFAULT_LINKER="/wix/buildroot/output/host/usr/bin/i686-linux-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/wix/buildroot/output/host/usr/bin/pkg-config"
PERLLIB="/wix/buildroot/output/host/usr/lib/perl"
STAGING_DIR="/wix/buildroot/output/host/usr/i686-buildroot-linux-uclibc/sysroot"
ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -DGQ" ./configure
--target=i686-buildroot-linux-uclibc
--host=i686-buildroot-linux-uclibc --build=i686-pc-linux-gnu
--prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix=""
--disable-gtk-doc   --enable-ipv6 --enable-static --enable-shared   )
configure: WARNING: unrecognized options: --disable-gtk-doc, --enable-ipv6
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for i686-buildroot-linux-uclibc-strip...
/wix/buildroot/output/host/usr/bin/i686-linux-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for style of include used by make... GNU
checking for i686-buildroot-linux-uclibc-gcc...
/wix/buildroot/output/host/usr/bin/i686-linux-gcc
checking whether the C compiler works... no
configure: error: in `/wix/buildroot/output/build/libtirpc-0.2.2':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: *** [/wix/buildroot/output/build/libtirpc-0.2.2/.stamp_configured]
Error 77
-------------- next part --------------
wlambert at vDevEmbTech:~/workspace_nfs/cfederation/common/cle/sources/federation/libfederationC$ cat config.log 
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by libtirpc configure 0.2.2, which was
generated by GNU Autoconf 2.68.  Invocation command line was

  $ ./configure --target=i686-buildroot-linux-uclibc --host=i686-buildroot-linux-uclibc --build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix= --disable-gtk-doc --enable-ipv6 --enable-static --enable-shared

## --------- ##
## Platform. ##
## --------- ##

hostname = ard-host
uname -m = i686
uname -r = 2.6.38.8-vm-10.2
uname -s = Linux
uname -v = #4 SMP PREEMPT Thu Dec 13 21:36:16 CET 2012

/usr/bin/uname -p = unknown
/bin/uname -X     = unknown

/bin/arch              = unknown
/usr/bin/arch -k       = unknown
/usr/convex/getsysinfo = unknown
/usr/bin/hostinfo      = unknown
/bin/machine           = unknown
/usr/bin/oslevel       = unknown
/bin/universe          = unknown

PATH: /wix/buildroot/output/host/bin
PATH: /wix/buildroot/output/host/usr/bin
PATH: /wix/buildroot/output/host/usr/sbin/
PATH: /home/ard/ccache
PATH: /opt/ros_addons/orocos_toolchain/orogen/bin
PATH: /opt/ros_addons/orocos_toolchain/.gems/bin
PATH: /opt/ros/ros/bin
PATH: /usr/local/bin
PATH: /usr/bin
PATH: /bin
PATH: /usr/local/games
PATH: /usr/games


## ----------- ##
## Core tests. ##
## ----------- ##

configure:2243: checking for a BSD-compatible install
configure:2311: result: /usr/bin/install -c
configure:2322: checking whether build environment is sane
configure:2372: result: yes
configure:2421: checking for i686-buildroot-linux-uclibc-strip
configure:2448: result: /wix/buildroot/output/host/usr/bin/i686-linux-strip
configure:2513: checking for a thread-safe mkdir -p
configure:2552: result: /bin/mkdir -p
configure:2565: checking for gawk
configure:2581: found /usr/bin/gawk
configure:2592: result: gawk
configure:2603: checking whether make sets $(MAKE)
configure:2625: result: yes
configure:2706: checking whether to enable maintainer-specific portions of Makefiles
configure:2715: result: no
configure:2743: checking for style of include used by make
configure:2771: result: GNU
configure:2802: checking for i686-buildroot-linux-uclibc-gcc
configure:2829: result: /wix/buildroot/output/host/usr/bin/i686-linux-gcc
configure:3098: checking for C compiler version
configure:3107: /wix/buildroot/output/host/usr/bin/i686-linux-gcc --version >&5
i686-linux-gcc (Buildroot 2012.11-svn19-dirty) 4.6.3
Copyright (C) 2011 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:3118: $? = 0
configure:3107: /wix/buildroot/output/host/usr/bin/i686-linux-gcc -v >&5
Using built-in specs.
COLLECT_GCC=/wix/toolchain/i686_buildroot/bin/i686-linux-gcc
COLLECT_LTO_WRAPPER=/wix/toolchain/i686_buildroot/bin/../libexec/gcc/i686-buildroot-linux-uclibc/4.6.3/lto-wrapper
Target: i686-buildroot-linux-uclibc
Configured with: /wix/buildroot/output/toolchain/gcc-4.6.3/configure --prefix=/wix/buildroot/output/host/usr --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu --target=i686-buildroot-linux-uclibc --enable-languages=c,c++ --with-sysroot=/wix/buildroot/output/host/usr/i686-buildroot-linux-uclibc/sysroot --with-build-time-tools=/wix/buildroot/output/host/usr/i686-buildroot-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --disable-libgomp --with-gnu-ld --disable-libssp --disable-multilib --enable-tls --enable-shared --with-gmp=/wix/buildroot/output/host/usr --with-mpfr=/wix/buildroot/output/host/usr --with-mpc=/wix/buildroot/output/host/usr --enable-threads --disable-decimal-float --with-arch=pentiumpro --with-tune=pentiumpro --with-pkgversion='Buildroot 2012.11-svn19-dirty' --with-bugurl=http://bugs.buildroot.net/
Thread model: posix
gcc version 4.6.3 (Buildroot 2012.11-svn19-dirty) 
configure:3118: $? = 0
configure:3107: /wix/buildroot/output/host/usr/bin/i686-linux-gcc -V >&5
i686-linux-gcc: error: unrecognized option '-V'
i686-linux-gcc: fatal error: no input files
compilation terminated.
configure:3118: $? = 1
configure:3107: /wix/buildroot/output/host/usr/bin/i686-linux-gcc -qversion >&5
i686-linux-gcc: error: unrecognized option '-qversion'
i686-linux-gcc: fatal error: no input files
compilation terminated.
configure:3118: $? = 1
configure:3138: checking whether the C compiler works
configure:3160: /wix/buildroot/output/host/usr/bin/i686-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DGQ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  >&5
/wix/toolchain/i686_buildroot/bin/../libexec/gcc/i686-buildroot-linux-uclibc/4.6.3/cc1: error while loading shared libraries: libmpc.so.3: cannot open shared object file: No such file or directory
configure:3164: $? = 1
configure:3202: result: no
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "libtirpc"
| #define PACKAGE_TARNAME "libtirpc"
| #define PACKAGE_VERSION "0.2.2"
| #define PACKAGE_STRING "libtirpc 0.2.2"
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE_URL ""
| #define PACKAGE "libtirpc"
| #define VERSION "0.2.2"
| /* end confdefs.h.  */
| 
| int
| main ()
| {
| 
|   ;
|   return 0;
| }
configure:3207: error: in `/wix/buildroot/output/build/libtirpc-0.2.2':
configure:3210: error: C compiler cannot create executables
See `config.log' for more details

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv_c_bigendian='no'
ac_cv_env_CC_set='set'
ac_cv_env_CC_value='/wix/buildroot/output/host/usr/bin/i686-linux-gcc'
ac_cv_env_CFLAGS_set='set'
ac_cv_env_CFLAGS_value='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DGQ'
ac_cv_env_CPPFLAGS_set='set'
ac_cv_env_CPPFLAGS_value='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64'
ac_cv_env_CPP_set='set'
ac_cv_env_CPP_value='/wix/buildroot/output/host/usr/bin/i686-linux-cpp'
ac_cv_env_GSSGLUE_CFLAGS_set=''
ac_cv_env_GSSGLUE_CFLAGS_value=''
ac_cv_env_GSSGLUE_LIBS_set=''
ac_cv_env_GSSGLUE_LIBS_value=''
ac_cv_env_LDFLAGS_set='set'
ac_cv_env_LDFLAGS_value=''
ac_cv_env_LIBS_set=''
ac_cv_env_LIBS_value=''
ac_cv_env_PKG_CONFIG_LIBDIR_set=''
ac_cv_env_PKG_CONFIG_LIBDIR_value=''
ac_cv_env_PKG_CONFIG_PATH_set=''
ac_cv_env_PKG_CONFIG_PATH_value=''
ac_cv_env_PKG_CONFIG_set='set'
ac_cv_env_PKG_CONFIG_value='/wix/buildroot/output/host/usr/bin/pkg-config'
ac_cv_env_build_alias_set='set'
ac_cv_env_build_alias_value='i686-pc-linux-gnu'
ac_cv_env_host_alias_set='set'
ac_cv_env_host_alias_value='i686-buildroot-linux-uclibc'
ac_cv_env_target_alias_set='set'
ac_cv_env_target_alias_value='i686-buildroot-linux-uclibc'
ac_cv_func_calloc_0_nonnull='yes'
ac_cv_func_malloc_0_nonnull='yes'
ac_cv_func_memcmp_working='yes'
ac_cv_func_mmap_fixed_mapped='yes'
ac_cv_func_realloc_0_nonnull='yes'
ac_cv_have_decl_malloc='yes'
ac_cv_lbl_unaligned_fail='no'
ac_cv_path_install='/usr/bin/install -c'
ac_cv_path_mkdir='/bin/mkdir'
ac_cv_prog_AWK='gawk'
ac_cv_prog_CC='/wix/buildroot/output/host/usr/bin/i686-linux-gcc'
ac_cv_prog_STRIP='/wix/buildroot/output/host/usr/bin/i686-linux-strip'
ac_cv_prog_make_make_set='yes'
gl_cv_func_malloc_0_nonnull='yes'
lt_cv_sys_lib_search_path_spec=''

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL='${SHELL} /wix/buildroot/output/build/libtirpc-0.2.2/missing --run aclocal-1.11'
AMDEPBACKSLASH='\'
AMDEP_FALSE='#'
AMDEP_TRUE=''
AMTAR='$${TAR-tar}'
AR='/wix/buildroot/output/host/usr/bin/i686-linux-ar'
AUTOCONF='${SHELL} /wix/buildroot/output/build/libtirpc-0.2.2/missing --run autoconf'
AUTOHEADER='${SHELL} /wix/buildroot/output/build/libtirpc-0.2.2/missing --run autoheader'
AUTOMAKE='${SHELL} /wix/buildroot/output/build/libtirpc-0.2.2/missing --run automake-1.11'
AWK='gawk'
CC='/wix/buildroot/output/host/usr/bin/i686-linux-gcc'
CCDEPMODE=''
CC_FOR_BUILD='/home/ard/ccache/gcc'
CFLAGS='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DGQ'
CPP='/wix/buildroot/output/host/usr/bin/i686-linux-cpp'
CPPFLAGS='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64'
CROSS_COMPILING_FALSE=''
CROSS_COMPILING_TRUE=''
CYGPATH_W='echo'
DEFS=''
DEPDIR='.deps'
DSYMUTIL=''
DUMPBIN=''
ECHO_C=''
ECHO_N='-n'
ECHO_T=''
EGREP=''
EXEEXT=''
FGREP=''
GREP=''
GSSGLUE_CFLAGS=''
GSSGLUE_LIBS=''
GSS_FALSE=''
GSS_TRUE=''
INSTALL_DATA='${INSTALL} -m 644'
INSTALL_PROGRAM='${INSTALL}'
INSTALL_SCRIPT='${INSTALL}'
INSTALL_STRIP_PROGRAM='$(install_sh) -c -s'
LD='/wix/buildroot/output/host/usr/bin/i686-linux-ld'
LDFLAGS=''
LIBOBJS=''
LIBS=''
LIBTOOL=''
LIPO=''
LN_S=''
LTLIBOBJS=''
MAINT='#'
MAINTAINER_MODE_FALSE=''
MAINTAINER_MODE_TRUE='#'
MAKEINFO='${SHELL} /wix/buildroot/output/build/libtirpc-0.2.2/missing --run makeinfo'
MKDIR_P='/bin/mkdir -p'
NM='/wix/buildroot/output/host/usr/bin/i686-linux-nm'
NMEDIT=''
OBJDUMP='/wix/buildroot/output/host/usr/bin/i686-linux-objdump'
OBJEXT=''
OTOOL64=''
OTOOL=''
PACKAGE='libtirpc'
PACKAGE_BUGREPORT=''
PACKAGE_NAME='libtirpc'
PACKAGE_STRING='libtirpc 0.2.2'
PACKAGE_TARNAME='libtirpc'
PACKAGE_URL=''
PACKAGE_VERSION='0.2.2'
PATH_SEPARATOR=':'
PKG_CONFIG='/wix/buildroot/output/host/usr/bin/pkg-config'
PKG_CONFIG_LIBDIR=''
PKG_CONFIG_PATH=''
RANLIB='/wix/buildroot/output/host/usr/bin/i686-linux-ranlib'
SED=''
SET_MAKE=''
SHELL='/bin/bash'
STRIP='/wix/buildroot/output/host/usr/bin/i686-linux-strip'
VERSION='0.2.2'
ac_ct_CC=''
ac_ct_DUMPBIN=''
am__EXEEXT_FALSE=''
am__EXEEXT_TRUE=''
am__fastdepCC_FALSE=''
am__fastdepCC_TRUE=''
am__include='include'
am__isrc=''
am__leading_dot='.'
am__nodep='_no'
am__quote=''
am__tar='$${TAR-tar} chof - "$$tardir"'
am__untar='$${TAR-tar} xf -'
bindir='${exec_prefix}/bin'
build='i686-pc-linux-gnu'
build_alias='i686-pc-linux-gnu'
build_cpu=''
build_os=''
build_vendor=''
datadir='${datarootdir}'
datarootdir='${prefix}/share'
docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
dvidir='${docdir}'
exec_prefix='/usr'
host='i686-buildroot-linux-uclibc'
host_alias='i686-buildroot-linux-uclibc'
host_cpu=''
host_os=''
host_vendor=''
htmldir='${docdir}'
includedir='${prefix}/include'
infodir='${datarootdir}/info'
install_sh='${SHELL} /wix/buildroot/output/build/libtirpc-0.2.2/install-sh'
libdir='${exec_prefix}/lib'
libexecdir='${exec_prefix}/libexec'
localedir='${datarootdir}/locale'
localstatedir='${prefix}/var'
mandir='${datarootdir}/man'
mkdir_p='/bin/mkdir -p'
oldincludedir='/usr/include'
pdfdir='${docdir}'
prefix='/usr'
program_transform_name='s&^&&'
psdir='${docdir}'
sbindir='${exec_prefix}/sbin'
sharedstatedir='${prefix}/com'
sysconfdir='/etc'
target_alias='i686-buildroot-linux-uclibc'

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME "libtirpc"
#define PACKAGE_TARNAME "libtirpc"
#define PACKAGE_VERSION "0.2.2"
#define PACKAGE_STRING "libtirpc 0.2.2"
#define PACKAGE_BUGREPORT ""
#define PACKAGE_URL ""
#define PACKAGE "libtirpc"
#define VERSION "0.2.2"

configure: exit 77
