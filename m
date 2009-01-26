From: Mitesh Gupta <guptamitesh@gmail.com>
Date: Mon, 26 Jan 2009 18:36:16 +0530
Subject: [Buildroot] Error encountered while doing make after adding u-boot
Message-ID: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I am using version 25049. I first did a make without including u-boot. Then
did a make after after including u-boot. I got the following error in doing
make :-

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.2.4':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.4':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /mnt/rootfs/buildroot/project_build_i686/uclibc/buildroot-config
mkdir -p /mnt/rootfs/buildroot/project_build_i686/uclibc
cp -dpRf package/config/buildroot-config
/mnt/rootfs/buildroot/project_build_i686/uclibc/buildroot-config
mkdir -p /mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc
echo "" > /mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc/issue
echo "" >> /mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc/issue
echo "Welcome to Buildroot" >>
/mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc/issue
mkdir -p /mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc
echo "uclibc" >
/mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc/hostname
mkdir -p /mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc
echo "2009.02-svn"-svn25049-dirty1
>/mnt/rootfs/buildroot/project_build_i686/uclibc/root/etc/br-version
rm -rf /mnt/rootfs/buildroot/project_build_i686/uclibc/root/usr/include
/mnt/rootfs/buildroot/project_build_i686/uclibc/root/usr/lib/pkgconfig
find /mnt/rootfs/buildroot/project_build_i686/uclibc/root/usr/lib -name
'*.a' -delete
find /mnt/rootfs/buildroot/project_build_i686/uclibc/root/lib -name '*.a'
-delete
find /mnt/rootfs/buildroot/project_build_i686/uclibc/root/usr/lib -name
'*.la' -delete
find /mnt/rootfs/buildroot/project_build_i686/uclibc/root/lib -name '*.la'
-delete
--18:31:11--  ftp://ftp.denx.de/pub/u-boot/u-boot-2008.10.tar.bz2
           => `/mnt/rootfs/buildroot/dl/u-boot-2008.10.tar.bz2'
Connecting to 172.31.1.227:3128... connected.
Proxy request sent, awaiting response... 200 OK
Length: 79,72,290 (7.6M) [application/octet-stream]

100%[============================================>] 79,72,290
57.98K/s    ETA 00:00

18:33:11 (70.97 KB/s) - `/mnt/rootfs/buildroot/dl/u-boot-2008.10.tar.bz2'
saved [7972290/7972290]

bzcat /mnt/rootfs/buildroot/dl/u-boot-2008.10.tar.bz2 \
                | tar -C /mnt/rootfs/buildroot/project_build_i686/uclibc
-xf -
mkdir -p /mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10
touch
/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10/.unpacked
toolchain/patch-kernel.sh
/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10
target/u-boot/2008.10 \
                u-boot-2008.10-\*.patch \
                u-boot-2008.10-\*.patch.i686
touch
/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10/.patched
touch
/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10/.header_copied
PATH="/mnt/rootfs/buildroot/toolchain_build_i686/bin:/mnt/rootfs/buildroot/build_i686/staging_dir/bin:/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar"
AS="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
LD="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
NM="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm"
CC="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os  -I/mnt/rootfs/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/build_i686/staging_dir -mtune=i686 -march=i686"
GCC="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os  -I/mnt/rootfs/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/build_i686/staging_dir -mtune=i686 -march=i686"
CPP="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-cpp
-Os  -I/mnt/rootfs/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/build_i686/staging_dir -mtune=i686 -march=i686"
CXX="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++
-Os  -I/mnt/rootfs/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/build_i686/staging_dir -mtune=i686 -march=i686"
FC="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gfortran
"
RANLIB="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ranlib"
STRIP="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-strip"
OBJCOPY="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar"
AS_FOR_TARGET="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
CC_FOR_TARGET="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc"
LD_FOR_TARGET="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
NM_FOR_TARGET="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
DEFAULT_LINKER="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/mnt/rootfs/buildroot/build_i686/staging_dir"
PKG_CONFIG="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/mnt/rootfs/buildroot/build_i686/staging_dir/usr/lib/pkgconfig:"
STAGING_DIR="/mnt/rootfs/buildroot/build_i686/staging_dir"\
                CFLAGS="-Os
-I/mnt/rootfs/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/build_i686/staging_dir -mtune=i686 -march=i686"  \
                LDFLAGS="-L/mnt/rootfs/buildroot/build_i686/staging_dir/lib
-L/mnt/rootfs/buildroot/build_i686/staging_dir/usr/lib
--sysroot=/mnt/rootfs/buildroot/build_i686/staging_dir/"     \
                 \
                /usr/bin/make -j1 -C
/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10     \
                _config
make[1]: Entering directory
`/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10'
make[1]: *** No rule to make target `_config'.  Stop.
make[1]: Leaving directory
`/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10'
make: ***
[/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10/.configured]
Error 2

Kindly have a look at it.

Thanks
Mitesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090126/6d4ae24d/attachment-0001.htm 
