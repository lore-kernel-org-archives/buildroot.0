From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Nov 2007 08:18:26 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20071102151826.37936A4652@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-02 08:18:25 -0700 (Fri, 02 Nov 2007)
New Revision: 20350

Log:
Update at91sam9260dfc defconfig

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2007-10-31 12:46:52 UTC (rev 20349)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2007-11-02 15:18:25 UTC (rev 20350)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sat Oct 13 17:46:13 2007
+# Fri Nov  2 13:35:52 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -150,6 +150,7 @@
 BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+# BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
@@ -405,6 +406,7 @@
 # BR2_PACKAGE_IPROUTE2 is not set
 # BR2_PACKAGE_IPSEC_TOOLS is not set
 # BR2_PACKAGE_IPTABLES is not set
+# BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
@@ -422,7 +424,10 @@
 # BR2_PACKAGE_NETKITTELNET is not set
 # BR2_PACKAGE_NETPLUG is not set
 # BR2_PACKAGE_NETSNMP is not set
-# BR2_PACKAGE_NFS_UTILS is not set
+
+#
+# nfs-utils requires a toolchain with 'Enable RPC' selected
+#
 # BR2_PACKAGE_NTP is not set
 # BR2_PACKAGE_OLSR is not set
 # BR2_PACKAGE_OPENNTPD is not set
@@ -430,7 +435,10 @@
 # BR2_PACKAGE_OPENSSL is not set
 # BR2_PACKAGE_OPENVPN is not set
 # BR2_PACKAGE_OPENSWAN is not set
-# BR2_PACKAGE_PORTMAP is not set
+
+#
+# portmap requires a toolchain with 'Enable RPC' selected
+#
 # BR2_PACKAGE_PPPD is not set
 # BR2_PACKAGE_RP_PPPOE is not set
 # BR2_PACKAGE_PPTP_LINUX is not set
@@ -527,8 +535,12 @@
 # BR2_PACKAGE_ASTERISK is not set
 # BR2_PACKAGE_AUMIX is not set
 # BR2_PACKAGE_LIBMAD is not set
+# BR2_PACKAGE_LIBOGG is not set
 # BR2_PACKAGE_LIBSNDFILE is not set
-# BR2_PACKAGE_LIBVORBIS is not set
+
+#
+# libvorbis requires the package libogg to build
+#
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
 BR2_GRAPHIC_SUPPORT=y
@@ -637,8 +649,11 @@
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
 BR2_TARGET_ROOTFS_EXT2_COPYTO=""
 BR2_TARGET_ROOTFS_JFFS2=y
-# BR2_TARGET_ROOTFS_JFFS2_FLASH is not set
-BR2_TARGET_ROOTFS_JFFS2_DATAFLASH=y
+BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
+# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
+# BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
+# BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
+# BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
 BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x420
 BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x2100
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
@@ -666,11 +681,12 @@
 # BR2_KERNEL_LINUX is not set
 # BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
-BR2_PACKAGE_LINUX_USE_KCONFIG=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.22"
+BR2_KERNEL_CURRENT_VERSION="2.6.23.1"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
+BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
+BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
 # BR2_LINUX_2_6_23 is not set
 # BR2_LINUX_2_6_22_10 is not set
@@ -685,6 +701,7 @@
 #
 # Patches
 #
+# BR2_KERNEL_ADD_PATCH is not set
 BR2_LINUX_BSP_PATCH="linux-2.6.20.4-atmel.patch.bz2"
 BR2_KERNEL_PREPATCHED=y
 # BR2_KERNEL_BASE is not set
@@ -695,6 +712,7 @@
 #
 # Linux Kernel Configuration
 #
+BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
 # BR2_LINUX_BIN_BZIMAGE is not set
