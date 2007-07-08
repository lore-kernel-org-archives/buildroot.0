From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 18:13:45 +0200 (CEST)
Subject: [Buildroot] package/ed fails with...
Message-ID: <0707081811150.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...

bzcat buildroot/dl/ed-0.6.tar.bz2 | tar -C buildroot/build_i486   -xf -
toolchain/patch-kernel.sh buildroot/build_i486/ed-0.6 package/ed/
ed-\*.patch
touch buildroot/build_i486/ed-0.6/.unpacked
(cd buildroot/build_i486/ed-0.6; rm -rf config.cache; \

PATH="buildroot/toolchain_build_i486/bin:buildroot/build_i486/staging_dir/bin:buildroot/build_i486/staging_dir/usr/bin:/home/cii/bin:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/X11R6/bin"
AR=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-ar
AS=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-as
LD="buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-ld
-Lbuildroot/build_i486/staging_dir/lib
-Lbuildroot/build_i486/staging_dir/usr/lib"
NM=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-nm
CC="buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -Os
-pipe  -Ibuildroot/build_i486/staging_dir/usr/include
--sysroot=buildroot/build_i486/staging_dir/ -isysroot
buildroot/build_i486/staging_dir"
GCC="buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -Os
-pipe  -Ibuildroot/build_i486/staging_dir/usr/include
--sysroot=buildroot/build_i486/staging_dir/ -isysroot
buildroot/build_i486/staging_dir"
CXX="buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-g++ -Os
-pipe  -Ibuildroot/build_i486/staging_dir/usr/include
--sysroot=buildroot/build_i486/staging_dir/ -isysroot
buildroot/build_i486/staging_dir"
CPP="buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-cpp -Os
-pipe  -Ibuildroot/build_i486/staging_dir/usr/include
--sysroot=buildroot/build_i486/staging_dir/ -isysroot
buildroot/build_i486/staging_dir"
RANLIB=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-ranlib
STRIP=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-strip
OBJCOPY=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-objcopy
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" LDFLAGS_FOR_BUILD=""
PKG_CONFIG_SYSROOT="buildroot/build_i486/staging_dir"
PKG_CONFIG="buildroot/build_i486/staging_dir/usr/bin/pkg-config" \
                ac_cv_lbl_unaligned_fail=no
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_c_bigendian=no \
                ./configure \
                --target=i486-linux \
                --host=i486-linux \
                --build=i386-pc-linux-gnu \
                --prefix=/usr \
                --exec-prefix=/usr \
                --disable-nls \
        );
configure: Unrecognized option: "--disable-nls"; use --help for usage.
make: *** [buildroot/build_i486/ed-0.6/.configured] Error 1


-- 
Cristian
