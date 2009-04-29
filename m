From: correa at uclibc.org <correa@uclibc.org>
Date: Wed, 29 Apr 2009 18:27:25 +0000 (UTC)
Subject: [Buildroot] svn commit: [26244]
	trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20090429182725.29E12775F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-29 18:27:24 +0000 (Wed, 29 Apr 2009)
New Revision: 26244

Log:
Fix atngw100_defconfig busybox config location

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-04-29 15:52:24 UTC (rev 26243)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-04-29 18:27:24 UTC (rev 26244)
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Sat Jan 31 00:10:01 2009
+# Wed Apr 29 16:19:36 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="2009.02-svn"
+BR2_VERSION="2009.05-svn"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -38,6 +38,7 @@
 #
 # Preset Devices
 #
+# BR2_TARGET_AMD is not set
 BR2_BOARD_NAME="atngw100"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
 BR2_TARGET_ATMEL=y
@@ -77,9 +78,12 @@
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
 # BR2_TARGET_GENERIC_FIREWALL is not set
-# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
 
 #
+# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
+#
+
+#
 # Build options
 #
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
@@ -111,8 +115,6 @@
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
@@ -166,27 +168,20 @@
 # BR2_EXT_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_EXT_UCLIBC_VERSION_0_9_29 is not set
 BR2_EXT_UCLIBC_VERSION_0_9_30=y
+# BR2_EXT_UCLIBC_VERSION_0_9_30_1 is not set
 
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_2_4_31 is not set
-# BR2_KERNEL_HEADERS_2_6_20_4 is not set
-# BR2_KERNEL_HEADERS_2_6_20 is not set
-# BR2_KERNEL_HEADERS_2_6_21_5 is not set
-# BR2_KERNEL_HEADERS_2_6_21 is not set
-# BR2_KERNEL_HEADERS_2_6_22_1 is not set
-# BR2_KERNEL_HEADERS_2_6_22_10 is not set
-# BR2_KERNEL_HEADERS_2_6_22 is not set
 # BR2_KERNEL_HEADERS_2_6_23 is not set
 # BR2_KERNEL_HEADERS_2_6_24 is not set
 # BR2_KERNEL_HEADERS_2_6_25 is not set
 # BR2_KERNEL_HEADERS_2_6_26 is not set
 # BR2_KERNEL_HEADERS_2_6_27 is not set
 BR2_KERNEL_HEADERS_2_6_28=y
+# BR2_KERNEL_HEADERS_2_6_29 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_KERNEL_HEADERS_PATCH_DIR=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.28.9"
 
 #
 # uClibc Options
@@ -194,7 +189,9 @@
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 BR2_UCLIBC_VERSION_0_9_30=y
+# BR2_UCLIBC_VERSION_0_9_30_1 is not set
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.30"
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_PTHREAD_DEBUG is not set
 # BR2_UCLIBC_PROGRAM_INVOCATION is not set
@@ -212,6 +209,7 @@
 # BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
 # BR2_BINUTILS_VERSION_2_19 is not set
+# BR2_BINUTILS_VERSION_2_19_1 is not set
 BR2_BINUTILS_VERSION="2.18"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
@@ -227,6 +225,8 @@
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
 # BR2_GCC_VERSION_4_3_2 is not set
+# BR2_GCC_VERSION_4_3_3 is not set
+# BR2_GCC_VERSION_4_4_X is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2"
@@ -264,8 +264,10 @@
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
 # BR2_ENABLE_LOCALE_PREGENERATED is not set
+# BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
+# BR2_USE_SSP is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
@@ -283,19 +285,13 @@
 # Package Selection for the target
 #
 BR2_PACKAGE_BUSYBOX=y
-# BR2_BUSYBOX_VERSION_1_2_2_1 is not set
-# BR2_BUSYBOX_VERSION_1_6_1 is not set
-# BR2_BUSYBOX_VERSION_1_7_X is not set
-# BR2_BUSYBOX_VERSION_1_8_X is not set
-# BR2_BUSYBOX_VERSION_1_9_X is not set
-# BR2_BUSYBOX_VERSION_1_10_X is not set
-# BR2_BUSYBOX_VERSION_1_11_X is not set
 # BR2_BUSYBOX_VERSION_1_12_X is not set
 BR2_BUSYBOX_VERSION_1_13_X=y
+# BR2_BUSYBOX_VERSION_1_14_X is not set
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
@@ -326,6 +322,7 @@
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
+# BR2_PACKAGE_PKG_CONFIG is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
@@ -398,10 +395,7 @@
 # BR2_PACKAGE_IFPLUGD is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
-
-#
-# ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )
-#
+# BR2_PACKAGE_IPSEC_TOOLS is not set
 BR2_PACKAGE_IPTABLES=y
 # BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
@@ -412,11 +406,11 @@
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBSOUP is not set
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LINKS is not set
 BR2_PACKAGE_LRZSZ=y
 # BR2_PACKAGE_MDNSRESPONDER is not set
-BR2_PACKAGE_MICROCOM=y
 # BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
@@ -430,6 +424,7 @@
 # BR2_PACKAGE_NCFTP_PUT is not set
 # BR2_PACKAGE_NCFTP_LS is not set
 # BR2_PACKAGE_NCFTP_BATCH is not set
+# BR2_PACKAGE_NCFTP_BOOKMARKS is not set
 # BR2_PACKAGE_NEON is not set
 # BR2_PACKAGE_NETKITBASE is not set
 # BR2_PACKAGE_NETKITTELNET is not set
@@ -443,7 +438,6 @@
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
 # BR2_PACKAGE_OPENVPN is not set
-# BR2_PACKAGE_OPENSWAN is not set
 BR2_PACKAGE_PORTMAP=y
 # BR2_PACKAGE_PPPD is not set
 # BR2_PACKAGE_RADVD is not set
@@ -477,6 +471,7 @@
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WEBIF is not set
 BR2_PACKAGE_WIRELESS_TOOLS=y
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
 
 #
 # Hardware handling / blockdevices and filesystem maintenance
@@ -485,6 +480,10 @@
 #
 # dbus not available (need expat or libxml2)
 #
+
+#
+# dbus-glib needs dbus to be compiled with expat support
+#
 # BR2_PACKAGE_DEVMEM2 is not set
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
@@ -535,7 +534,10 @@
 # BR2_PACKAGE_MTD_NFTL_FORMAT is not set
 # BR2_PACKAGE_MTD_NFTLDUMP is not set
 # BR2_PACKAGE_MTD_SUMTOOL is not set
-# BR2_PACKAGE_NTFS-3G is not set
+
+#
+# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
+#
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
@@ -554,6 +556,7 @@
 # asterisk	- disabled (required openssl and mpg123)
 #
 # BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
 # BR2_PACKAGE_GSTREAMER is not set
 # BR2_PACKAGE_LIBID3TAG is not set
 # BR2_PACKAGE_LIBMAD is not set
@@ -561,15 +564,13 @@
 # BR2_PACKAGE_LIBOGG is not set
 # BR2_PACKAGE_LIBSNDFILE is not set
 # BR2_PACKAGE_LIBTHEORA is not set
-
-#
-# libvorbis requires the package libogg to build
-#
+# BR2_PACKAGE_LIBVORBIS is not set
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
 # BR2_PACKAGE_MPLAYER is not set
 # BR2_PACKAGE_SPEEX is not set
 # BR2_PACKAGE_FESTIVAL is not set
+# BR2_PACKAGE_TAGLIB is not set
 # BR2_PACKAGE_VLC is not set
 
 #
@@ -625,6 +626,7 @@
 # X libraries and helper libraries
 #
 # BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
@@ -667,6 +669,7 @@
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
+# BR2_PACKAGE_LZOP is not set
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
@@ -715,6 +718,8 @@
 #
 # Target filesystem options
 #
+BR2_ROOTFS_PREFIX="rootfs"
+BR2_ROOTFS_SUFFIX="$(DATE)"
 
 #
 # filesystem for target device
@@ -736,7 +741,6 @@
 # BR2_TARGET_ROOTFS_JFFS2_PAD is not set
 # BR2_TARGET_ROOTFS_JFFS2_LE is not set
 BR2_TARGET_ROOTFS_JFFS2_BE=y
-# BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
 BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
 BR2_TARGET_ROOTFS_JFFS2_COPYTO="/tftpboot"
@@ -758,11 +762,12 @@
 #
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atngw100"
+BR2_TARGET_UBOOT_2009_03=y
 # BR2_TARGET_UBOOT_2009_01 is not set
-BR2_TARGET_UBOOT_2008_10=y
+# BR2_TARGET_UBOOT_2008_10 is not set
 # BR2_TARGET_UBOOT_1_3_4 is not set
 # BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
-BR2_UBOOT_VERSION="2008.10"
+BR2_UBOOT_VERSION="2009.03"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
@@ -804,8 +809,8 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.27.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
-BR2_KERNEL_LATEST_2_6_28="2"
+BR2_KERNEL_CURRENT_VERSION="2.6.28.7"
+BR2_KERNEL_LATEST_2_6_28="7"
 BR2_KERNEL_LATEST_2_6_27="13"
 BR2_KERNEL_LATEST_2_6_26="8"
 BR2_KERNEL_LATEST_2_6_25="19"
