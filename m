From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 10:58:47 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20080311175847.C8FEC120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 10:58:47 -0700 (Tue, 11 Mar 2008)
New Revision: 21298

Log:
updated defconfig

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-11 17:52:40 UTC (rev 21297)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-11 17:58:47 UTC (rev 21298)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Jan  4 12:49:39 2008
+# Tue Mar 11 11:17:13 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -79,7 +79,6 @@
 # BR2_TARGET_AT91RM9200DK is not set
 BR2_TARGET_AT91SAM9260DFC=y
 # BR2_TARGET_AT91SAM9260EK is not set
-# BR2_TARGET_AT91SAM9260PF is not set
 # BR2_TARGET_AT91SAM9261EK is not set
 # BR2_TARGET_AT91SAM9262EK is not set
 # BR2_TARGET_AT91SAM9263EK is not set
@@ -97,27 +96,12 @@
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
-BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
-BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
-BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
-BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
 BR2_TARGET_AT91BOOTSTRAP=y
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
 BR2_TARGET_AT91BOOT_DATAFLASHCARD=y
 # BR2_TARGET_AT91BOOT_NANDFLASH is not set
 # BR2_TARGET_AT91BOOT_FLASH is not set
 BR2_TARGET_AT91BOOTSTRAP_MEMORY="dataflashcard"
-BR2_AT91BOOTSTRAP_IMG_SIZE="0x32000"
-BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT=y
-# BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM is not set
-# BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM is not set
-BR2_AT91BOOTSTRAP_JUMP_ADDR="0x23F00000"
-
-#
-# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
-#
 # BR2_TARGET_SHARP is not set
 
 #
@@ -137,7 +121,7 @@
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="/usr/local/install/downloads"
+BR2_DL_DIR="dl"
 
 #
 # Mirrors and Download locations
@@ -170,6 +154,7 @@
 # BR2_PREFER_STATIC_LIB is not set
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
+# BR2_HAVE_DEVFILES is not set
 BR2_UPDATE_CONFIG=y
 
 #
@@ -203,6 +188,7 @@
 # BR2_KERNEL_HEADERS_2_6_22_10 is not set
 # BR2_KERNEL_HEADERS_2_6_22 is not set
 # BR2_KERNEL_HEADERS_2_6_23 is not set
+# BR2_KERNEL_HEADERS_2_6_24 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
 # BR2_KERNEL_HEADERS_IPMI is not set
 # BR2_KERNEL_HEADERS_LZMA is not set
@@ -300,7 +286,7 @@
 # BR2_BUSYBOX_VERSION_1_8_X is not set
 BR2_BUSYBOX_VERSION_1_9_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.9.0"
+BR2_BUSYBOX_VERSION="1.9.1"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
@@ -313,7 +299,6 @@
 # BR2_PACKAGE_BZIP2 is not set
 # BR2_PACKAGE_COREUTILS is not set
 # BR2_PACKAGE_DIFFUTILS is not set
-# BR2_PACKAGE_ED is not set
 # BR2_PACKAGE_FINDUTILS is not set
 # BR2_PACKAGE_FLEX is not set
 # BR2_PACKAGE_GAWK is not set
@@ -334,7 +319,6 @@
 # BR2_PACKAGE_CVS is not set
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
-# BR2_PACKAGE_EXPAT is not set
 # BR2_PACKAGE_FAKEROOT is not set
 BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
@@ -345,7 +329,6 @@
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_PKGCONFIG is not set
 # BR2_READLINE is not set
-# BR2_PACKAGE_XERCES is not set
 
 #
 # Other stuff
@@ -353,9 +336,13 @@
 # BR2_PACKAGE_AT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CUPS is not set
 # BR2_PACKAGE_CUSTOMIZE is not set
 # BR2_PACKAGE_DASH is not set
 # BR2_PACKAGE_FILE is not set
+# BR2_PACKAGE_GAMIN is not set
+# BR2_PACKAGE_ICU is not set
+# BR2_PACKAGE_IPKG is not set
 # BR2_PACKAGE_KEXEC is not set
 # BR2_PACKAGE_LESS is not set
 BR2_PACKAGE_LIBDAEMON=y
@@ -366,11 +353,6 @@
 # BR2_PACKAGE_LIBGPG_ERROR is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
-# BR2_PACKAGE_LIBXML2 is not set
-
-#
-# libxslt	- disabled (requires pkgconfig)
-#
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
@@ -378,19 +360,20 @@
 # BR2_PACKAGE_LTT is not set
 # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
 # BR2_PACKAGE_MODUTILS is not set
-# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_PROCPS is not set
 # BR2_PACKAGE_PSMISC is not set
 # BR2_PACKAGE_SQLITE is not set
+# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_SUDO is not set
 # BR2_PACKAGE_SYSKLOGD is not set
 # BR2_PACKAGE_SYSVINIT is not set
 # BR2_PACKAGE_TINYLOGIN is not set
-# BR2_PACKAGE_UEMACS is not set
 # BR2_PACKAGE_UTIL-LINUX is not set
 # BR2_PACKAGE_WHICH is not set
+# BR2_TEXTEDIT_SUPPORT is not set
 BR2_NETWORK_SUPPORT=y
 
 #
@@ -497,6 +480,8 @@
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
 # BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
@@ -517,6 +502,7 @@
 BR2_PACKAGE_MTD_20061007=y
 # BR2_PACKAGE_MTD_20050122 is not set
 # BR2_PACKAGE_MTD_SNAPSHOT is not set
+BR2_PACKAGE_MTD_ORIG_STRING="mtd_20061007.orig.tar.gz"
 
 #
 # MTD tools selection
@@ -593,6 +579,7 @@
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
 # BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_SDL_MIXER is not set
 # BR2_PACKAGE_SDL_TTF is not set
 # BR2_PACKAGE_TIFF is not set
 
@@ -628,6 +615,12 @@
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
+# BR2_PACKAGE_LIBSEXY is not set
+
+#
+# fltk		- disabled (requires Xorg(7))
+#
+# BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_TSLIB is not set
@@ -638,6 +631,10 @@
 # BR2_PACKAGE_MATCHBOX is not set
 
 #
+# blackbox		- disabled (requires Xorg(7))
+#
+
+#
 # X applications
 #
 
@@ -646,6 +643,20 @@
 #
 
 #
+# midori		- disabled (requires Xorg(7))
+#
+# BR2_PACKAGE_WEBKIT is not set
+# BR2_PACKAGE_GQVIEW is not set
+# BR2_PACKAGE_LEAFPAD is not set
+# BR2_PACKAGE_TORSMO is not set
+# BR2_PACKAGE_PCMANFM is not set
+# BR2_PACKAGE_XSTROKE is not set
+# BR2_PACKAGE_SYLPHEED is not set
+# BR2_PACKAGE_XPDF is not set
+# BR2_PACKAGE_X11VNC is not set
+# BR2_PACKAGE_XVKBD is not set
+
+#
 # Video libraries/codecs and applications
 #
 # BR2_PACKAGE_MPLAYER is not set
@@ -666,8 +677,24 @@
 # BR2_PACKAGE_RUBY is not set
 # BR2_PACKAGE_TCL is not set
 # BR2_PACKAGE_PHP is not set
+
+#
+# PHP Extensions
+#
+
+#
+# Database extensions
+#
+# BR2_XML_SUPPORT is not set
+# BR2_JAVA_SUPPORT is not set
 BR2_GAMES=y
-# BR2_PACKAGE_DOOM is not set
+# BR2_PACKAGE_LXDOOM is not set
+# BR2_PACKAGE_LXDOOM_WAD is not set
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_XBOARD is not set
+# BR2_PACKAGE_RUBIX is not set
+# BR2_PACKAGE_MAGICCUBE4D is not set
+# BR2_PACKAGE_VICE is not set
 
 #
 # Target filesystem options
@@ -703,6 +730,7 @@
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
+# BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
 BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
 BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
@@ -713,6 +741,12 @@
 #
 # bootloader for target device
 #
+BR2_TARGET_UBOOT_AT91=y
+BR2_TARGET_UBOOT_SERVERIP_AT91="10.175.196.221"
+BR2_TARGET_UBOOT_IPADDR_AT91="10.175.196.18"
+BR2_TARGET_UBOOT_GATEWAY_AT91="10.175.196.1"
+BR2_TARGET_UBOOT_NETMASK_AT91="255.255.255.0"
+BR2_TARGET_UBOOT_ETHADDR_AT91="04:25:fe:ed:00:18"
 
 #
 # Kernel
@@ -724,11 +758,12 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.23.1"
+BR2_KERNEL_CURRENT_VERSION="2.6.24"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_24 is not set
 # BR2_LINUX_2_6_23 is not set
 # BR2_LINUX_2_6_22_10 is not set
 BR2_LINUX_2_6_22_1=y
