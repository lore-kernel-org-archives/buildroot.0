From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Fri, 21 Nov 2008 13:45:34 +0300
Subject: [Buildroot] No rule to make target uImage
Message-ID: <1133111752.1227264334.189979624.2801@mcgi56.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

After invoke in terminal such commands:

0. Download and unpack bouildroot-dailysnapshot.tar.bz2
1. make menuconfig
1.1 select MIPSEL
1.2 select mips32
1.3 select Linux-Advanced-Configuration - set 2.6.22 version there and
also set 'make menuconfig' command to be invoked before Linux build
1.4 select jffs2 as target filesystem
2. make all >1 2>2

I got an error after 'make all > 1 2>2' :(

So I invoked "make all >1 2>2" and put 1 and 2 outputs here:

1:

Checking build system dependencies:
BUILDROOT_DL_DIR clean: Ok
CC clean: Ok
CXX clean: Ok
CPP clean: Ok
CFLAGS clean: Ok
INCLUDES clean: Ok
CXXFLAGS clean: Ok
which installed: Ok
sed works: Ok (/bin/sed)
GNU make version '3.81': Ok
C compiler '/usr/bin/gcc'
C compiler version '4.2.4': Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.4': Ok
awk installed: Ok
bison installed: Ok
flex installed: Ok
gettext installed: Ok
makeinfo installed: Ok
Build system dependencies: Ok

rm -rf
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/buildroot-config
mkdir -p /mnt/local_storage/buildroot/project_build_mipsel/uclibc
cp -dpRf package/config/buildroot-config
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/buildroot-config
rm -rf
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/root/usr/include
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/root/usr/lib/pkgconfig
find
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/root/usr/lib
-name '*.a' -delete
find /mnt/local_storage/buildroot/project_build_mipsel/uclibc/root/lib
-name '*.a' -delete
find
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/root/usr/lib
-name '*.la' -delete
find /mnt/local_storage/buildroot/project_build_mipsel/uclibc/root/lib
-name '*.la' -delete
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=mips
CFLAGS_KERNEL="-Os
-I/mnt/local_storage/buildroot/build_mipsel/staging_dir/usr/include
-I/mnt/local_storage/buildroot/build_mipsel/staging_dir/include
-Wl,--rpath-link
-Wl,/mnt/local_storage/buildroot/build_mipsel/staging_dir/lib
-Wl,--rpath-link
-Wl,/mnt/local_storage/buildroot/build_mipsel/staging_dir/usr/lib
--sysroot=/mnt/local_storage/buildroot/build_mipsel/staging_dir/
-isysroot /mnt/local_storage/buildroot/build_mipsel/staging_dir
-mtune=mips32 -mabi=32"
INSTALL_MOD_PATH=/mnt/local_storage/buildroot/project_build_mipsel/uclibc/root
CROSS_COMPILE=/mnt/local_storage/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-
LDFLAGS="-L/mnt/local_storage/buildroot/build_mipsel/staging_dir/lib
-L/mnt/local_storage/buildroot/build_mipsel/staging_dir/usr/lib
--sysroot=/mnt/local_storage/buildroot/build_mipsel/staging_dir/"
LZMA="/mnt/local_storage/buildroot/toolchain_build_mipsel/bin/lzma" \
                -C
/mnt/local_storage/buildroot/project_build_mipsel/uclibc/linux-2.6.22
uImage
make[1]: Entering directory
`/mnt/local_storage/buildroot/project_build_mipsel/uclibc/linux-2.6.22'
make[1]: Leaving directory
`/mnt/local_storage/buildroot/project_build_mipsel/uclibc/linux-2.6.22'

==================================================================================

2:

make[1]: *** No rule to make target `uImage'. Stop.
make: ***
[/mnt/local_storage/buildroot/project_build_mipsel/uclibc/linux-2.6.22/uImage]
Error 2

==================================================================================

Why NO_RULE_TO_MAKE _TARGET_UIMAGE ?
