From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 03:56:17 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk1002
Message-ID: <20070923105617.AAED73007A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 03:56:16 -0700 (Sun, 23 Sep 2007)
New Revision: 19963

Log:
Update atstk1002 config

Modified:
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2007-09-23 10:16:58 UTC (rev 19962)
+++ trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2007-09-23 10:56:16 UTC (rev 19963)
@@ -1,14 +1,8 @@
 #
 # Automatically generated make config: don't edit
+# Sun Sep 23 12:45:32 2007
 #
 BR2_HAVE_DOT_CONFIG=y
-
-#
-# Project Options
-#
-BR2_PROJECT="atstk1002"
-BR2_HOSTNAME="stk1000.example.net"
-BR2_BANNER="ATSTK1002 $(DATE)"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -25,6 +19,7 @@
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
+# BR2_sparc64 is not set
 # BR2_x86_64 is not set
 BR2_at32ap7000=y
 # BR2_at32ap7001 is not set
@@ -36,13 +31,24 @@
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
-BR2_SVN="svn co"
+BR2_SVN_CO="svn co"
+BR2_SVN_UP="svn up"
+BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(BASE_DIR)/src/dl"
+
+#
+# Mirrors and Download locations
+#
 BR2_SOURCEFORGE_MIRROR="easynews"
+
+#
+# Atmel Mirrors
+#
 BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
@@ -51,13 +57,28 @@
 BR2_JLEVEL=1
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
+BR2_STRIP_strip=y
+# BR2_STRIP_sstrip is not set
+# BR2_STRIP_none is not set
 # BR2_PREFER_STATIC_LIB is not set
-BR2_TOOLCHAIN_BUILDROOT=y
-# BR2_TOOLCHAIN_EXTERNAL is not set
+# BR2_HAVE_MANPAGES is not set
+# BR2_HAVE_INFOPAGES is not set
+BR2_UPDATE_CONFIG=y
 
 #
-# Toolchain Options
+# Toolchain
 #
+BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_EXTERNAL is not set
+# BR2_TOOLCHAIN_NORMAL is not set
+BR2_TOOLCHAIN_ATMEL_AVR32=y
+BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)/Source"
+BR2_VENDOR_SUFFIX="-avr32"
+BR2_VENDOR_BINUTILS_RELEASE="-2.0"
+BR2_VENDOR_GCC_RELEASE="-2.0"
+BR2_VENDOR_UCLIBC_RELEASE="-2.0"
+BR2_VENDOR_GDB_RELEASE="-2.0"
+BR2_VENDOR_PATCH_DIR="target/device/Atmel/toolchain/avr32"
 
 #
 # Kernel Header Options
@@ -69,11 +90,17 @@
 # BR2_KERNEL_HEADERS_2_6_9 is not set
 # BR2_KERNEL_HEADERS_2_6_11 is not set
 # BR2_KERNEL_HEADERS_2_6_12 is not set
-# BR2_KERNEL_HEADERS_2_6_19_2 is not set
+# BR2_KERNEL_HEADERS_2_6_20_4 is not set
 # BR2_KERNEL_HEADERS_2_6_20 is not set
+# BR2_KERNEL_HEADERS_2_6_21_5 is not set
 # BR2_KERNEL_HEADERS_2_6_21 is not set
-BR2_KERNEL_HEADERS_2_6_22=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.22"
+BR2_KERNEL_HEADERS_2_6_22_1=y
+# BR2_KERNEL_HEADERS_2_6_22 is not set
+# BR2_KERNEL_HEADERS_IPMI is not set
+# BR2_KERNEL_HEADERS_LZMA is not set
+# BR2_KERNEL_HEADERS_RT is not set
+# BR2_KERNEL_HEADERS_PATCH_DIR is not set
+BR2_DEFAULT_KERNEL_HEADERS="2.6.22.1"
 
 #
 # uClibc Options
@@ -89,6 +116,7 @@
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
+# BR2_UCLIBC_PROGRAM_INVOCATION is not set
 
 #
 # Binutils Options
@@ -115,11 +143,13 @@
 # BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
+# BR2_BINUTILS_VERSION_2_18 is not set
+# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
 BR2_BINUTILS_VERSION="2.17"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
-# Gcc Options
+# GCC Options
 #
 # BR2_GCC_VERSION_3_3_5 is not set
 # BR2_GCC_VERSION_3_3_6 is not set
@@ -137,11 +167,11 @@
 # BR2_GCC_VERSION_4_1_1 is not set
 BR2_GCC_VERSION_4_1_2=y
 # BR2_GCC_VERSION_4_2_0 is not set
+# BR2_GCC_VERSION_4_2_1 is not set
 BR2_GCC_VERSION="4.1.2"
-# BR2_TOOLCHAIN_SYSROOT is not set
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
-BR2_GCC_AVR32_CONFIGURATION=y
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+# BR2_GCC_CROSS_CXX is not set
 BR2_INSTALL_LIBSTDCPP=y
 # BR2_GCC_SHARED_LIBGCC is not set
 
@@ -179,6 +209,7 @@
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
+# BR2_USE_WCHAR is not set
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
@@ -199,9 +230,11 @@
 # BR2_BUSYBOX_VERSION_1_5_0 is not set
 # BR2_BUSYBOX_VERSION_1_5_1 is not set
 # BR2_BUSYBOX_VERSION_1_6_0 is not set
-BR2_BUSYBOX_VERSION_1_6_1=y
+# BR2_BUSYBOX_VERSION_1_6_1 is not set
+# BR2_BUSYBOX_VERSION_1_7_0 is not set
+BR2_BUSYBOX_VERSION_1_7_1=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.6.1"
+BR2_BUSYBOX_VERSION="1.7.1"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -224,7 +257,6 @@
 # BR2_PACKAGE_AUTOMAKE is not set
 # BR2_PACKAGE_BISON is not set
 # BR2_PACKAGE_CCACHE_TARGET is not set
-# BR2_PACKAGE_CVS is not set
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_EXPAT is not set
@@ -236,7 +268,6 @@
 # BR2_PACKAGE_LIBMPFR is not set
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
-# BR2_PACKAGE_MPATROL is not set
 # BR2_PACKAGE_PKGCONFIG is not set
 # BR2_READLINE is not set
 # BR2_PACKAGE_XERCES is not set
@@ -251,6 +282,7 @@
 # BR2_PACKAGE_DASH is not set
 BR2_PACKAGE_FILE=y
 # BR2_PACKAGE_KEXEC is not set
+BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
 # BR2_PACKAGE_LIBFLOAT is not set
@@ -280,10 +312,9 @@
 # BR2_PACKAGE_LIBCURL is not set
 # BR2_PACKAGE_DNSMASQ is not set
 BR2_PACKAGE_DROPBEAR=y
-BR2_PACKAGE_DROPBEAR_URANDOM=y
 # BR2_PACKAGE_ETHTOOL is not set
 # BR2_PACKAGE_HASERL is not set
-# BR2_PACKAGE_HOSTAP is not set
+# BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
 # BR2_PACKAGE_IPSEC_TOOLS is not set
@@ -294,7 +325,9 @@
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LINKS is not set
 BR2_PACKAGE_LRZSZ=y
+# BR2_PACKAGE_MDNSRESPONDER is not set
 # BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MUTT is not set
 BR2_PACKAGE_NBD=y
 # BR2_PACKAGE_NCFTP is not set
 # BR2_PACKAGE_NETKITBASE is not set
@@ -304,6 +337,7 @@
 # BR2_PACKAGE_NFS_UTILS is not set
 BR2_PACKAGE_NTP=y
 # BR2_PACKAGE_NTP_SNTP is not set
+# BR2_PACKAGE_OLSR is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
@@ -311,6 +345,8 @@
 # BR2_PACKAGE_OPENSWAN is not set
 BR2_PACKAGE_PORTMAP=y
 # BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RP_PPPOE is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
 BR2_PACKAGE_PROFTPD=y
 # BR2_PACKAGE_QUAGGA is not set
 
@@ -356,6 +392,7 @@
 # BR2_PACKAGE_SOCAT is not set
 # BR2_PACKAGE_STUNNEL is not set
 # BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_TFTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
@@ -374,11 +411,13 @@
 # BR2_PACKAGE_LIBAIO is not set
 # BR2_PACKAGE_LIBRAW1394 is not set
 # BR2_PACKAGE_LIBUSB is not set
+# BR2_PACKAGE_LM_SENSORS is not set
 # BR2_PACKAGE_LVM2 is not set
 # BR2_PACKAGE_MDADM is not set
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MKDOSFS is not set
 BR2_PACKAGE_MTD=y
+# BR2_PACKAGE_MTD_EXPERIMENTAL is not set
 
 #
 # MTD package selection
@@ -443,12 +482,13 @@
 # BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST is not set
 # BR2_PACKAGE_ASTERISK is not set
 # BR2_PACKAGE_AUMIX is not set
+BR2_PACKAGE_LIBID3TAG=y
 BR2_PACKAGE_LIBMAD=y
 # BR2_PACKAGE_LIBMAD_TARGET_HEADERS is not set
-BR2_PACKAGE_LIBID3TAG=y
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBVORBIS is not set
 BR2_PACKAGE_MADPLAY=y
 BR2_PACKAGE_MADPLAY_ALSA=y
-# BR2_PACKAGE_LIBSNDFILE is not set
 BR2_PACKAGE_MPG123=y
 BR2_PACKAGE_MPG123_ALSA=y
 BR2_GRAPHIC_SUPPORT=y
@@ -470,6 +510,7 @@
 # graphic libraries
 #
 # BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
 BR2_PACKAGE_JPEG=y
 BR2_PACKAGE_LIBPNG=y
 BR2_PACKAGE_LIBUNGIF=y
@@ -477,12 +518,14 @@
 # BR2_PACKAGE_TIFF is not set
 
 #
-# console applications
+# busybox graphic applications
 #
+
+#
+# --> (May be broken in busybox)
+#
+BR2_PACKAGE_FBV=y
 BR2_PACKAGE_FBSET=y
-BR2_PACKAGE_FBV=y
-# BR2_PACKAGE_IMAGEMAGICK is not set
-BR2_PACKAGE_MPLAYER=y
 
 #
 # other GUIs
@@ -491,42 +534,44 @@
 BR2_PACKAGE_QTOPIA4=y
 # BR2_PACKAGE_QTOPIA4_DEBUG is not set
 BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL=y
-# BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMERCIAL is not set
+# BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
 BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED=y
 # BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
 BR2_PACKAGE_QTOPIA4_DEPTHS="-depths 24,16,8"
+# BR2_PACKAGE_QTOPIA4_GIF is not set
+# BR2_PACKAGE_QTOPIA4_LIBMNG is not set
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="$(ARCH)"
+BR2_PACKAGE_XSERVER_none=y
+# BR2_PACKAGE_XSERVER_x11r7 is not set
+# BR2_PACKAGE_XSERVER_xorg is not set
+# BR2_PACKAGE_XSERVER_tinyx is not set
+BR2_X11_PREFIX="/usr"
 
 #
-# X Window System server
-#
-# BR2_PACKAGE_XORG is not set
-# BR2_PACKAGE_TINYX is not set
-
-#
 # X libraries and helper libraries
 #
 # BR2_PACKAGE_ATK is not set
-# BR2_PACKAGE_CAIRO is not set
 # BR2_PACKAGE_PANGO is not set
+# BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
-# BR2_PACKAGE_LIBGTK12 is not set
-# BR2_PACKAGE_LIBGTK2 is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_TSLIB is not set
 
 #
 # X Window managers
 #
-# BR2_PACKAGE_METACITY is not set
+# BR2_PACKAGE_MATCHBOX is not set
 
 #
 # X applications
 #
-# BR2_PACKAGE_DILLO is not set
-# BR2_PACKAGE_RDESKTOP is not set
-# BR2_PACKAGE_RXVT is not set
+
+#
+# Video libraries/codecs and applications
+#
+BR2_PACKAGE_MPLAYER=y
 BR2_COMPRESSOR_SUPPORT=y
 # BR2_PACKAGE_LZO is not set
 # BR2_PACKAGE_LZMA_TARGET is not set
@@ -556,10 +601,6 @@
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
 BR2_TARGET_ROOTFS_EXT2_COPYTO=""
 # BR2_TARGET_ROOTFS_JFFS2 is not set
-# BR2_TARGET_ROOTFS_JFFS2_FLASH is not set
-# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH is not set
-# BR2_TARGET_ROOTFS_JFFS2_LE is not set
-# BR2_TARGET_ROOTFS_JFFS2_BE is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
 # BR2_TARGET_ROOTFS_TAR_NONE is not set
@@ -575,15 +616,30 @@
 #
 
 #
-# Linux Options
+# Kernel
 #
+# BR2_KERNEL_none is not set
+BR2_KERNEL_LINUX=y
+# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
+# BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG is not set
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.22.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
 
 #
 # Board Support Options
 #
+
+#
+# Project Options
+#
+BR2_PROJECT="atstk1002"
+BR2_HOSTNAME="stk1000.example.net"
+BR2_BANNER="ATSTK1002 $(DATE)"
+
+#
+# Preset Devices
+#
 BR2_TARGET_ATMEL=y
 
 #
@@ -613,6 +669,10 @@
 # BR2_TARGET_UBOOT is not set
 
 #
+# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
+#
+
+#
 # Generic System Support
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
