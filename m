From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Sep 2018 02:25:43 +0000
Subject: [Buildroot] [Bug 11351] New: build root-2018-08,
 linaro aarch64 compile error
Message-ID: <bug-11351-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11351

            Bug ID: 11351
           Summary: build root-2018-08, linaro aarch64 compile error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: 1989wanghang at 163.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Should I change the version of linaro gcc? Following is the full compile log:

lzip-1.20.tar.gz: OK (sha256:
c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c)
>>> host-lzip 1.20 Extracting
gzip -d -c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/dl/lzip/lzip-1.20.tar.gz |
tar --strip-components=1 -C
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/host-lzip-1.20  
-xf -
>>> host-lzip 1.20 Patching
>>> host-lzip 1.20 Configuring
(cd
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/host-lzip-1.20;
PATH="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/sbin:/home/wangh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/wangh/bin"
PKG_CONFIG="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib/pkgconfig:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/pkgconfig"
./configure
--prefix=/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host
PATH="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/sbin:/home/wangh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/wangh/bin"
PKG_CONFIG="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib/pkgconfig:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp"
OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include"
CFLAGS="-O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include"
CXXFLAGS="-O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include"
LDFLAGS="-L/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib
-Wl,-rpath,/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib"
INTLTOOL_PERL=/usr/bin/perl CC="/usr/bin/gcc" CXX="/usr/bin/g++")

creating config.status
creating Makefile
VPATH = .
prefix = /home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
datarootdir = $(prefix)/share
infodir = $(datarootdir)/info
mandir = $(datarootdir)/man
CXX = /usr/bin/g++
CPPFLAGS =
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include
CXXFLAGS = -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include
LDFLAGS = -L/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib
-Wl,-rpath,/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib
OK. Now you can run make.
>>> host-lzip 1.20 Building
PATH="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/sbin:/home/wangh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/wangh/bin"
PKG_CONFIG="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib/pkgconfig:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/pkgconfig"
/usr/local/bin/make  -C
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/host-lzip-1.20
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
arg_parser.o arg_parser.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
file_index.o file_index.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
list.o list.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
encoder_base.o encoder_base.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
encoder.o encoder.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
fast_encoder.o fast_encoder.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -c -o
decoder.o decoder.cc
/usr/bin/g++
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include
-DPROGVERSION=\"1.20\" -c -o main.o main.cc
/usr/bin/g++
-L/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib
-Wl,-rpath,/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib
-O2 -I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include -o
lzip arg_parser.o file_index.o list.o encoder_base.o encoder.o fast_encoder.o
decoder.o main.o
>>> host-lzip 1.20 Installing to host directory
PATH="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/sbin:/home/wangh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/wangh/bin"
PKG_CONFIG="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib/pkgconfig:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/pkgconfig"
/usr/local/bin/make  -C
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/host-lzip-1.20
install
if [ ! -d "/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin" ]
; then install -d -m 755
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin" ; fi
if [ ! -d
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/info" ] ;
then install -d -m 755
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/info" ; fi
if [ ! -d
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/man/man1"
] ; then install -d -m 755
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/man/man1"
; fi
install -m 755 ./lzip
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/lzip"
rm -f
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/info/lzip.info"*
rm -f
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/man/man1/lzip.1"*
install -m 644 ./doc/lzip.info
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/info/lzip.info"
install -m 644 ./doc/lzip.1
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/man/man1/lzip.1"
if /bin/sh -c "install-info --version" > /dev/null 2>&1 ; then \
                install-info
--info-dir="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/info"
"/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/info/lzip.info"
; \
        fi
>>> skeleton-init-common  Extracting
>>> skeleton-init-common  Patching
>>> skeleton-init-common  Configuring
>>> skeleton-init-common  Building
>>> skeleton-init-common  Installing to staging directory
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude
.bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~'
system/skeleton/
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/bin
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/sbin
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/lib
ln -snf lib
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/lib64
ln -snf lib
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib64
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include
>>> skeleton-init-common  Fixing libtool files
>>> skeleton-init-common  Installing to target
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude
.bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~'
system/skeleton/
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/bin
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/sbin
/usr/bin/install -d -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/lib
ln -snf lib
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/lib64
ln -snf lib
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/usr/lib64
/usr/bin/install -m 0644 support/misc/target-dir-warning.txt
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
>>> skeleton-init-sysv  Extracting
>>> skeleton-init-sysv  Patching
>>> skeleton-init-sysv  Configuring
>>> skeleton-init-sysv  Building
>>> skeleton-init-sysv  Installing to target
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude
.bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~'
package/skeleton-init-sysv//skeleton/
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/target/
>>> skeleton  Extracting
>>> skeleton  Patching
>>> skeleton  Configuring
>>> skeleton  Building
>>> skeleton  Installing to target
gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz: OK (sha256:
73eed74e593e2267504efbcf3678918bb22409ab7afa3dc7c135d2c6790c2345)
>>> toolchain-external-linaro-aarch64 2018.05 Extracting
xzcat
/home/wangh/CVR/video/buildroot/buildroot-2018.08/dl/toolchain-external-linaro-aarch64/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
| tar --strip-components=1 -C
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/toolchain-external-linaro-aarch64-2018.05
--exclude='usr/lib/locale/*'   -xf -
rm -rf
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/opt/ext-toolchain
mkdir -p
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/opt/ext-toolchain
mv
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/toolchain-external-linaro-aarch64-2018.05/*
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/opt/ext-toolchain/
>>> toolchain-external-linaro-aarch64 2018.05 Patching
>>> toolchain-external-linaro-aarch64 2018.05 Configuring
f951: Warning: Reading file ?<stdin>? as free form
>>> toolchain-external-linaro-aarch64 2018.05 Building
/usr/bin/gcc -O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include
-DBR_CPU='"cortex-a35"' -DBR_ABI='"lp64"' -DBR_CROSS_PATH_SUFFIX='""'
-DBR_CROSS_PATH_REL='"opt/ext-toolchain/bin"'
-DBR_SYSROOT='"aarch64-buildroot-linux-gnu/sysroot"' -DBR_ADDITIONAL_CFLAGS=''
-s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/toolchain-external-linaro-aarch64-2018.05/toolchain-wrapper
>>> toolchain-external-linaro-aarch64 2018.05 Installing to staging directory
/usr/bin/install -D -m 0755
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/toolchain-external-linaro-aarch64-2018.05/toolchain-wrapper
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/toolchain-wrapper
>>> toolchain-external-linaro-aarch64 2018.05 Copying external toolchain sysroot to staging...
>>> toolchain-external-linaro-aarch64 2018.05 Installing gdbinit
>>> toolchain-external-linaro-aarch64 2018.05 Fixing libtool files
>>> toolchain-external-linaro-aarch64 2018.05 Installing to target
>>> toolchain-external-linaro-aarch64 2018.05 Copying external toolchain libraries to target...
>>> toolchain-external-linaro-aarch64 2018.05 Copying gdbserver
>>> toolchain-external  Extracting
>>> toolchain-external  Patching
>>> toolchain-external  Configuring
>>> toolchain-external  Building
>>> toolchain-external  Installing to target
>>> toolchain  Extracting
>>> toolchain  Patching
>>> toolchain  Configuring
>>> toolchain  Building
>>> toolchain  Installing to staging directory
sed -e 's#@@STAGING_SUBDIR@@#aarch64-buildroot-linux-gnu/sysroot#' -e
's#@@TARGET_CFLAGS@@#-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro
-D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os#' -e 's#@@TARGET_CXXFLAGS@@#-fstack-protector-all
-fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os#' -e
's#@@TARGET_FCFLAGS@@#-Os#' -e 's#@@TARGET_LDFLAGS@@#-pie#' -e
's#@@TARGET_CC@@#bin/aarch64-linux-gnu-gcc#' -e
's#@@TARGET_CXX@@#bin/aarch64-linux-gnu-g++#' -e
's#@@TARGET_FC@@#bin/aarch64-linux-gnu-gfortran#' -e
's#@@CMAKE_SYSTEM_PROCESSOR@@#aarch64#' -e 's#@@TOOLCHAIN_HAS_FORTRAN@@#1#' -e
's#@@CMAKE_BUILD_TYPE@@#Release#'
/home/wangh/CVR/video/buildroot/buildroot-2018.08/support/misc/toolchainfile.cmake.in
>
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/share/buildroot/toolchainfile.cmake
>>> toolchain  Fixing libtool files
>>> toolchain  Installing to target
zlib-1.2.11.tar.xz: OK (sha256:
4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066)
>>> libzlib 1.2.11 Extracting
xzcat
/home/wangh/CVR/video/buildroot/buildroot-2018.08/dl/libzlib/zlib-1.2.11.tar.xz
| tar --strip-components=1 -C
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/libzlib-1.2.11  
-xf -
>>> libzlib 1.2.11 Patching
>>> libzlib 1.2.11 Configuring
(cd
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/libzlib-1.2.11;
rm -rf config.cache; ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes
ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes
ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec=""
ac_cv_c_bigendian=no 
PATH="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/sbin:/home/wangh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/wangh/bin"
AR="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-ar"
AS="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-as"
LD="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-ld"
NM="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-nm"
CC="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc"
GCC="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc"
CPP="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-cpp"
CXX="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-g++"
FC="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gfortran"
F77="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gfortran"
RANLIB="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-ranlib"
READELF="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-readelf"
STRIP="/bin/true"
OBJCOPY="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-objcopy"
OBJDUMP="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib
-Wl,-rpath,/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-as"
DEFAULT_LINKER="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-ld"
CPPFLAGS="-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro
-D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-fstack-protector-all -fPIE -Wl,-z,now
-Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os " CXXFLAGS="-fstack-protector-all -fPIE -Wl,-z,now
-Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os " LDFLAGS=" -pie" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/pkg-config"
STAGING_DIR="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl CFLAGS="-fstack-protector-all -fPIE -Wl,-z,now
-Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -fPIC" ./configure --shared --prefix=/usr )
Checking for shared library support...
Building shared library libz.so.1.2.11 with
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc.
Checking for size_t... Yes.
Checking for off64_t... Yes.
Checking for fseeko... Yes.
Checking for strerror... Yes.
Checking for unistd.h... Yes.
Checking for stdarg.h... Yes.
Checking whether to use vs[n]printf() or s[n]printf()... using vs[n]printf().
Checking for vsnprintf() in stdio.h... Yes.
Checking for return value of vsnprintf()... Yes.
Checking for attribute(visibility) support... Yes.
>>> libzlib 1.2.11 Building
PATH="/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin:/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/sbin:/home/wangh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/wangh/bin"
/usr/local/bin/make -j1 -C
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/libzlib-1.2.11
make[4]: ??: ? make ??? -jN: ?? jobserver ???
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -I. -c -o example.o test/example.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o adler32.o adler32.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o crc32.o crc32.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o deflate.o deflate.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o infback.o infback.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o inffast.o inffast.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o inflate.o inflate.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o inftrees.o inftrees.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o trees.o trees.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o zutil.o zutil.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o compress.o compress.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o uncompr.o uncompr.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzclose.o gzclose.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzlib.o gzlib.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzread.o gzread.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzwrite.o gzwrite.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-ar
rc libz.a adler32.o crc32.o deflate.o infback.o inffast.o inflate.o inftrees.o
trees.o zutil.o compress.o uncompr.o gzclose.o gzlib.o gzread.o gzwrite.o
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o example example.o -L. libz.a
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -I. -c -o minigzip.o test/minigzip.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o minigzip minigzip.o -L. libz.a
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/adler32.o
adler32.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/crc32.o crc32.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/deflate.o
deflate.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/infback.o
infback.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/inffast.o
inffast.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/inflate.o
inflate.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/inftrees.o
inftrees.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/trees.o trees.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/zutil.o zutil.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/compress.o
compress.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/uncompr.o
uncompr.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzclose.o
gzclose.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzlib.o gzlib.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzread.o gzread.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzwrite.o
gzwrite.c
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/bin/aarch64-linux-gnu-gcc
-shared -Wl,-soname,libz.so.1,--version-script,zlib.map -fstack-protector-all
-fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -fPIC -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o libz.so.1.2.11 adler32.lo crc32.lo
deflate.lo infback.lo inffast.lo inflate.lo inftrees.lo trees.lo zutil.lo
compress.lo uncompr.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo  -lc -pie
/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/Scrt1.o?????_start???
/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/aarch64-linux-gnu/snapshots/glibc.git~release~2.25~master/csu/../sysdeps/aarch64/start.S:64???main???????
/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/aarch64-linux-gnu/snapshots/glibc.git~release~2.25~master/csu/../sysdeps/aarch64/start.S:65???main???????
collect2: error: ld returned 1 exit status
make[4]: *** [libz.so.1.2.11] ?? 1
make[3]: ***
[/home/wangh/CVR/video/buildroot/buildroot-2018.08/output/build/libzlib-1.2.11/.stamp_built]
?? 2
make[2]: *** [/home/wangh/CVR/video/out/build/buildroot/.stamp_built] ?? 2
make[1]: *** [_all] ?? 2
make: *** [_all] ?? 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
