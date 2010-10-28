From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Oct 2010 14:07:21 +0000 (UTC)
Subject: [Buildroot] [Bug 2743] New: buildroot-2010.08 forgets to include
 /lib/* into rootfs.ext2
Message-ID: <bug-2743-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2743

           Summary: buildroot-2010.08 forgets to include /lib/* into
                    rootfs.ext2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sludgeas at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


get buildroot-2010.08 to build a rootfs for ARM926T and you will end up without
/lib/* in the rootfs.ext2 (so if you bake it from there, your system is borked
(i.e. the famous -sh: xxx: not found errors)). To fix this, you can find your
uclibs et al. at ./output/target/lib/*

my #-stripped .config:
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.08"
BR2_arm=y
BR2_arm926t=y

BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"


BR2_TARGET_GENERIC_HOSTNAME="br_20101028"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot, 20101028"
BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_TTYS0=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"


BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_BZR_CO="bzr co"
BR2_BZR_UP="bzr up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_STAGING_DIR="$(BASE_DIR)/staging"

BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=4
BR2_STRIP_strip=y
BR2_OPTIMIZE_S=y
BR2_PREFER_STATIC_LIB=y


BR2_TOOLCHAIN_BUILDROOT=y

BR2_KERNEL_HEADERS_2_6_32=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.32.18"

BR2_UCLIBC_VERSION_0_9_31=y
BR2_UCLIBC_VERSION_STRING="0.9.31"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"

BR2_BINUTILS_VERSION_2_20_1=y
BR2_BINUTILS_VERSION="2.20.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

BR2_GCC_VERSION_4_4_X=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.4.4"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""


BR2_NEEDS_GETTEXT=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_PTHREADS_OLD=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_17_X=y
BR2_BUSYBOX_VERSION="1.17.1"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.17.x.config"


BR2_PACKAGE_AUTOCONF=y
BR2_PACKAGE_AUTOMAKE=y
BR2_PACKAGE_FAKEROOT=y


BR2_PACKAGE_MAKE=y
BR2_PACKAGE_LIBTOOL=y


BR2_PACKAGE_DIRECTFB=y
BR2_PACKAGE_DIRECTFB_LINUXINPUT=y
BR2_PACKAGE_DIRECTFB_KEYBOARD=y
BR2_PACKAGE_DIRECTFB_PS2MOUSE=y
BR2_PACKAGE_DIRECTFB_SERIALMOUSE=y
BR2_PACKAGE_DIRECTFB_TSLIB=y
BR2_PACKAGE_DIRECTFB_GIF=y
BR2_PACKAGE_DIRECTFB_JPEG=y
BR2_PACKAGE_DIRECTFB_PNG=y
BR2_PACKAGE_DIRECTFB_EXAMPLES=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE=y
BR2_PACKAGE_FBDUMP=y


BR2_PACKAGE_MAKEDEVS=y


BR2_PACKAGE_MICROPERL=y
BR2_PACKAGE_MICROPERL_MODULES=""


BR2_PACKAGE_ZLIB=y


BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_JPEG=y

BR2_PACKAGE_LIBPNG=y


BR2_PACKAGE_TSLIB=y
BR2_PACKAGE_LIBUSB=y


BR2_PACKAGE_NCURSES=y


BR2_PACKAGE_NANO=y

BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_NONE=y

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
