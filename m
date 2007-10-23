From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 23 Oct 2007 16:01:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20071023230105.68EF9A45D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-23 16:01:04 -0700 (Tue, 23 Oct 2007)
New Revision: 20319

Log:
update NGW100 defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-10-23 11:47:01 UTC (rev 20318)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-10-23 23:01:04 UTC (rev 20319)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Mon Oct  1 23:15:43 2007
+# Wed Oct 24 00:47:46 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -68,18 +68,8 @@
 #
 BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_SERVERIP="10.175.196.220"
-BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
-BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
-BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
-BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
 
 #
-# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
-#
-
-#
 # Generic System Support
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
@@ -109,13 +99,17 @@
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
 BR2_DEPRECATED=y
+BR2_RECENT=y
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
 # BR2_STRIP_none is not set
@@ -131,15 +125,22 @@
 # BR2_TOOLCHAIN_EXTERNAL is not set
 BR2_TOOLCHAIN_EXTERNAL_SOURCE=y
 BR2_TOOLCHAIN_SOURCE=y
+BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
+# BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
-# BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
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
@@ -155,20 +156,19 @@
 # BR2_KERNEL_HEADERS_2_6_20 is not set
 # BR2_KERNEL_HEADERS_2_6_21_5 is not set
 # BR2_KERNEL_HEADERS_2_6_21 is not set
-BR2_KERNEL_HEADERS_2_6_22_1=y
+# BR2_KERNEL_HEADERS_2_6_22_1 is not set
+BR2_KERNEL_HEADERS_2_6_22_10=y
 # BR2_KERNEL_HEADERS_2_6_22 is not set
+# BR2_KERNEL_HEADERS_2_6_23 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-# BR2_KERNEL_HEADERS_IPMI is not set
-# BR2_KERNEL_HEADERS_LZMA is not set
-# BR2_KERNEL_HEADERS_RT is not set
 BR2_KERNEL_HEADERS_PATCH_DIR=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.22.1"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.22.10"
 
 #
 # uClibc Options
 #
-BR2_UCLIBC_VERSION_0_9_28_3=y
-# BR2_UCLIBC_VERSION_0_9_29 is not set
+# BR2_UCLIBC_VERSION_0_9_28_3 is not set
+BR2_UCLIBC_VERSION_0_9_29=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_ENABLE_LOCALE is not set
@@ -234,6 +234,7 @@
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_USE_WCHAR=y
+BR2_SOFT_FLOAT=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
@@ -317,6 +318,7 @@
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
+# BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
 # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
 # BR2_PACKAGE_MODUTILS is not set
@@ -514,10 +516,13 @@
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
 BR2_TARGET_ROOTFS_EXT2_COPYTO=""
 BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_FLASH=y
-# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH is not set
+# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
+# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
+BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
+# BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
+# BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
 BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
-BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x10000
+BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
 # BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER is not set
 # BR2_JFFS2_TARGET_SREC is not set
 # BR2_TARGET_ROOTFS_JFFS2_PAD is not set
@@ -533,6 +538,7 @@
 BR2_TARGET_ROOTFS_TAR_BZIP2=y
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+BR2_TARGET_ROOTFS_TAR_COPYTO=""
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 
@@ -544,41 +550,44 @@
 # Kernel
 #
 # BR2_KERNEL_none is not set
-BR2_KERNEL_LINUX=y
+BR2_KERNEL_LINUX_ADVANCED=y
+# BR2_KERNEL_LINUX is not set
 # BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
-BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-# BR2_LINUX_2_6_SNAP is not set
-# BR2_LINUX_2_6_MM is not set
+BR2_KERNEL_CURRENT_VERSION="2.6.23.1"
+BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
+BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
+BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
-BR2_LINUX_2_6_22_1=y
+# BR2_LINUX_2_6_23 is not set
+BR2_LINUX_2_6_22_10=y
+# BR2_LINUX_2_6_22_1 is not set
 # BR2_LINUX_2_6_22 is not set
-# BR2_LINUX_2_6_21_6 is not set
-# BR2_LINUX_2_6_21_1 is not set
+# BR2_LINUX_2_6_21_7 is not set
+# BR2_LINUX_2_6_21_5 is not set
 # BR2_LINUX_2_6_21 is not set
-# BR2_LINUX_2_6_20_4 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_19_2 is not set
-# BR2_LINUX_2_6_19 is not set
-# BR2_LINUX_2_6_18 is not set
-# BR2_LINUX_2_6_17 is not set
-# BR2_LINUX_2_6_16 is not set
-# BR2_LINUX_2_6_15 is not set
-# BR2_LINUX_2_6_23 is not set
-# BR2_LINUX_CUSTOM is not set
+# BR2_LINUX26_CUSTOM is not set
 
 #
 # Patches
 #
+# BR2_KERNEL_ADD_PATCH is not set
 BR2_LINUX_BSP_PATCH=""
-BR2_DOWNLOAD_LINUX26_VERSION="2.6.22.1"
-BR2_LINUX26_VERSION="2.6.22.1"
-BR2_LINUX26_RC_PATCH=""
+BR2_KERNEL_PREPATCHED=y
+# BR2_KERNEL_BASE is not set
+# BR2_KERNEL_LATEST is not set
+BR2_DOWNLOAD_LINUX26_VERSION="2.6.22.10"
+BR2_LINUX26_VERSION="2.6.22.10"
+
+#
+# Linux Kernel Configuration
+#
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
-# BR2_LINUX26_DEFCONFIG is not set
-# BR2_LINUX_CUSTOMIZE is not set
+# BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
+# BR2_PACKAGE_LINUX_USE_XCONFIG is not set
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set
@@ -588,6 +597,7 @@
 #
 # Destinations for linux kernel binaries
 #
-# BR2_LINUX_IN_ROOTFS is not set
-BR2_LINUX_COPY=y
-BR2_LINUX_COPYTO="/tftpboot"
+# BR2_LINUX_COPYTO_ROOTFS is not set
+BR2_LINUX_COPYTO_TFTPBOOT=y
+BR2_LINUX_COPYTO=""
+BR2_LINUX_COPY_CONFIGURATION=y
