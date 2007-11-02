From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Nov 2007 13:11:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atngw100 atstk1002
Message-ID: <20071102201113.7B057A4B6D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-02 13:11:12 -0700 (Fri, 02 Nov 2007)
New Revision: 20352

Log:
Update defconfigs for AVR32 boards

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-11-02 15:25:59 UTC (rev 20351)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-11-02 20:11:12 UTC (rev 20352)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Wed Oct 24 00:47:46 2007
+# Fri Nov  2 18:26:44 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -358,6 +358,7 @@
 # BR2_PACKAGE_IPROUTE2 is not set
 # BR2_PACKAGE_IPSEC_TOOLS is not set
 # BR2_PACKAGE_IPTABLES is not set
+# BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set

Modified: trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2007-11-02 15:25:59 UTC (rev 20351)
+++ trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2007-11-02 20:11:12 UTC (rev 20352)
@@ -1,8 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Sun Sep 23 12:45:32 2007
+# Fri Nov  2 18:28:24 2007
 #
 BR2_HAVE_DOT_CONFIG=y
+BR2_VERSION="0.10.0-svn"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -28,6 +29,54 @@
 BR2_ENDIAN="BIG"
 
 #
+# Target options
+#
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
+BR2_TARGET_ATMEL=y
+
+#
+# Atmel AVR32 Specific Device Support
+#
+BR2_TARGET_AVR32=y
+BR2_TARGET_AT32AP7000=y
+# BR2_TARGET_AT32AP7001 is not set
+# BR2_TARGET_AT32AP7002 is not set
+
+#
+# Development Board support
+#
+BR2_TARGET_AVR32_ATSTK1002=y
+# BR2_TARGET_AVR32_ATNGW100 is not set
+BR2_BOARD_NAME="atstk1002"
+
+#
+# Package support
+#
+
+#
+# Secondary locations
+#
+BR2_TARGET_ATMEL_COPYTO=""
+BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
+
+#
+# Generic System Support
+#
+# BR2_TARGET_GENERIC_ACCESS_POINT is not set
+# BR2_TARGET_GENERIC_FIREWALL is not set
+# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
+
+#
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
@@ -50,13 +99,17 @@
 BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+# BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
+BR2_ROOTFS_PREFIX="rootfs"
+BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
+BR2_RECENT=y
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
 # BR2_STRIP_none is not set
@@ -68,17 +121,26 @@
 #
 # Toolchain
 #
-BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_BUILDROOT is not set
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_NORMAL is not set
+BR2_TOOLCHAIN_EXTERNAL_SOURCE=y
+BR2_TOOLCHAIN_SOURCE=y
+BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
+# BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)/Source"
 BR2_VENDOR_SUFFIX="-avr32"
-BR2_VENDOR_BINUTILS_RELEASE="-2.0"
+BR2_VENDOR_BINUTILS_RELEASE="-2.1.3"
 BR2_VENDOR_GCC_RELEASE="-2.0"
-BR2_VENDOR_UCLIBC_RELEASE="-2.0"
-BR2_VENDOR_GDB_RELEASE="-2.0"
+BR2_VENDOR_UCLIBC_RELEASE="-2.1.3"
+BR2_VENDOR_GDB_RELEASE="-2.1.3"
 BR2_VENDOR_PATCH_DIR="target/device/Atmel/toolchain/avr32"
+BR2_EXT_GCC_VERSION_4_1_2=y
+# BR2_EXT_GCC_VERSION_4_2_1 is not set
+BR2_EXT_BINUTILS_VERSION_2_17=y
+BR2_EXT_UCLIBC_VERSION_0_9_29=y
+# BR2_EXT_UCLIBC_VERSION_0_9_28_3 is not set
 
 #
 # Kernel Header Options
@@ -94,20 +156,19 @@
 # BR2_KERNEL_HEADERS_2_6_20 is not set
 # BR2_KERNEL_HEADERS_2_6_21_5 is not set
 # BR2_KERNEL_HEADERS_2_6_21 is not set
-BR2_KERNEL_HEADERS_2_6_22_1=y
+# BR2_KERNEL_HEADERS_2_6_22_1 is not set
+BR2_KERNEL_HEADERS_2_6_22_10=y
 # BR2_KERNEL_HEADERS_2_6_22 is not set
-# BR2_KERNEL_HEADERS_IPMI is not set
-# BR2_KERNEL_HEADERS_LZMA is not set
-# BR2_KERNEL_HEADERS_RT is not set
+# BR2_KERNEL_HEADERS_2_6_23 is not set
+# BR2_KERNEL_HEADERS_SNAP is not set
 # BR2_KERNEL_HEADERS_PATCH_DIR is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.22.1"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.22.10"
 
 #
 # uClibc Options
 #
-# BR2_UCLIBC_VERSION_0_9_28 is not set
-BR2_UCLIBC_VERSION_0_9_28_3=y
-# BR2_UCLIBC_VERSION_0_9_29 is not set
+# BR2_UCLIBC_VERSION_0_9_28_3 is not set
+BR2_UCLIBC_VERSION_0_9_29=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_ENABLE_LOCALE is not set
@@ -121,27 +182,7 @@
 #
 # Binutils Options
 #
-# BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
-# BR2_BINUTILS_VERSION_2_15 is not set
-# BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
-# BR2_BINUTILS_VERSION_2_16_1 is not set
-# BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
-# BR2_BINUTILS_VERSION_2_16_91_0_5 is not set
-# BR2_BINUTILS_VERSION_2_16_91_0_6 is not set
-# BR2_BINUTILS_VERSION_2_16_91_0_7 is not set
 BR2_BINUTILS_VERSION_2_17=y
-# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
 # BR2_BINUTILS_VERSION_2_18 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
@@ -151,27 +192,17 @@
 #
 # GCC Options
 #
-# BR2_GCC_VERSION_3_3_5 is not set
-# BR2_GCC_VERSION_3_3_6 is not set
-# BR2_GCC_VERSION_3_4_2 is not set
-# BR2_GCC_VERSION_3_4_3 is not set
-# BR2_GCC_VERSION_3_4_4 is not set
-# BR2_GCC_VERSION_3_4_5 is not set
 # BR2_GCC_VERSION_3_4_6 is not set
-# BR2_GCC_VERSION_4_0_0 is not set
-# BR2_GCC_VERSION_4_0_1 is not set
-# BR2_GCC_VERSION_4_0_2 is not set
-# BR2_GCC_VERSION_4_0_3 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
-# BR2_GCC_VERSION_4_1_0 is not set
-# BR2_GCC_VERSION_4_1_1 is not set
 BR2_GCC_VERSION_4_1_2=y
 # BR2_GCC_VERSION_4_2_0 is not set
 # BR2_GCC_VERSION_4_2_1 is not set
+# BR2_GCC_SUPPORTS_SYSROOT is not set
+# BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.1.2"
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-# BR2_GCC_CROSS_CXX is not set
+BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
 # BR2_GCC_SHARED_LIBGCC is not set
 
@@ -210,31 +241,21 @@
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 # BR2_USE_WCHAR is not set
+BR2_SOFT_FLOAT=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
 # Package Selection for the target
 #
-
-#
-# The default minimal system
-#
 BR2_PACKAGE_BUSYBOX=y
-# BR2_BUSYBOX_VERSION_1_0_1 is not set
-# BR2_BUSYBOX_VERSION_1_1_3 is not set
 # BR2_BUSYBOX_VERSION_1_2_2_1 is not set
-# BR2_BUSYBOX_VERSION_1_4_0 is not set
-# BR2_BUSYBOX_VERSION_1_4_1 is not set
-# BR2_BUSYBOX_VERSION_1_4_2 is not set
-# BR2_BUSYBOX_VERSION_1_5_0 is not set
-# BR2_BUSYBOX_VERSION_1_5_1 is not set
-# BR2_BUSYBOX_VERSION_1_6_0 is not set
 # BR2_BUSYBOX_VERSION_1_6_1 is not set
 # BR2_BUSYBOX_VERSION_1_7_0 is not set
-BR2_BUSYBOX_VERSION_1_7_1=y
+# BR2_BUSYBOX_VERSION_1_7_1 is not set
+BR2_BUSYBOX_VERSION_1_7_2=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.7.1"
+BR2_BUSYBOX_VERSION="1.7.2"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -294,13 +315,17 @@
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
+# BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
-# BR2_PACKAGE_MICROCOM is not set
 # BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_SQLITE is not set
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
 BR2_NETWORK_SUPPORT=y
+
+#
+# Networking applications
+#
 # BR2_PACKAGE_ARGUS is not set
 BR2_PACKAGE_AVAHI=y
 BR2_PACKAGE_AVAHI_AUTOIPD=y
@@ -319,6 +344,7 @@
 # BR2_PACKAGE_IPROUTE2 is not set
 # BR2_PACKAGE_IPSEC_TOOLS is not set
 # BR2_PACKAGE_IPTABLES is not set
+# BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
@@ -326,6 +352,7 @@
 # BR2_PACKAGE_LINKS is not set
 BR2_PACKAGE_LRZSZ=y
 # BR2_PACKAGE_MDNSRESPONDER is not set
+# BR2_PACKAGE_MICROCOM is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
 BR2_PACKAGE_NBD=y
@@ -417,14 +444,10 @@
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MKDOSFS is not set
 BR2_PACKAGE_MTD=y
-# BR2_PACKAGE_MTD_EXPERIMENTAL is not set
-
-#
-# MTD package selection
-#
-BR2_PACKAGE_MTD_ORIG=y
+BR2_PACKAGE_MTD_UTILS=y
+# BR2_PACKAGE_MTD_20061007 is not set
+# BR2_PACKAGE_MTD_20050122 is not set
 # BR2_PACKAGE_MTD_SNAPSHOT is not set
-BR2_PACKAGE_MTD_ORIG_STRING="mtd-utils-1.0.0.tar.gz"
 
 #
 # MTD tools selection
@@ -485,8 +508,12 @@
 BR2_PACKAGE_LIBID3TAG=y
 BR2_PACKAGE_LIBMAD=y
 # BR2_PACKAGE_LIBMAD_TARGET_HEADERS is not set
+# BR2_PACKAGE_LIBOGG is not set
 # BR2_PACKAGE_LIBSNDFILE is not set
-# BR2_PACKAGE_LIBVORBIS is not set
+
+#
+# libvorbis requires the package libogg to build
+#
 BR2_PACKAGE_MADPLAY=y
 BR2_PACKAGE_MADPLAY_ALSA=y
 BR2_PACKAGE_MPG123=y
@@ -573,7 +600,7 @@
 #
 BR2_PACKAGE_MPLAYER=y
 BR2_COMPRESSOR_SUPPORT=y
-# BR2_PACKAGE_LZO is not set
+BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
@@ -581,7 +608,7 @@
 # BR2_SCRIPTING_SUPPORT is not set
 
 #
-# Target Options
+# Target filesystem options
 #
 
 #
@@ -608,6 +635,7 @@
 BR2_TARGET_ROOTFS_TAR_BZIP2=y
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+BR2_TARGET_ROOTFS_TAR_COPYTO=""
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 
@@ -619,62 +647,54 @@
 # Kernel
 #
 # BR2_KERNEL_none is not set
-BR2_KERNEL_LINUX=y
+BR2_KERNEL_LINUX_ADVANCED=y
+# BR2_KERNEL_LINUX is not set
 # BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
-# BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG is not set
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.22.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
+BR2_KERNEL_CURRENT_VERSION="2.6.23.1"
+BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
+BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
+BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
+# BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_23 is not set
+BR2_LINUX_2_6_22_10=y
+# BR2_LINUX_2_6_22_1 is not set
+# BR2_LINUX_2_6_22 is not set
+# BR2_LINUX_2_6_21_7 is not set
+# BR2_LINUX_2_6_21_5 is not set
+# BR2_LINUX_2_6_21 is not set
+# BR2_LINUX_2_6_20 is not set
+# BR2_LINUX26_CUSTOM is not set
 
 #
-# Board Support Options
+# Patches
 #
+# BR2_KERNEL_ADD_PATCH is not set
+BR2_LINUX_BSP_PATCH=""
+BR2_KERNEL_PREPATCHED=y
+# BR2_KERNEL_BASE is not set
+# BR2_KERNEL_LATEST is not set
+BR2_DOWNLOAD_LINUX26_VERSION="2.6.22.10"
+BR2_LINUX26_VERSION="2.6.22.10"
 
 #
-# Project Options
+# Linux Kernel Configuration
 #
-BR2_PROJECT="atstk1002"
-BR2_HOSTNAME="stk1000.example.net"
-BR2_BANNER="ATSTK1002 $(DATE)"
+BR2_PACKAGE_LINUX_USE_KCONFIG=y
+# BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
+# BR2_PACKAGE_LINUX_USE_XCONFIG is not set
+# BR2_LINUX_BIN_BZIMAGE is not set
+BR2_LINUX_BIN_UIMAGE=y
+# BR2_LINUX_BIN_VMLINUX is not set
+# BR2_LINUX_BIN_ZIMAGE is not set
+# BR2_LINUX_BIN_CUSTOM is not set
 
 #
-# Preset Devices
+# Destinations for linux kernel binaries
 #
-BR2_TARGET_ATMEL=y
-
-#
-# Atmel AVR32 Specific Device Support
-#
-BR2_TARGET_AVR32=y
-BR2_TARGET_AT32AP7000=y
-# BR2_TARGET_AT32AP7001 is not set
-# BR2_TARGET_AT32AP7002 is not set
-
-#
-# Development Board support
-#
-BR2_TARGET_AVR32_ATSTK1002=y
-# BR2_TARGET_AVR32_ATNGW100 is not set
-BR2_BOARD_NAME="atstk1002"
-
-#
-# Package support
-#
-
-#
-# Secondary locations
-#
-BR2_TARGET_ATMEL_COPYTO=""
-BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-# BR2_TARGET_UBOOT is not set
-
-#
-# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
-#
-
-#
-# Generic System Support
-#
-# BR2_TARGET_GENERIC_ACCESS_POINT is not set
-# BR2_TARGET_GENERIC_FIREWALL is not set
-# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
+# BR2_LINUX_COPYTO_ROOTFS is not set
+BR2_LINUX_COPYTO_TFTPBOOT=y
+BR2_LINUX_COPYTO=""
+BR2_LINUX_COPY_CONFIGURATION=y
