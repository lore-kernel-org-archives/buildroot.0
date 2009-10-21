From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Oct 2009 12:29:52 +0200
Subject: [Buildroot] building toolchain fails
Message-ID: <598EFF531CAB4EC0A53CDCCD0CF8AC77@apexjs>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi
 
i used the 2009.08 on 2 systems without problems and i decided to give the
latest version a try:
 
I failed in building on both machines :
 
on my debian i ended up with :
 
....
configure: error: C compiler cannot create executables
make: *** [/home/johan/buildroot/output/build/ncurses-5.6/.configured] Error
77
 
gcc is on the path, 
 under buildroot/output/build/staging_dir/usr/bin there is a softlink of
arm-linux-gcc   pointing to executable ccache   ???
 
 under buildroot/output/build/staging_dir/usr/bin-ccache there is a softlink
arm-linux-gcc   pointing to executable arm-linux-uclibc-gcc (this seems to
be the cottect compiler )
 
 
 
on my ubuntu 8.10 machine i ended with an error : error: no acceptable m4
could be found in $PATH.
i have 1.4.11 on my system so that should be ok
 
I have seen Noel Vellemans also reporting this issue, but no solution yet..
 
Any clues ?
for now i patched my 2009.08 version to use 2.6.31.4 and bbox 1.15.2
 
Johan
 
Checking build system dependencies:
Overriding $(DL_DIR) in '.config'.  Ok
External download directory:   Ok (/home/johan/dl)
CC clean:     Ok
CXX clean:     Ok
CPP clean:     Ok
CFLAGS clean:     Ok
INCLUDES clean:     Ok
CXXFLAGS clean:     Ok
which installed:    Ok
sed works:     Ok (/bin/sed)
GNU make version '3.81':   Ok
C compiler '/usr/bin/gcc'
C compiler version '4.3.2':   Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.2':   Ok
awk installed:     Ok
bash installed:     Ok
bison installed:    Ok
flex installed:     Ok
gettext installed:    Ok
makeinfo installed:    Ok
patch installed:    Ok
Build system dependencies:   Ok
 
rm -rf /home/johan/buildroot/output/build/buildroot-config
mkdir -p /home/johan/buildroot/output/build
cp -dpRf package/config/buildroot-config
/home/johan/buildroot/output/build/buildroot-config
cp -dpf /home/johan/buildroot/output/build/u-boot-2009.06/tools/mkimage
/home/johan/buildroot/output/build/staging_dir/usr/bin/
[7m>>> autoconf 2.64 Configuring[27m
cd /home/johan/buildroot/output/build/autoconf-2.64/ && rm -f config.cache
&& \
 
PATH="/home/johan/buildroot/output/toolchain/bin:/home/johan/buildroot/outpu
t/host/bin:/home/johan/buildroot/output/host/usr/bin:/home/johan/buildroot/o
utput/build/staging_dir/bin:/home/johan/buildroot/output/build/staging_dir/u
sr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/gam
es:/home/johan/buildroot/build_arm/staging_dir/usr/bin"
AR="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-
ar"
AS="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-
as"
LD="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-
ld"
NM="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-
nm"
CC="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-
gcc -Os -pipe -O2
-I/home/johan/buildroot/output/build/staging_dir/usr/include
-I/home/johan/buildroot/output/build/staging_dir/include
--sysroot=/home/johan/buildroot/output/build/staging_dir/ -isysroot
/home/johan/buildroot/output/build/staging_dir -mabi=apcs-gnu
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
GCC="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc
-gcc -Os -pipe -O2
-I/home/johan/buildroot/output/build/staging_dir/usr/include
-I/home/johan/buildroot/output/build/staging_dir/include
--sysroot=/home/johan/buildroot/output/build/staging_dir/ -isysroot
/home/johan/buildroot/output/build/staging_dir -mabi=apcs-gnu
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CPP="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc
-cpp -Os -pipe -O2
-I/home/johan/buildroot/output/build/staging_dir/usr/include
-I/home/johan/buildroot/output/build/staging_dir/include
--sysroot=/home/johan/buildroot/output/build/staging_dir/ -isysroot
/home/johan/buildroot/output/build/staging_dir -mabi=apcs-gnu
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CXX="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc
-g++ -Os -pipe -O2
-I/home/johan/buildroot/output/build/staging_dir/usr/include
-I/home/johan/buildroot/output/build/staging_dir/include
--sysroot=/home/johan/buildroot/output/build/staging_dir/ -isysroot
/home/johan/buildroot/output/build/staging_dir -mabi=apcs-gnu
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
FC="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-
gfortran "
RANLIB="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-ucl
ibc-ranlib"
STRIP="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-ucli
bc-strip"
OBJCOPY="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uc
libc-objcopy" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/johan/buildroot/output/host/include
-I/home/johan/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/johan/buildroot/output/host/lib
-L/home/johan/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-ar"
AS_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-as"
CC_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-gcc"
LD_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-ld"
NM_FOR_TARGET="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-li
nux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/johan/buildroot/output/build/staging_dir/usr/bin/ar
m-linux-uclibc-as"
DEFAULT_LINKER="/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-l
inux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/johan/buildroot/output/build/staging_dir"
PKG_CONFIG="/home/johan/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/johan/buildroot/output/build/staging_dir/usr/lib/pkgc
onfig:" STAGING_DIR="/home/johan/buildroot/output/build/staging_dir" \
 ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
ac_cv_c_bigendian=no \
 CFLAGS="-Os -pipe -O2
-I/home/johan/buildroot/output/build/staging_dir/usr/include
-I/home/johan/buildroot/output/build/staging_dir/include
--sysroot=/home/johan/buildroot/output/build/staging_dir/ -isysroot
/home/johan/buildroot/output/build/staging_dir -mabi=apcs-gnu
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CXXFLAGS="-Os -pipe -O2
-I/home/johan/buildroot/output/build/staging_dir/usr/include
-I/home/johan/buildroot/output/build/staging_dir/include
--sysroot=/home/johan/buildroot/output/build/staging_dir/ -isysroot
/home/johan/buildroot/output/build/staging_dir -mabi=apcs-gnu
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
LDFLAGS="-L/home/johan/buildroot/output/build/staging_dir/lib
-L/home/johan/buildroot/output/build/staging_dir/usr/lib
--sysroot=/home/johan/buildroot/output/build/staging_dir/" FCFLAGS=""  \
 EMACS="no" \
 ./configure \
  --cache-file="/home/johan/buildroot/output/build/tgt-config.cache" \
  --target=arm-linux \
  --host=arm-linux \
  --build=i386-pc-linux-gnu \
  --prefix=/usr \
  --exec-prefix=/usr \
  --sysconfdir=/etc \
  --disable-gtk-doc \
   \
   \
   \
   
configure: loading cache /home/johan/buildroot/output/build/tgt-config.cache
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-linux-strip...
/home/johan/buildroot/output/build/staging_dir/usr/bin/arm-linux-uclibc-stri
p
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes
checking for expr... /usr/bin/expr
checking for GNU M4 that supports accurate traces... 
configure: WARNING: unrecognized options: --disable-gtk-doc
configure: error: no acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended
make: ***
[/home/johan/buildroot/output/build/autoconf-2.64/.stamp_configured] Error 1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091021/fd82d6d6/attachment-0001.htm>
