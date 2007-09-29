From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Sep 2007 13:47:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20070929204756.1A5A3300EA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-29 13:47:56 -0700 (Sat, 29 Sep 2007)
New Revision: 20128

Log:
Update nwg100 defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-09-29 20:47:18 UTC (rev 20127)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-09-29 20:47:56 UTC (rev 20128)
@@ -1,15 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Wed Sep  5 08:47:23 2007
+# Sat Sep 29 22:36:38 2007
 #
 BR2_HAVE_DOT_CONFIG=y
-
-#
-# Project Options
-#
-BR2_PROJECT="atngw100"
-BR2_HOSTNAME="ATNGW100"
-BR2_BANNER="Welcome to the Erik's uClibc development environment."
+BR2_VERSION="0.10.0-svn"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -26,6 +20,7 @@
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
+# BR2_sparc64 is not set
 # BR2_x86_64 is not set
 BR2_at32ap7000=y
 # BR2_at32ap7001 is not set
@@ -34,10 +29,70 @@
 BR2_ENDIAN="BIG"
 
 #
+# Target options
+#
+
+#
+# Project Options
+#
+BR2_PROJECT="atngw100"
+BR2_HOSTNAME="ATNGW100"
+BR2_BANNER="Welcome to the Erik's uClibc development environment."
+
+#
+# Preset Devices
+#
+BR2_PACKAGE_LINUX=y
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
-BR2_SVN="svn co"
+BR2_SVN_CO="svn co"
+BR2_SVN_UP="svn up"
 BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
@@ -59,9 +114,9 @@
 BR2_TOPDIR_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
-BR2_JLEVEL=2
+BR2_JLEVEL=1
 # BR2_PREFER_IMA is not set
-# BR2_DEPRECATED is not set
+BR2_DEPRECATED=y
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
 # BR2_STRIP_none is not set
@@ -71,12 +126,14 @@
 BR2_UPDATE_CONFIG=y
 
 #
-# Toolchain type
+# Toolchain
 #
-BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_BUILDROOT is not set
 # BR2_TOOLCHAIN_EXTERNAL is not set
-# BR2_TOOLCHAIN_NORMAL is not set
+BR2_TOOLCHAIN_EXTERNAL_SOURCE=y
+BR2_TOOLCHAIN_SOURCE=y
 BR2_TOOLCHAIN_ATMEL_AVR32=y
+# BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)/Source"
 BR2_VENDOR_SUFFIX="-avr32"
 BR2_VENDOR_BINUTILS_RELEASE="-2.0"
@@ -86,10 +143,6 @@
 BR2_VENDOR_PATCH_DIR="target/device/Atmel/toolchain/avr32"
 
 #
-# Toolchain Options
-#
-
-#
 # Kernel Header Options
 #
 # BR2_KERNEL_HEADERS_2_4_25 is not set
@@ -99,85 +152,61 @@
 # BR2_KERNEL_HEADERS_2_6_9 is not set
 # BR2_KERNEL_HEADERS_2_6_11 is not set
 # BR2_KERNEL_HEADERS_2_6_12 is not set
-# BR2_KERNEL_HEADERS_2_6_19_2 is not set
+# BR2_KERNEL_HEADERS_2_6_20_4 is not set
 # BR2_KERNEL_HEADERS_2_6_20 is not set
+# BR2_KERNEL_HEADERS_2_6_21_5 is not set
 # BR2_KERNEL_HEADERS_2_6_21 is not set
-BR2_KERNEL_HEADERS_2_6_22=y
+BR2_KERNEL_HEADERS_2_6_22_1=y
+# BR2_KERNEL_HEADERS_2_6_22 is not set
+# BR2_KERNEL_HEADERS_SNAP is not set
 # BR2_KERNEL_HEADERS_IPMI is not set
 # BR2_KERNEL_HEADERS_LZMA is not set
-# BR2_KERNEL_HEADERS_PATCH_DIR is not set
+# BR2_KERNEL_HEADERS_RT is not set
+BR2_KERNEL_HEADERS_PATCH_DIR=y
 BR2_DEFAULT_KERNEL_HEADERS="2.6.22.1"
 
 #
 # uClibc Options
 #
-# BR2_UCLIBC_VERSION_0_9_28 is not set
 BR2_UCLIBC_VERSION_0_9_28_3=y
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.28.config"
+BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_ENABLE_LOCALE is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 BR2_PTHREAD_DEBUG=y
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+BR2_UCLIBC_PROGRAM_INVOCATION=y
 
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
+# BR2_BINUTILS_VERSION_2_18 is not set
+# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
 BR2_BINUTILS_VERSION="2.17"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
-# Gcc Options
+# GCC Options
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
+BR2_GCC_SUPPORTS_SYSROOT=y
+# BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.1.2"
+BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-# BR2_GCC_CROSS_CXX is not set
+BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_GCC_SHARED_LIBGCC=y
+# BR2_GCC_SHARED_LIBGCC is not set
 
 #
 # Ccache Options
@@ -188,15 +217,8 @@
 # Gdb Options
 #
 # BR2_PACKAGE_GDB is not set
-BR2_PACKAGE_GDB_SERVER=y
-BR2_PACKAGE_GDB_HOST=y
-# BR2_GDB_VERSION_6_2_1 is not set
-# BR2_GDB_VERSION_6_3 is not set
-BR2_GDB_VERSION_6_4=y
-# BR2_GDB_VERSION_6_5 is not set
-# BR2_GDB_VERSION_6_6 is not set
-# BR2_GDB_VERSION_SNAPSHOT is not set
-BR2_GDB_VERSION="6.4"
+# BR2_PACKAGE_GDB_SERVER is not set
+# BR2_PACKAGE_GDB_HOST is not set
 
 #
 # elf2flt
@@ -220,38 +242,35 @@
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
-BR2_BUSYBOX_VERSION_1_6_1=y
+# BR2_BUSYBOX_VERSION_1_6_1 is not set
 # BR2_BUSYBOX_VERSION_1_7_0 is not set
+BR2_BUSYBOX_VERSION_1_7_1=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.6.1"
+BR2_BUSYBOX_VERSION="1.7.1"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
-BR2_PACKAGE_BUSYBOX_CONFIG=""
-BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Atmel/uClibc.config.avr32"
+# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
 # The minimum needed to build a uClibc development system
 #
-BR2_PACKAGE_BASH=y
-BR2_PACKAGE_BZIP2=y
+# BR2_PACKAGE_BASH is not set
+# BR2_PACKAGE_BZIP2 is not set
+# BR2_PACKAGE_COREUTILS is not set
 # BR2_PACKAGE_DIFFUTILS is not set
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_FINDUTILS is not set
 # BR2_PACKAGE_FLEX is not set
+# BR2_PACKAGE_GAWK is not set
 # BR2_PACKAGE_GCC_TARGET is not set
+# BR2_PACKAGE_GREP is not set
 # BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_PATCH is not set
+# BR2_PACKAGE_SED is not set
+# BR2_PACKAGE_TAR is not set
 
 #
 # Other development stuff
@@ -284,8 +303,9 @@
 # BR2_PACKAGE_BSDIFF is not set
 # BR2_PACKAGE_CUSTOMIZE is not set
 # BR2_PACKAGE_DASH is not set
-BR2_PACKAGE_FILE=y
+# BR2_PACKAGE_FILE is not set
 # BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LESS is not set
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
@@ -299,54 +319,70 @@
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
 # BR2_PACKAGE_LTT is not set
-# BR2_PACKAGE_MICROCOM is not set
+# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
+# BR2_PACKAGE_MODUTILS is not set
+# BR2_PACKAGE_NANO is not set
 # BR2_PACKAGE_PORTAGE is not set
+# BR2_PACKAGE_PROCPS is not set
+# BR2_PACKAGE_PSMISC is not set
 # BR2_PACKAGE_SQLITE is not set
-BR2_PACKAGE_STRACE=y
+# BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_SYSKLOGD is not set
+# BR2_PACKAGE_SYSVINIT is not set
+# BR2_PACKAGE_TINYLOGIN is not set
+# BR2_PACKAGE_UEMACS is not set
+# BR2_PACKAGE_UTIL-LINUX is not set
+# BR2_PACKAGE_WHICH is not set
 BR2_NETWORK_SUPPORT=y
+
+#
+# Networking applications
+#
 # BR2_PACKAGE_ARGUS is not set
-BR2_PACKAGE_AVAHI=y
-BR2_PACKAGE_AVAHI_AUTOIPD=y
-# BR2_PACKAGE_AVAHI_DAEMON is not set
+# BR2_PACKAGE_AVAHI is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
-BR2_PACKAGE_BRIDGE=y
+# BR2_PACKAGE_BRIDGE is not set
 # BR2_PACKAGE_CURL is not set
 # BR2_PACKAGE_LIBCURL is not set
-BR2_PACKAGE_DNSMASQ=y
-BR2_PACKAGE_DROPBEAR=y
+# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DNSMASQ is not set
+# BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
-BR2_PACKAGE_HASERL=y
+# BR2_PACKAGE_HASERL is not set
+# BR2_PACKAGE_HOSTAP is not set
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
 # BR2_PACKAGE_IPSEC_TOOLS is not set
-BR2_PACKAGE_IPTABLES=y
+# BR2_PACKAGE_IPTABLES is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LINKS is not set
-BR2_PACKAGE_LRZSZ=y
+# BR2_PACKAGE_LRZSZ is not set
 # BR2_PACKAGE_MDNSRESPONDER is not set
+# BR2_PACKAGE_MICROCOM is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
-BR2_PACKAGE_NBD=y
+# BR2_PACKAGE_NBD is not set
 # BR2_PACKAGE_NCFTP is not set
+# BR2_PACKAGE_NETCAT is not set
 # BR2_PACKAGE_NETKITBASE is not set
 # BR2_PACKAGE_NETKITTELNET is not set
 # BR2_PACKAGE_NETPLUG is not set
 # BR2_PACKAGE_NETSNMP is not set
 # BR2_PACKAGE_NFS_UTILS is not set
-BR2_PACKAGE_NTP=y
-# BR2_PACKAGE_NTP_SNTP is not set
+# BR2_PACKAGE_NTP is not set
+# BR2_PACKAGE_OLSR is not set
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
 # BR2_PACKAGE_OPENVPN is not set
 # BR2_PACKAGE_OPENSWAN is not set
-BR2_PACKAGE_PORTMAP=y
+# BR2_PACKAGE_PORTMAP is not set
 # BR2_PACKAGE_PPPD is not set
 # BR2_PACKAGE_RP_PPPOE is not set
 # BR2_PACKAGE_PPTP_LINUX is not set
@@ -364,44 +400,21 @@
 # BR2_PACKAGE_QUAGGA_OSPF6D is not set
 # BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
 # BR2_PACKAGE_QUAGGA_ISISD is not set
-BR2_PACKAGE_RSYNC=y
-BR2_PACKAGE_SAMBA=y
-
-#
-# Samba tools selection
-#
-# BR2_PACKAGE_SAMBA_CIFS is not set
-# BR2_PACKAGE_SAMBA_EVENTLOGADM is not set
-# BR2_PACKAGE_SAMBA_NET is not set
-BR2_PACKAGE_SAMBA_NMBD=y
-BR2_PACKAGE_SAMBA_NMBLOOKUP=y
-# BR2_PACKAGE_SAMBA_NTLM_AUTH is not set
-# BR2_PACKAGE_SAMBA_PDBEDIT is not set
-# BR2_PACKAGE_SAMBA_PROFILES is not set
-# BR2_PACKAGE_SAMBA_RPCCLIENT is not set
-# BR2_PACKAGE_SAMBA_SMBCACLS is not set
-BR2_PACKAGE_SAMBA_SMBCLIENT=y
-# BR2_PACKAGE_SAMBA_SMBCONTROL is not set
-# BR2_PACKAGE_SAMBA_SMBCQUOTAS is not set
-# BR2_PACKAGE_SAMBA_SMBGET is not set
-BR2_PACKAGE_SAMBA_SMBPASSWD=y
-# BR2_PACKAGE_SAMBA_SMBSPOOL is not set
-BR2_PACKAGE_SAMBA_SMBSTATUS=y
-# BR2_PACKAGE_SAMBA_SMBTREE is not set
-BR2_PACKAGE_SAMBA_SWAT=y
-# BR2_PACKAGE_SAMBA_TDB is not set
-# BR2_PACKAGE_SAMBA_TESTPARM is not set
-BR2_PACKAGE_SAMBA_WINBINDD=y
-# BR2_PACKAGE_SAMBA_WBINFO is not set
+# BR2_PACKAGE_RSYNC is not set
+# BR2_PACKAGE_SAMBA is not set
 # BR2_PACKAGE_SOCAT is not set
 # BR2_PACKAGE_STUNNEL is not set
 # BR2_PACKAGE_TCPDUMP is not set
 # BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_TFTPD is not set
+# BR2_PACKAGE_LIGHTTPD is not set
+# BR2_PACKAGE_THTTPD is not set
+# BR2_PACKAGE_TINYHTTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
 # BR2_PACKAGE_VPNC is not set
 # BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WGET is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
 BR2_BLOCKDEV_SUPPORT=y
 # BR2_PACKAGE_DBUS is not set
@@ -410,6 +423,8 @@
 # BR2_PACKAGE_E2FSPROGS is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
+# BR2_PACKAGE_HDPARM is not set
+# BR2_PACKAGE_HOTPLUG is not set
 # BR2_PACKAGE_HWDATA is not set
 # BR2_PACKAGE_IOSTAT is not set
 # BR2_PACKAGE_LIBAIO is not set
@@ -421,14 +436,10 @@
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
@@ -458,16 +469,25 @@
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
 # BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SFDISK is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
+BR2_PACKAGE_UDEV=y
+BR2_PACKAGE_UDEV_UTILS=y
+
+#
+# Extra udev tools
+#
+# BR2_PACKAGE_UDEV_VOLUME_ID is not set
+# BR2_PACKAGE_UDEV_SCSI_ID is not set
 # BR2_PACKAGE_USBMOUNT is not set
 # BR2_PACKAGE_USBUTILS is not set
 # BR2_PACKAGE_WIPE is not set
 # BR2_PACKAGE_XFSPROGS is not set
 # BR2_AUDIO_SUPPORT is not set
 # BR2_GRAPHIC_SUPPORT is not set
-BR2_PACKAGE_NCURSES=y
 BR2_COMPRESSOR_SUPPORT=y
-# BR2_PACKAGE_LZO is not set
+# BR2_PACKAGE_GZIP is not set
+BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
@@ -475,7 +495,7 @@
 # BR2_SCRIPTING_SUPPORT is not set
 
 #
-# Target Options
+# Target filesystem options
 #
 
 #
@@ -522,56 +542,52 @@
 #
 
 #
-# Linux Options
+# Kernel
 #
-BR2_PACKAGE_LINUX=y
-# BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG is not set
+# BR2_KERNEL_none is not set
+BR2_KERNEL_LINUX=y
+# BR2_KERNEL_HURD is not set
+BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
+# BR2_LINUX_2_6_SNAP is not set
+# BR2_LINUX_2_6_MM is not set
+# BR2_LINUX_2_6_STABLE is not set
+BR2_LINUX_2_6_22_1=y
+# BR2_LINUX_2_6_22 is not set
+# BR2_LINUX_2_6_21_6 is not set
+# BR2_LINUX_2_6_21_1 is not set
+# BR2_LINUX_2_6_21 is not set
+# BR2_LINUX_2_6_20_4 is not set
+# BR2_LINUX_2_6_20 is not set
+# BR2_LINUX_2_6_19_2 is not set
+# BR2_LINUX_2_6_19 is not set
+# BR2_LINUX_2_6_18 is not set
+# BR2_LINUX_2_6_17 is not set
+# BR2_LINUX_2_6_16 is not set
+# BR2_LINUX_2_6_15 is not set
+# BR2_LINUX_2_6_23 is not set
+# BR2_LINUX_CUSTOM is not set
 
 #
-# Board Support Options
+# Patches
 #
-BR2_TARGET_ATMEL=y
+BR2_LINUX_BSP_PATCH=""
+BR2_DOWNLOAD_LINUX26_VERSION="2.6.22.1"
+BR2_LINUX26_VERSION="2.6.22.1"
+BR2_LINUX26_RC_PATCH=""
+BR2_PACKAGE_LINUX_USE_KCONFIG=y
+# BR2_LINUX26_DEFCONFIG is not set
+# BR2_LINUX_CUSTOMIZE is not set
+# BR2_LINUX_BIN_BZIMAGE is not set
+BR2_LINUX_BIN_UIMAGE=y
+# BR2_LINUX_BIN_VMLINUX is not set
+# BR2_LINUX_BIN_ZIMAGE is not set
+# BR2_LINUX_BIN_CUSTOM is not set
 
 #
-# Atmel AVR32 Specific Device Support
+# Destinations for linux kernel binaries
 #
-BR2_TARGET_AVR32=y
-BR2_TARGET_AT32AP7000=y
-# BR2_TARGET_AT32AP7001 is not set
-# BR2_TARGET_AT32AP7002 is not set
-
-#
-# Development Board support
-#
-# BR2_TARGET_AVR32_ATSTK1002 is not set
-BR2_TARGET_AVR32_ATNGW100=y
-BR2_BOARD_NAME="atngw100"
-
-#
-# Package support
-#
-
-#
-# Secondary locations
-#
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
-BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_SERVERIP="10.175.196.220"
-BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
-BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
-BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
-BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
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
+# BR2_LINUX_IN_ROOTFS is not set
+BR2_LINUX_COPY=y
+BR2_LINUX_COPYTO="/tftpboot"
