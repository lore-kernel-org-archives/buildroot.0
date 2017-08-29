From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Aug 2017 07:58:58 +0000
Subject: [Buildroot] [Bug 10261] Grub2 fails to build for x86_64
In-Reply-To: <bug-10261-163@https.bugs.busybox.net/>
References: <bug-10261-163@https.bugs.busybox.net/>
Message-ID: <bug-10261-163-vXEvUvlA6L@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10261

Dr I J Ormshaw <ian_ormshaw@waters.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |major

--- Comment #1 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
Configuration detail:

>>> grub2 2.02 Configuring
(cd /home/ian/projects/dev/builds/x86_64-5006295/buildroot/build/grub2-2.02/ &&
rm -rf config.cache &&
PATH="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin:/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/sbin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/ian/.local/bin:/home/ian/bin"
AR="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-ar"
AS="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-as"
LD="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-ld"
NM="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-nm"
CC="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-gcc"
GCC="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-gcc"
CPP="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-cpp"
CXX="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-g++"
FC="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-gfortran"
F77="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-gfortran"
RANLIB="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-ranlib"
READELF="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-readelf"
STRIP="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-strip"
OBJCOPY="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-objcopy"
OBJDUMP="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc"
GCC_FOR_BUILD="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc"
CXX_FOR_BUILD="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/include"
LDFLAGS_FOR_BUILD="-L/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/lib
-Wl,-rpath,/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-as"
DEFAULT_LINKER="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 
-fstack-protector-all" CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -O2  -fstack-protector-all -fstack-protector-all"
LDFLAGS="" FCFLAGS=" -O2  -fstack-protector-all" FFLAGS=" -O2 
-fstack-protector-all"
PKG_CONFIG="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/pkg-config"
STAGING_DIR="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/x86_64-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl ac_cv_lbl_unaligned_fail=no
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes
ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes
ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec=""
ac_cv_c_bigendian=no 
PATH="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin:/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/sbin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/ian/.local/bin:/home/ian/bin"
PKG_CONFIG="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/lib/pkgconfig:/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc"
GCC="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc"
CXX="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy"
RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/include"
CFLAGS="-O2
-I/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/include"
CXXFLAGS="-O2
-I/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/include"
LDFLAGS="-L/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/lib
-Wl,-rpath,/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/lib"
INTLTOOL_PERL=/usr/bin/perl
CPP="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc -E"
TARGET_CC="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-gcc"
TARGET_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -O2  -fstack-protector-all" TARGET_CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" TARGET_LDFLAGS=""
NM="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-nm"
OBJCOPY="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-objcopy"
STRIP="/home/ian/projects/dev/builds/x86_64-5006295/buildroot/host/bin/x86_64-buildroot-linux-gnu-strip"
CONFIG_SITE=/dev/null ./configure --target=x86_64-buildroot-linux-gnu
--host=x86_64-buildroot-linux-gnu --build=x86_64-pc-linux-gnu --prefix=/usr
--exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var --program-prefix=""
--disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs
--disable-documentation --with-xmlto=no --with-fop=no
--disable-dependency-tracking --enable-ipv6 --disable-nls --disable-static
--enable-shared  --target=x86_64 --with-platform=efi --prefix=/ --exec-prefix=/
--disable-grub-mkfont --enable-efiemu=no ac_cv_lib_lzma_lzma_code=no
--enable-device-mapper=no --enable-libzfs=no --disable-werror )
configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation,
--with-xmlto, --with-fop, --enable-ipv6, --disable-static, --enable-shared
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-buildroot-linux-gnu
checking target system type... x86_64-pc-none

-- 
You are receiving this mail because:
You are on the CC list for the bug.
