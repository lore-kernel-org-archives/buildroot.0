From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 Aug 2018 17:31:18 +0000
Subject: [Buildroot] [Bug 11206] New: zlib: fails to build with Linaro
 toolchain, BR2_RELRO_FULL=y and BR2_FORTIFY_SOURCE_2=y
Message-ID: <bug-11206-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11206

            Bug ID: 11206
           Summary: zlib: fails to build with Linaro toolchain,
                    BR2_RELRO_FULL=y and BR2_FORTIFY_SOURCE_2=y
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jan.kundrat at cesnet.cz
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot git (0f96073561 and some stuff on top of it which is not relevant
here)

$ make zlib                         
umask 0022 && make -C /home/jkt/work/cesnet/gerrit/github/buildroot/buildroot
O=/home/jkt/work/prog/_build/br-cfb/. zlib
PATH="/home/jkt/work/prog/_build/br-cfb/host/bin:/home/jkt/work/prog/_build/br-cfb/host/sbin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0:/usr/lib/llvm/6/bin:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin"
BR2_DL_DIR="/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/dl"
BUILD_DIR=/home/jkt/work/prog/_build/br-cfb/build
O=/home/jkt/work/prog/_build/br-cfb flock
/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/dl/libzlib/
support/download/dl-wrapper -c '1.2.11' -d
'/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/dl/libzlib' -D
'/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/dl' -f
'zlib-1.2.11.tar.xz' -H 'package/libzlib//libzlib.hash' -n 'libzlib-1.2.11' -N
'libzlib' -o
'/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/dl/libzlib/zlib-1.2.11.tar.xz'
 -u http+http://www.zlib.net -u
http\|urlencode+http://sources.buildroot.net/libzlib -u
http\|urlencode+http://sources.buildroot.net  -- 
zlib-1.2.11.tar.xz: OK (sha256:
4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066)
>>> libzlib 1.2.11 Extracting
xzcat
/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/dl/libzlib/zlib-1.2.11.tar.xz
| tar --strip-components=1 -C
/home/jkt/work/prog/_build/br-cfb/build/libzlib-1.2.11   -xf -
>>> libzlib 1.2.11 Patching
>>> libzlib 1.2.11 Configuring
(cd /home/jkt/work/prog/_build/br-cfb/build/libzlib-1.2.11; rm -rf
config.cache; ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no 
PATH="/home/jkt/work/prog/_build/br-cfb/host/bin:/home/jkt/work/prog/_build/br-cfb/host/sbin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0:/usr/lib/llvm/6/bin:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin"
AR="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-ar"
AS="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-as"
LD="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-ld"
NM="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-nm"
CC="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc"
GCC="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc"
CPP="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-cpp"
CXX="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-g++"
FC="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gfortran"
F77="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gfortran"
RANLIB="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-ranlib"
READELF="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-readelf"
STRIP="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-strip"
OBJCOPY="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-objcopy"
OBJDUMP="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0/gcc"
GCC_FOR_BUILD="/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0/gcc"
CXX_FOR_BUILD="/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0/g++"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/jkt/work/prog/_build/br-cfb/host/include"
CFLAGS_FOR_BUILD="-O2 -I/home/jkt/work/prog/_build/br-cfb/host/include"
CXXFLAGS_FOR_BUILD="-O2 -I/home/jkt/work/prog/_build/br-cfb/host/include"
LDFLAGS_FOR_BUILD="-L/home/jkt/work/prog/_build/br-cfb/host/lib
-Wl,-rpath,/home/jkt/work/prog/_build/br-cfb/host/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-as"
DEFAULT_LINKER="/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-ld"
CPPFLAGS="-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro
-D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-fstack-protector-strong -fPIE -Wl,-z,now
-Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g2" CXXFLAGS="-fstack-protector-strong -fPIE
-Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2" LDFLAGS=" -pie"
FCFLAGS=" -Os -g2" FFLAGS=" -Os -g2"
PKG_CONFIG="/home/jkt/work/prog/_build/br-cfb/host/bin/pkg-config"
STAGING_DIR="/home/jkt/work/prog/_build/br-cfb/host/arm-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl CFLAGS="-fstack-protector-strong -fPIE -Wl,-z,now
-Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC" ./configure --shared --prefix=/usr )
Checking for shared library support...
Building shared library libz.so.1.2.11 with
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc.
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
PATH="/home/jkt/work/prog/_build/br-cfb/host/bin:/home/jkt/work/prog/_build/br-cfb/host/sbin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0:/usr/lib/llvm/6/bin:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin"
/usr/bin/make -j1 -C /home/jkt/work/prog/_build/br-cfb/build/libzlib-1.2.11
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -I. -c -o example.o test/example.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o adler32.o adler32.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o crc32.o crc32.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o deflate.o deflate.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o infback.o infback.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o inffast.o inffast.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o inflate.o inflate.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o inftrees.o inftrees.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o trees.o trees.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o zutil.o zutil.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o compress.o compress.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o uncompr.o uncompr.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzclose.o gzclose.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzlib.o gzlib.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzread.o gzread.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -c -o gzwrite.o gzwrite.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-ar rc libz.a
adler32.o crc32.o deflate.o infback.o inffast.o inflate.o inftrees.o trees.o
zutil.o compress.o uncompr.o gzclose.o gzlib.o gzread.o gzwrite.o 
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o example example.o -L. libz.a
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -I. -c -o minigzip.o test/minigzip.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o minigzip minigzip.o -L. libz.a
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/adler32.o
adler32.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/crc32.o crc32.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/deflate.o
deflate.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/infback.o
infback.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/inffast.o
inffast.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/inflate.o
inflate.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/inftrees.o
inftrees.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/trees.o trees.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/zutil.o zutil.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/compress.o
compress.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/uncompr.o
uncompr.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzclose.o
gzclose.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzlib.o gzlib.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzread.o gzread.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc
-fstack-protector-strong -fPIE -Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC
-fPIC -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN  -DPIC -c -o objs/gzwrite.o
gzwrite.c
/home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc -shared
-Wl,-soname,libz.so.1,--version-script,zlib.map -fstack-protector-strong -fPIE
-Wl,-z,now -Wl,-z,relro -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -fPIC -fPIC
-D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o libz.so.1.2.11 adler32.lo crc32.lo
deflate.lo infback.lo inffast.lo inflate.lo inftrees.lo trees.lo zutil.lo
compress.lo uncompr.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo  -lc -pie
/home/jkt/work/prog/_build/br-cfb/host/arm-buildroot-linux-gnueabihf/sysroot/lib/Scrt1.o:
In function `_start':
/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/snapshots/glibc.git~release~2.25~master/csu/../sysdeps/arm/start.S:128:
undefined reference to `main'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:282: libz.so.1.2.11] Error 1
make[1]: *** [package/pkg-generic.mk:232:
/home/jkt/work/prog/_build/br-cfb/build/libzlib-1.2.11/.stamp_built] Error 2
make: *** [Makefile:16: _all] Error 2

Here is the majority of my config (I hope I removed only custom packages and
irrelevant settings):

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_NEON=y
BR2_ENABLE_DEBUG=y
BR2_STRIP_EXCLUDE_FILES="cla-* netopeer2* sysrepo* libsysrepo* libSysrepo*
libnetconf2* libyang*"
BR2_STRIP_EXCLUDE_DIRS="/usr/lib/libyang /usr/lib/sysrepo"
BR2_SSP_STRONG=y
BR2_RELRO_FULL=y
BR2_FORTIFY_SOURCE_2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_8_1=y
BR2_TARGET_GENERIC_HOSTNAME="czechlight"
BR2_TARGET_GENERIC_PASSWD_SHA256=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_PACKAGE_LINUX_TOOLS_GPIO=y
BR2_PACKAGE_LINUX_TOOLS_PERF=y
BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="$(BR2_EXTERNAL_CZECHLIGHT_PATH)/board/czechlight/common/busybox-config"
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_PV=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_MMC_UTILS=y
BR2_PACKAGE_SQUASHFS=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_PICOCOM=y
BR2_PACKAGE_SPI_TOOLS=y
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_LIBGPIOD_TOOLS=y
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_INOTIFY_TOOLS=y
BR2_PACKAGE_DDRESCUE=y
BR2_PACKAGE_RAUC=y
BR2_PACKAGE_RAUC_NETWORK=y
# BR2_PACKAGE_SYSTEMD_HWDB is not set
BR2_PACKAGE_VIM=y
# BR2_PACKAGE_VIM_RUNTIME is not set
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_GZIP=y
BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
BR2_TARGET_ROOTFS_TAR_XZ=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://gerrit.cesnet.cz/github/trini/u-boot"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="233719cc40"
BR2_TARGET_UBOOT_PATCH="$(BR2_EXTERNAL_CZECHLIGHT_PATH)/board/czechlight/clearfog/patches/u-boot/boot.patch"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="$(BR2_EXTERNAL_CZECHLIGHT_PATH)/board/czechlight/clearfog/uboot.fragment"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
# BR2_TARGET_UBOOT_FORMAT_BIN is not set
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
BR2_TARGET_UBOOT_BOOT_SCRIPT=y
BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="$(BR2_EXTERNAL_CZECHLIGHT_PATH)/board/czechlight/clearfog/boot.scr.txt"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

Stuff passed with a combination of _FORTIFY_SOURCE=1 and "Partial" relro.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
