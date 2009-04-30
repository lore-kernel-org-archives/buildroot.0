From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 30 Apr 2009 06:33:27 +0000 (UTC)
Subject: [Buildroot] svn commit: [26249]
	trunk/buildroot/target/device/Atmel: atngw100 atstk100x
Message-ID: <20090430063328.02B177746F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-30 06:33:27 +0000 (Thu, 30 Apr 2009)
New Revision: 26249

Log:
Make sure AVR32 defconfigs use u-boot 2008.10 (only known version to work properly)

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-04-30 06:27:33 UTC (rev 26248)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-04-30 06:33:27 UTC (rev 26249)
@@ -762,12 +762,12 @@
 #
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atngw100"
-BR2_TARGET_UBOOT_2009_03=y
+# BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
-# BR2_TARGET_UBOOT_2008_10 is not set
+BR2_TARGET_UBOOT_2008_10=y
 # BR2_TARGET_UBOOT_1_3_4 is not set
 # BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
-BR2_UBOOT_VERSION="2009.03"
+BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""

Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-04-30 06:27:33 UTC (rev 26248)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-04-30 06:33:27 UTC (rev 26249)
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Sat Jan 31 00:13:26 2009
+# Thu Apr 30 04:25:26 2009
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
 BR2_BOARD_NAME="atstk100x"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
 BR2_TARGET_ATMEL=y
@@ -111,8 +112,6 @@
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_ROOTFS_PREFIX="atstk1002-rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=2
@@ -166,27 +165,20 @@
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
@@ -194,7 +186,9 @@
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 BR2_UCLIBC_VERSION_0_9_30=y
+# BR2_UCLIBC_VERSION_0_9_30_1 is not set
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.30"
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_PTHREAD_DEBUG is not set
 BR2_UCLIBC_PROGRAM_INVOCATION=y
@@ -212,6 +206,7 @@
 # BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
 # BR2_BINUTILS_VERSION_2_19 is not set
+# BR2_BINUTILS_VERSION_2_19_1 is not set
 BR2_BINUTILS_VERSION="2.18"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
@@ -227,6 +222,8 @@
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
 # BR2_GCC_VERSION_4_3_2 is not set
+# BR2_GCC_VERSION_4_3_3 is not set
+# BR2_GCC_VERSION_4_4_X is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2"
@@ -264,8 +261,10 @@
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
@@ -283,17 +282,11 @@
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
-BR2_BUSYBOX_VERSION_1_13_X=y
+# BR2_BUSYBOX_VERSION_1_13_X is not set
+BR2_BUSYBOX_VERSION_1_14_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Atmel/atstk100x/busybox-1.9.1.config"
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
@@ -336,6 +329,7 @@
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
+# BR2_PACKAGE_PKG_CONFIG is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
@@ -427,10 +421,7 @@
 # BR2_PACKAGE_IFPLUGD is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
-
-#
-# ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )
-#
+# BR2_PACKAGE_IPSEC_TOOLS is not set
 # BR2_PACKAGE_IPTABLES is not set
 # BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
@@ -441,6 +432,7 @@
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBSOUP is not set
 # BR2_PACKAGE_LIBUPNP is not set
 BR2_PACKAGE_LIGHTTPD=y
 
@@ -454,7 +446,6 @@
 # BR2_PACKAGE_LINKS is not set
 BR2_PACKAGE_LRZSZ=y
 # BR2_PACKAGE_MDNSRESPONDER is not set
-BR2_PACKAGE_MICROCOM=y
 # BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
@@ -468,7 +459,6 @@
 # BR2_PACKAGE_NCFTP_PUT is not set
 # BR2_PACKAGE_NCFTP_LS is not set
 # BR2_PACKAGE_NCFTP_BATCH is not set
-# BR2_PACKAGE_NCFTP_SPOOLER is not set
 # BR2_PACKAGE_NCFTP_BOOKMARKS is not set
 # BR2_PACKAGE_NEON is not set
 # BR2_PACKAGE_NETCAT is not set
@@ -486,7 +476,6 @@
 # BR2_PACKAGE_OPENSSL_BIN is not set
 # BR2_PACKAGE_OPENSSL_ENGINES is not set
 # BR2_PACKAGE_OPENVPN is not set
-# BR2_PACKAGE_OPENSWAN is not set
 BR2_PACKAGE_PORTMAP=y
 # BR2_PACKAGE_PPPD is not set
 # BR2_PACKAGE_RADVD is not set
@@ -523,6 +512,7 @@
 # BR2_PACKAGE_WEBIF is not set
 # BR2_PACKAGE_WGET is not set
 BR2_PACKAGE_WIRELESS_TOOLS=y
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
 
 #
 # Hardware handling / blockdevices and filesystem maintenance
@@ -531,6 +521,10 @@
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
@@ -583,7 +577,10 @@
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
@@ -599,7 +596,6 @@
 # Audio and video libraries and applications
 #
 BR2_PACKAGE_ALSA_LIB=y
-# BR2_PACKAGE_ALSA_LIB_PYTHON is not set
 BR2_PACKAGE_ALSA_UTILS=y
 
 #
@@ -624,6 +620,7 @@
 # asterisk	- disabled (required openssl and mpg123)
 #
 # BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
 # BR2_PACKAGE_GSTREAMER is not set
 # BR2_PACKAGE_LIBID3TAG is not set
 BR2_PACKAGE_LIBMAD=y
@@ -632,16 +629,13 @@
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
-BR2_PACKAGE_MPG123_ALSA=y
 BR2_PACKAGE_MPLAYER=y
 # BR2_PACKAGE_SPEEX is not set
 # BR2_PACKAGE_FESTIVAL is not set
+# BR2_PACKAGE_TAGLIB is not set
 # BR2_PACKAGE_VLC is not set
 
 #
@@ -696,10 +690,10 @@
 # BR2_PACKAGE_QTOPIA4_DEBUG is not set
 BR2_PACKAGE_QTOPIA4_SHARED=y
 # BR2_PACKAGE_QTOPIA4_STATIC is not set
-BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL=y
 # BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
-BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED=y
+# BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED is not set
 # BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
+BR2_PACKAGE_QTOPIA4_GUI_MODULE=y
 
 #
 # Pixel depths
@@ -757,10 +751,14 @@
 # BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB is not set
 # BR2_PACKAGE_QTOPIA4_MOUSE_QVFB is not set
 # BR2_PACKAGE_QTOPIA4_PHONON is not set
+BR2_PACKAGE_QTOPIA4_XML=y
 # BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
 # BR2_PACKAGE_QTOPIA4_SVG is not set
+BR2_PACKAGE_QTOPIA4_NETWORK=y
 # BR2_PACKAGE_QTOPIA4_WEBKIT is not set
 # BR2_PACKAGE_QTOPIA4_OPENSSL is not set
+BR2_PACKAGE_QTOPIA4_SCRIPT=y
+# BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
@@ -769,6 +767,7 @@
 # X libraries and helper libraries
 #
 # BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
@@ -812,6 +811,7 @@
 #
 # BR2_PACKAGE_GZIP is not set
 BR2_PACKAGE_LZO=y
+# BR2_PACKAGE_LZOP is not set
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
@@ -861,6 +861,8 @@
 #
 # Target filesystem options
 #
+BR2_ROOTFS_PREFIX="atstk1002-rootfs"
+BR2_ROOTFS_SUFFIX="$(DATE)"
 
 #
 # filesystem for target device
@@ -897,11 +899,12 @@
 #
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
-BR2_TARGET_UBOOT_2009_01=y
-# BR2_TARGET_UBOOT_2008_10 is not set
+# BR2_TARGET_UBOOT_2009_03 is not set
+# BR2_TARGET_UBOOT_2009_01 is not set
+BR2_TARGET_UBOOT_2008_10=y
 # BR2_TARGET_UBOOT_1_3_4 is not set
 # BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
-BR2_UBOOT_VERSION="2009.01"
+BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
@@ -920,8 +923,8 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
-BR2_KERNEL_LATEST_2_6_28="2"
+BR2_KERNEL_CURRENT_VERSION="2.6.28.7"
+BR2_KERNEL_LATEST_2_6_28="7"
 BR2_KERNEL_LATEST_2_6_27="13"
 BR2_KERNEL_LATEST_2_6_26="8"
 BR2_KERNEL_LATEST_2_6_25="19"
