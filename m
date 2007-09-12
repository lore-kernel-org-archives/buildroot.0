From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 11 Sep 2007 21:40:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20070912044045.AD03CA6849@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-11 21:40:45 -0700 (Tue, 11 Sep 2007)
New Revision: 19822

Log:
Update atngw100 board support

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-09-12 04:40:02 UTC (rev 19821)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-09-12 04:40:45 UTC (rev 19822)
@@ -1,25 +1,35 @@
 #
 # Automatically generated make config: don't edit
+# Wed Sep  5 08:47:23 2007
 #
 BR2_HAVE_DOT_CONFIG=y
+
+#
+# Project Options
+#
+BR2_PROJECT="atngw100"
+BR2_HOSTNAME="ATNGW100"
+BR2_BANNER="Welcome to the Erik's uClibc development environment."
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
 BR2_avr32=y
 # BR2_cris is not set
+# BR2_ia64 is not set
 # BR2_i386 is not set
 # BR2_m68k is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
 # BR2_nios2 is not set
 # BR2_powerpc is not set
+# BR2_s390 is not set
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
 # BR2_x86_64 is not set
-BR2_ap7000=y
-# BR2_ap7010 is not set
-# BR2_ap7020 is not set
+BR2_at32ap7000=y
+# BR2_at32ap7001 is not set
+# BR2_at32ap7002 is not set
 BR2_ARCH="avr32"
 BR2_ENDIAN="BIG"
 
@@ -28,22 +38,52 @@
 #
 BR2_WGET="wget --passive-ftp"
 BR2_SVN="svn co"
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
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
-BR2_JLEVEL=1
+BR2_JLEVEL=2
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
+BR2_STRIP_strip=y
+# BR2_STRIP_sstrip is not set
+# BR2_STRIP_none is not set
+# BR2_PREFER_STATIC_LIB is not set
+# BR2_HAVE_MANPAGES is not set
+# BR2_HAVE_INFOPAGES is not set
+BR2_UPDATE_CONFIG=y
+
+#
+# Toolchain type
+#
 BR2_TOOLCHAIN_BUILDROOT=y
 # BR2_TOOLCHAIN_EXTERNAL is not set
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
 # Toolchain Options
@@ -61,21 +101,28 @@
 # BR2_KERNEL_HEADERS_2_6_12 is not set
 # BR2_KERNEL_HEADERS_2_6_19_2 is not set
 # BR2_KERNEL_HEADERS_2_6_20 is not set
-BR2_KERNEL_HEADERS_2_6_21=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.21.3"
+# BR2_KERNEL_HEADERS_2_6_21 is not set
+BR2_KERNEL_HEADERS_2_6_22=y
+# BR2_KERNEL_HEADERS_IPMI is not set
+# BR2_KERNEL_HEADERS_LZMA is not set
+# BR2_KERNEL_HEADERS_PATCH_DIR is not set
+BR2_DEFAULT_KERNEL_HEADERS="2.6.22.1"
 
 #
 # uClibc Options
 #
 # BR2_UCLIBC_VERSION_0_9_28 is not set
 BR2_UCLIBC_VERSION_0_9_28_3=y
+# BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.28.config"
 # BR2_ENABLE_LOCALE is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_PTHREAD_DEBUG=y
+# BR2_UCLIBC_PROGRAM_INVOCATION is not set
 
 #
 # Binutils Options
@@ -100,6 +147,8 @@
 # BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
+# BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
+# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
 BR2_BINUTILS_VERSION="2.17"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
@@ -121,13 +170,14 @@
 # BR2_GCC_VERSION_4_1_0 is not set
 # BR2_GCC_VERSION_4_1_1 is not set
 BR2_GCC_VERSION_4_1_2=y
-# BR2_GCC_VERSION_4_2 is not set
+# BR2_GCC_VERSION_4_2_0 is not set
+# BR2_GCC_VERSION_4_2_1 is not set
 BR2_GCC_VERSION="4.1.2"
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
-BR2_GCC_AVR32_CONFIGURATION=y
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+# BR2_GCC_CROSS_CXX is not set
 BR2_INSTALL_LIBSTDCPP=y
-# BR2_GCC_SHARED_LIBGCC is not set
+BR2_GCC_SHARED_LIBGCC=y
 
 #
 # Ccache Options
@@ -144,6 +194,7 @@
 # BR2_GDB_VERSION_6_3 is not set
 BR2_GDB_VERSION_6_4=y
 # BR2_GDB_VERSION_6_5 is not set
+# BR2_GDB_VERSION_6_6 is not set
 # BR2_GDB_VERSION_SNAPSHOT is not set
 BR2_GDB_VERSION="6.4"
 
@@ -160,6 +211,9 @@
 # BR2_PACKAGE_SSTRIP_HOST is not set
 # BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
+BR2_INET_IPV6=y
+BR2_INET_RPC=y
+BR2_USE_WCHAR=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
@@ -177,9 +231,13 @@
 # BR2_BUSYBOX_VERSION_1_4_0 is not set
 # BR2_BUSYBOX_VERSION_1_4_1 is not set
 # BR2_BUSYBOX_VERSION_1_4_2 is not set
-BR2_BUSYBOX_VERSION_1_5_0=y
+# BR2_BUSYBOX_VERSION_1_5_0 is not set
+# BR2_BUSYBOX_VERSION_1_5_1 is not set
+# BR2_BUSYBOX_VERSION_1_6_0 is not set
+BR2_BUSYBOX_VERSION_1_6_1=y
+# BR2_BUSYBOX_VERSION_1_7_0 is not set
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.5.0"
+BR2_BUSYBOX_VERSION="1.6.1"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG=""
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -214,7 +272,6 @@
 # BR2_PACKAGE_LIBMPFR is not set
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
-# BR2_PACKAGE_MPATROL is not set
 # BR2_PACKAGE_PKGCONFIG is not set
 # BR2_READLINE is not set
 # BR2_PACKAGE_XERCES is not set
@@ -229,11 +286,15 @@
 # BR2_PACKAGE_DASH is not set
 BR2_PACKAGE_FILE=y
 # BR2_PACKAGE_KEXEC is not set
+BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
 # BR2_PACKAGE_LIBFLOAT is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
 BR2_PACKAGE_LIBSYSFS=y
+# BR2_PACKAGE_LIBXML2 is not set
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
@@ -246,6 +307,8 @@
 BR2_NETWORK_SUPPORT=y
 # BR2_PACKAGE_ARGUS is not set
 BR2_PACKAGE_AVAHI=y
+BR2_PACKAGE_AVAHI_AUTOIPD=y
+# BR2_PACKAGE_AVAHI_DAEMON is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 BR2_PACKAGE_BRIDGE=y
@@ -253,10 +316,9 @@
 # BR2_PACKAGE_LIBCURL is not set
 BR2_PACKAGE_DNSMASQ=y
 BR2_PACKAGE_DROPBEAR=y
-BR2_PACKAGE_DROPBEAR_URANDOM=y
 # BR2_PACKAGE_ETHTOOL is not set
 BR2_PACKAGE_HASERL=y
-# BR2_PACKAGE_HOSTAP is not set
+# BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
 # BR2_PACKAGE_IPSEC_TOOLS is not set
@@ -265,17 +327,20 @@
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
 # BR2_PACKAGE_LIBPCAP is not set
-# BR2_PACKAGE_LIGHTTPD is not set
 # BR2_PACKAGE_LINKS is not set
 BR2_PACKAGE_LRZSZ=y
+# BR2_PACKAGE_MDNSRESPONDER is not set
 # BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MUTT is not set
 BR2_PACKAGE_NBD=y
+# BR2_PACKAGE_NCFTP is not set
 # BR2_PACKAGE_NETKITBASE is not set
 # BR2_PACKAGE_NETKITTELNET is not set
 # BR2_PACKAGE_NETPLUG is not set
 # BR2_PACKAGE_NETSNMP is not set
 # BR2_PACKAGE_NFS_UTILS is not set
 BR2_PACKAGE_NTP=y
+# BR2_PACKAGE_NTP_SNTP is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
@@ -283,7 +348,22 @@
 # BR2_PACKAGE_OPENSWAN is not set
 BR2_PACKAGE_PORTMAP=y
 # BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RP_PPPOE is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
 # BR2_PACKAGE_PROFTPD is not set
+# BR2_PACKAGE_QUAGGA is not set
+
+#
+# quagga suite
+#
+# BR2_PACKAGE_QUAGGA_ZEBRA is not set
+# BR2_PACKAGE_QUAGGA_BGPD is not set
+# BR2_PACKAGE_QUAGGA_RIPD is not set
+# BR2_PACKAGE_QUAGGA_RIPNGD is not set
+# BR2_PACKAGE_QUAGGA_OSPFD is not set
+# BR2_PACKAGE_QUAGGA_OSPF6D is not set
+# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
+# BR2_PACKAGE_QUAGGA_ISISD is not set
 BR2_PACKAGE_RSYNC=y
 BR2_PACKAGE_SAMBA=y
 
@@ -316,9 +396,11 @@
 # BR2_PACKAGE_SOCAT is not set
 # BR2_PACKAGE_STUNNEL is not set
 # BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_TFTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
+# BR2_PACKAGE_VPNC is not set
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
 BR2_BLOCKDEV_SUPPORT=y
@@ -326,16 +408,20 @@
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
 # BR2_PACKAGE_IOSTAT is not set
+# BR2_PACKAGE_LIBAIO is not set
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
@@ -409,8 +495,11 @@
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
 BR2_TARGET_ROOTFS_EXT2_COPYTO=""
 BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE=y
+BR2_TARGET_ROOTFS_JFFS2_FLASH=y
+# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH is not set
+BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
 BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x10000
+# BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER is not set
 # BR2_JFFS2_TARGET_SREC is not set
 # BR2_TARGET_ROOTFS_JFFS2_PAD is not set
 # BR2_TARGET_ROOTFS_JFFS2_LE is not set
@@ -426,25 +515,61 @@
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
 # BR2_TARGET_ROOTFS_CPIO is not set
+# BR2_TARGET_ROOTFS_INITRAMFS is not set
 
 #
 # bootloader for target device
 #
 
 #
-# Board Support Options
+# Linux Options
 #
 BR2_PACKAGE_LINUX=y
-BR2_PACKAGE_LINUX_KCONFIG=""
-BR2_PACKAGE_LINUX_FORMAT=""
+# BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG is not set
+BR2_PACKAGE_LINUX_KCONFIG="$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config"
+BR2_PACKAGE_LINUX_FORMAT="uImage"
 
 #
-# Atmel board support
+# Board Support Options
 #
-# BR2_TARGET_ATMEL_ATSTK1000 is not set
-BR2_TARGET_ATMEL_ATNGW100=y
+BR2_TARGET_ATMEL=y
 
 #
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
+# BR2_TARGET_AVR32_ATSTK1002 is not set
+BR2_TARGET_AVR32_ATNGW100=y
+BR2_BOARD_NAME="atngw100"
+
+#
+# Package support
+#
+
+#
+# Secondary locations
+#
+BR2_TARGET_ATMEL_COPYTO="/tftpboot"
+BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_SERVERIP="10.175.196.220"
+BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
+BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
+BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
+BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
+
+#
+# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
+#
+
+#
 # Generic System Support
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
