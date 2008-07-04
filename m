From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 04:18:58 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk100x
Message-ID: <20080704111858.CF4683C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 04:18:58 -0700 (Fri, 04 Jul 2008)
New Revision: 22634

Log:
Update atstk100x defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-07-04 10:48:31 UTC (rev 22633)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-07-04 11:18:58 UTC (rev 22634)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sat Mar 29 23:26:39 2008
+# Fri Jul  4 12:51:33 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -45,6 +45,22 @@
 BR2_TARGET_ATMEL=y
 
 #
+# Selection criteria
+#
+BR2_TARGET_ATMEL_NET=y
+BR2_TARGET_ATMEL_LCD=y
+# BR2_TARGET_ATMEL_FPDSP is not set
+# BR2_TARGET_ATMEL_MPB is not set
+
+#
+# Device Selection
+#
+
+#
+# Development Board Selection
+#
+
+#
 # Atmel AVR32 Specific Device Support
 #
 BR2_TARGET_AVR32=y
@@ -70,6 +86,8 @@
 #
 BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
+BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
+BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 # BR2_TARGET_VALKA is not set
 
 #
@@ -86,6 +104,7 @@
 #
 # Build options
 #
+BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
@@ -143,18 +162,23 @@
 BR2_TOOLCHAIN_EXTERNAL_SOURCE=y
 BR2_TOOLCHAIN_SOURCE=y
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2 is not set
-BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
+BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3 is not set
 # BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)"
 BR2_VENDOR_SUFFIX="-avr32"
-BR2_VENDOR_BINUTILS_RELEASE="-2.1.3"
-BR2_VENDOR_GCC_RELEASE="-2.1.3"
-BR2_VENDOR_UCLIBC_RELEASE="-2.1.3"
-BR2_VENDOR_GDB_RELEASE="-2.1.3"
-BR2_VENDOR_PATCH_DIR="target/device/Atmel/toolchain/avr32"
+BR2_VENDOR_BINUTILS_RELEASE="-2.1.5"
+BR2_VENDOR_GCC_RELEASE="-2.1.5"
+BR2_VENDOR_UCLIBC_RELEASE="-2.1.5"
+BR2_VENDOR_GDB_RELEASE="-2.1.5"
+BR2_VENDOR_PATCH_DIR="Atmel/avr32"
 # BR2_EXT_GCC_VERSION_4_1_2 is not set
-BR2_EXT_GCC_VERSION_4_2_1=y
+# BR2_EXT_GCC_VERSION_4_2_1 is not set
+BR2_EXT_GCC_VERSION_4_2_2=y
+# BR2_EXT_GCC_VERSION_4_2_3 is not set
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 # BR2_EXT_UCLIBC_VERSION_0_9_28_3 is not set
@@ -178,8 +202,9 @@
 # BR2_KERNEL_HEADERS_2_6_22 is not set
 # BR2_KERNEL_HEADERS_2_6_23 is not set
 BR2_KERNEL_HEADERS_2_6_24=y
+# BR2_KERNEL_HEADERS_2_6_25 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.24"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.24.7"
 
 #
 # uClibc Options
@@ -212,11 +237,14 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
+# BR2_GCC_VERSION_4_2_3 is not set
+# BR2_GCC_VERSION_4_2_4 is not set
+# BR2_GCC_VERSION_4_3_1 is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
@@ -237,21 +265,18 @@
 BR2_PACKAGE_GDB_HOST=y
 # BR2_GDB_VERSION_6_2_1 is not set
 # BR2_GDB_VERSION_6_3 is not set
-BR2_GDB_VERSION_6_4=y
+# BR2_GDB_VERSION_6_4 is not set
 # BR2_GDB_VERSION_6_5 is not set
 # BR2_GDB_VERSION_6_6 is not set
+BR2_GDB_VERSION_6_7_1=y
+# BR2_GDB_VERSION_6_8 is not set
 # BR2_GDB_VERSION_SNAPSHOT is not set
-BR2_GDB_VERSION="6.4"
+BR2_GDB_VERSION="6.7.1"
 
 #
-# elf2flt
+# Common Toolchain Options
 #
-# BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
-
-#
-# Common Toolchain Options
-#
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
 # BR2_ENABLE_MULTILIB is not set
@@ -272,11 +297,12 @@
 # BR2_BUSYBOX_VERSION_1_7_X is not set
 # BR2_BUSYBOX_VERSION_1_8_X is not set
 # BR2_BUSYBOX_VERSION_1_9_X is not set
-BR2_BUSYBOX_VERSION_1_10_X=y
+# BR2_BUSYBOX_VERSION_1_10_X is not set
+BR2_BUSYBOX_VERSION_1_11_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.10.0"
+BR2_BUSYBOX_VERSION="1.11.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Atmel/atstk100x/busybox-1.9.1.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
@@ -302,19 +328,22 @@
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
 BR2_HOST_FAKEROOT=y
-# BR2_PACKAGE_GETTEXT is not set
-# BR2_PACKAGE_LIBINTL is not set
+BR2_PACKAGE_GETTEXT=y
+BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
 # BR2_PACKAGE_LIBMPFR is not set
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
-# BR2_PACKAGE_PKGCONFIG is not set
+# BR2_PACKAGE_OPROFILE is not set
+BR2_PACKAGE_PKGCONFIG=y
 # BR2_READLINE is not set
+# BR2_PACKAGE_PCRE is not set
 
 #
 # Other stuff
 #
 # BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_BEECRYPT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
 # BR2_PACKAGE_CUPS is not set
@@ -331,6 +360,7 @@
 # BR2_PACKAGE_LIBFLOAT is not set
 # BR2_PACKAGE_LIBGCRYPT is not set
 # BR2_PACKAGE_LIBGPG_ERROR is not set
+# BR2_PACKAGE_LIBICONV is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
@@ -339,11 +369,15 @@
 # BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
+# BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_PORTAGE is not set
+# BR2_PACKAGE_SCREEN is not set
 # BR2_PACKAGE_SQLITE is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
+BR2_DATABASE_SUPPORT=y
+# BR2_PACKAGE_MYSQL_CLIENT is not set
 BR2_NETWORK_SUPPORT=y
 
 #
@@ -359,6 +393,7 @@
 #
 # mDNS/DNS-SD daemon	- disabled (requires expat)
 #
+# BR2_PACKAGE_AXEL is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
@@ -368,9 +403,10 @@
 BR2_PACKAGE_DROPBEAR=y
 # BR2_PACKAGE_ETHTOOL is not set
 BR2_PACKAGE_HASERL=y
-# BR2_PACKAGE_HASERL_VERSION_0_8_0 is not set
-BR2_PACKAGE_HASERL_VERSION_0_9_22=y
-BR2_PACKAGE_HASERL_VERSION="0.9.22"
+# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
+BR2_PACKAGE_HASERL_VERSION_0_9_X=y
+BR2_PACKAGE_HASERL_VERSION="0.9.23"
+# BR2_PACKAGE_IFPLUGD is not set
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
@@ -390,6 +426,7 @@
 BR2_PACKAGE_LRZSZ=y
 # BR2_PACKAGE_MDNSRESPONDER is not set
 BR2_PACKAGE_MICROCOM=y
+# BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
 BR2_PACKAGE_NBD=y
@@ -404,6 +441,7 @@
 # BR2_PACKAGE_NCFTP_BATCH is not set
 # BR2_PACKAGE_NCFTP_SPOOLER is not set
 # BR2_PACKAGE_NCFTP_BOOKMARKS is not set
+# BR2_PACKAGE_NEON is not set
 # BR2_PACKAGE_NETKITBASE is not set
 # BR2_PACKAGE_NETKITTELNET is not set
 # BR2_PACKAGE_NETPLUG is not set
@@ -450,12 +488,14 @@
 # vpnc		- disabled (requires libgcrypt and libgpg_error)
 #
 # BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WEBIF is not set
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_BLOCKDEV_SUPPORT=y
 
 #
 # dbus not available (need expat or libxml2)
 #
+# BR2_PACKAGE_DEVMEM2 is not set
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
@@ -465,6 +505,8 @@
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
 # BR2_PACKAGE_IOSTAT is not set
 # BR2_PACKAGE_LIBAIO is not set
 # BR2_PACKAGE_LIBRAW1394 is not set
@@ -551,12 +593,16 @@
 # BR2_PACKAGE_MPG123 is not set
 BR2_PACKAGE_MPG123_ALSA=y
 # BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_FESTIVAL is not set
 BR2_GRAPHIC_SUPPORT=y
 
 #
 # text rendering libraries
 #
 BR2_PACKAGE_NCURSES=y
+# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
+# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
+# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
 # BR2_PACKAGE_NCURSES_TARGET_HEADERS is not set
 # BR2_PACKAGE_NEWT is not set
 # BR2_PACKAGE_SLANG is not set
@@ -572,6 +618,7 @@
 # BR2_PACKAGE_DIRECTFB is not set
 # BR2_PACKAGE_IMAGEMAGICK is not set
 BR2_PACKAGE_JPEG=y
+# BR2_PACKAGE_LIBART is not set
 BR2_PACKAGE_LIBPNG=y
 BR2_PACKAGE_LIBUNGIF=y
 # BR2_PACKAGE_SDL is not set
@@ -584,7 +631,7 @@
 #
 
 #
-# --> (May be broken in busybox)
+# --> May be broken in busybox
 #
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_FBSET=y
@@ -592,7 +639,6 @@
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTE is not set
 BR2_PACKAGE_QTOPIA4=y
 # BR2_PACKAGE_QTOPIA4_DEBUG is not set
 BR2_PACKAGE_QTOPIA4_SHARED=y
@@ -601,6 +647,7 @@
 # BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
 BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED=y
 # BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
+BR2_PACKAGE_QTOPIA4_DEPTHS="-depths 24,16,8"
 BR2_PACKAGE_QTOPIA4_GIF=y
 BR2_PACKAGE_QTOPIA4_LIBMNG=y
 BR2_PACKAGE_QTOPIA4_NOJPEG=y
@@ -612,29 +659,32 @@
 BR2_PACKAGE_QTOPIA4_NOTIFF=y
 # BR2_PACKAGE_QTOPIA4_SYSTEMTIFF is not set
 # BR2_PACKAGE_QTOPIA4_QTTIFF is not set
-# BR2_PACKAGE_QTOPIA4_SQL is not set
-# BR2_PACKAGE_QTOPIA4_OPENSSL is not set
-# BR2_PACKAGE_QTOPIA4_NOZLIB is not set
 BR2_PACKAGE_QTOPIA4_QTZLIB=y
 # BR2_PACKAGE_QTOPIA4_SYSTEMZLIB is not set
+BR2_PACKAGE_QTOPIA4_NOFREETYPE=y
+# BR2_PACKAGE_QTOPIA4_QTFREETYPE is not set
+# BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE is not set
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="$(ARCH)"
+# BR2_PACKAGE_QTOPIA4_SQL_MODULE is not set
+# BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
+# BR2_PACKAGE_QTOPIA4_SVG is not set
+# BR2_PACKAGE_QTOPIA4_WEBKIT is not set
+# BR2_PACKAGE_QTOPIA4_OPENSSL is not set
+
+#
+# X Window System server
+#
 BR2_PACKAGE_XSERVER_none=y
-# BR2_PACKAGE_XSERVER_x11r7 is not set
-# BR2_PACKAGE_XSERVER_xorg is not set
-# BR2_PACKAGE_XSERVER_tinyx is not set
 BR2_X11_PREFIX="/usr"
 
 #
 # X libraries and helper libraries
 #
-
-#
-# atk		- disabled (requires libglib2)
-#
+# BR2_PACKAGE_ATK is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
-# BR2_PACKAGE_LIBGLIB2 is not set
+BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_LIBSEXY is not set
 
 #
@@ -682,6 +732,7 @@
 # Video libraries/codecs and applications
 #
 BR2_PACKAGE_MPLAYER=y
+# BR2_PACKAGE_VLC is not set
 BR2_COMPRESSOR_SUPPORT=y
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZMA_TARGET is not set
@@ -693,10 +744,7 @@
 # BR2_PACKAGE_EXPAT is not set
 # BR2_PACKAGE_EZXML is not set
 # BR2_PACKAGE_LIBXML2 is not set
-
-#
-# libxslt	- disabled (requires pkgconfig)
-#
+# BR2_PACKAGE_LIBXSLT is not set
 # BR2_PACKAGE_XERCES is not set
 BR2_JAVA_SUPPORT=y
 # BR2_PACKAGE_CLASSPATH is not set
@@ -723,6 +771,7 @@
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
 BR2_TARGET_ROOTFS_EXT2_COPYTO="/tftpboot"
 # BR2_TARGET_ROOTFS_JFFS2 is not set
+# BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
 BR2_TARGET_ROOTFS_TAR_NONE=y
@@ -733,6 +782,7 @@
 BR2_TARGET_ROOTFS_TAR_COPYTO=""
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
 
 #
 # bootloader for target device
@@ -747,6 +797,8 @@
 BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
 BR2_TARGET_UBOOT_ETH1ADDR=""
 # BR2_TARGET_UBOOT_SILENT is not set
+# BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
+# BR2_TARGET_UBOOT_TOOL_ENV is not set
 
 #
 # Kernel
@@ -759,7 +811,7 @@
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.24.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
 BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
-BR2_KERNEL_CURRENT_VERSION="2.6.24.4"
+BR2_KERNEL_CURRENT_VERSION="2.6.25.9"
 BR2_KERNEL_NEXT_VERSION="2.6.25"
 BR2_KERNEL_THIS_VERSION="2.6.24"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
@@ -767,6 +819,7 @@
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
 # BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_25 is not set
 BR2_LINUX_2_6_24=y
 # BR2_LINUX_2_6_23 is not set
 # BR2_LINUX_2_6_22_10 is not set
@@ -776,7 +829,8 @@
 # BR2_LINUX_2_6_21_5 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_25 is not set
+# BR2_LINUX_2_6_26 is not set
+# BR2_LINUX_2_6_27 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
@@ -795,8 +849,6 @@
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="3"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
-BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
-BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 BR2_ARCH_AVR32_2_6_24=y
 # BR2_ARCH_AVR32_2_6_23 is not set
 # BR2_ARCH_AVR32_2_6_22_10 is not set
@@ -809,6 +861,7 @@
 BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
+BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
 # BR2_KERNEL_LATEST is not set
@@ -821,6 +874,9 @@
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
+BR2_MAKE_XCONFIG=y
+# BR2_MAKE_MENUCONFIG is not set
+BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set
