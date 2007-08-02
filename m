From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 1 Aug 2007 22:11:33 -0700 (PDT)
Subject: [Buildroot] libglib2 build fails with missing libintl.h for
	arm926ejs toolchain
Message-ID: <11958533.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

 I am trying to build ARM 926ejs Toolchain with latest BUILDROOT Snapshot.
everything goes fine untill glib2 is built. when making glib2 i get below
mentioned error as missing libintl.h file . i have attached my confiug,
error & config.log details from glib directory from build_arm folder.

Also i verified that libintl.h doesnt exist in
$(BUILD_DIR)/staging_dir/include or $(BUILD_DIR)/staging_dir/usr/include.

while making gettext i saw that libintl.h is not copied to any of these
directories. let me know whether copying it manually will  help. or is there
any changes i shld do.

libintl*.[a/so] & libgettext*.[a/so] files are present in
$(BUILD_DIR)/staging_dir/usr/lib


kindly help me to solve the same. 

Regards
Gururaja

**********Glib2 configure error**********
checking libintl.h usability... no
checking libintl.h presence... no
checking for libintl.h... no
configure: error:
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html

make: ***
[/home/guru/project/original/toolchains/buildroot/build_arm/glib-2.12.9/.configured]
Error 1


******* My buildroot Config**********

BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_PREFER_STATIC_LIB=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_KERNEL_HEADERS_2_6_21=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_GCC_VERSION_4_2_0=y
BR2_GCC_SHARED_LIBGCC=y
BR2_HOST_FAKEROOT=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_LIBSYSFS=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_HEADERS=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y


**********config.log-*****************
<snip>
<snip>

 $ ./configure --target=arm-linux --host=arm-linux --build=i386-pc-linux-gnu
--prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
--libdir=/lib --libexecdir=/usr/lib --sysconfdir=/etc --datadir=/usr/share
--localstatedir=/var --includedir=/include --mandir=/usr/man
--infodir=/usr/info --enable-shared --enable-static


<snip>

configure:7552: checking libintl.h usability
configure:7569:
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe 
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
--sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
-isysroot
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
-mtune=arm9tdmi -c -g -O2  conftest.c >&5
conftest.c:60:21: error: libintl.h: No such file or directory

<snip>
<snip>

configure:7610: checking libintl.h presence
configure:7625:
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-cpp
-Os -pipe 
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/include
--sysroot=/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/
-isysroot
/home/guru/project/original/toolchains/buildroot/build_arm/staging_dir
-mtune=arm9tdmi  conftest.c
conftest.c:27:21: error: libintl.h: No such file or directory

<snip>
<snip>

configure:7685: checking for libintl.h
configure:7692: result: no
configure:9045: error:
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html

<snip>


-- 
View this message in context: http://www.nabble.com/libglib2-build-fails-with-missing-libintl.h-for-arm926ejs-toolchain-tf4204156.html#a11958533
Sent from the BuildRoot mailing list archive at Nabble.com.
