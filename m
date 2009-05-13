From: root <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 18:43:25 -0300
Subject: [Buildroot] [PATCH] Update atngw100-base_defconfig
In-Reply-To: <1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
Message-ID: <1242251013-25228-3-git-send-email-thiago.correa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 .../Atmel/atngw100-base/atngw100-base_defconfig    |  550 ++++++++++++++------
 1 files changed, 398 insertions(+), 152 deletions(-)

diff --git a/target/device/Atmel/atngw100-base/atngw100-base_defconfig b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
index f908cbc..6e668eb 100644
--- a/target/device/Atmel/atngw100-base/atngw100-base_defconfig
+++ b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Fri Jul  4 12:05:11 2008
+# Tue May 12 20:24:27 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="0.10.0-svn"
+BR2_VERSION="2009.05-rc1"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -16,15 +16,11 @@ BR2_avr32=y
 # BR2_mipsel is not set
 # BR2_nios2 is not set
 # BR2_powerpc is not set
-# BR2_s390 is not set
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
-BR2_at32ap7000=y
-# BR2_at32ap7001 is not set
-# BR2_at32ap7002 is not set
 BR2_ARCH="avr32"
 BR2_ENDIAN="BIG"
 
@@ -42,40 +38,28 @@ BR2_BANNER="ATNGW100-BASE ($(DATE))"
 #
 # Preset Devices
 #
+# BR2_TARGET_AMD is not set
+BR2_BOARD_NAME="atngw100-base"
+BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
 BR2_TARGET_ATMEL=y
 
 #
-# Selection criteria
-#
-BR2_TARGET_ATMEL_NET=y
-BR2_TARGET_ATMEL_LCD=y
-# BR2_TARGET_ATMEL_FPDSP is not set
-# BR2_TARGET_ATMEL_MPB is not set
-
-#
-# Device Selection
-#
-
-#
-# Development Board Selection
-#
-
-#
 # Atmel AVR32 Specific Device Support
 #
 BR2_TARGET_AVR32=y
 BR2_TARGET_AT32AP7000=y
 # BR2_TARGET_AT32AP7001 is not set
 # BR2_TARGET_AT32AP7002 is not set
+# BR2_TARGET_AT32AP7200 is not set
 
 #
 # Development board support
 #
 # BR2_TARGET_AVR32_ATSTK1002 is not set
+# BR2_TARGET_AVR32_ATSTK1005 is not set
 # BR2_TARGET_AVR32_ATNGW100 is not set
 BR2_TARGET_AVR32_ATNGW100_BASE=y
 # BR2_TARGET_AVR32_ATNGW100_EXPANDED is not set
-BR2_BOARD_NAME="atngw100-base"
 
 #
 # Package support
@@ -85,26 +69,21 @@ BR2_BOARD_NAME="atngw100-base"
 # Secondary locations
 #
 BR2_TARGET_ATMEL_COPYTO=""
-BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
-BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 # BR2_TARGET_VALKA is not set
 
 #
-# Generic Architecture support
-#
-
-#
 # Generic System Support
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
 # BR2_TARGET_GENERIC_FIREWALL is not set
-# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
+
+#
+# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
+#
 
 #
 # Build options
 #
-BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
@@ -113,10 +92,13 @@ BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(BASE_DIR)/dl"
+BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
 #
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
@@ -131,14 +113,13 @@ BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX="$(DATE)"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
@@ -151,6 +132,7 @@ BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
+# BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 BR2_UPDATE_CONFIG=y
 
@@ -163,71 +145,69 @@ BR2_TOOLCHAIN_EXTERNAL_SOURCE=y
 BR2_TOOLCHAIN_SOURCE=y
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2 is not set
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
-BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2=y
-# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE is not set
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2 is not set
+BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2=y
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3 is not set
 # BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)"
 BR2_VENDOR_SUFFIX="-avr32"
-BR2_VENDOR_BINUTILS_RELEASE="-2.1.5"
-BR2_VENDOR_GCC_RELEASE="-2.1.5"
+BR2_VENDOR_BINUTILS_RELEASE="-1.0.1"
+BR2_VENDOR_GCC_RELEASE="-1.1.3"
 BR2_VENDOR_UCLIBC_RELEASE="-2.1.5"
 BR2_VENDOR_PATCH_DIR="Atmel/avr32"
 # BR2_EXT_GCC_VERSION_4_1_2 is not set
 # BR2_EXT_GCC_VERSION_4_2_1 is not set
 BR2_EXT_GCC_VERSION_4_2_2=y
 # BR2_EXT_GCC_VERSION_4_2_3 is not set
-BR2_EXT_BINUTILS_VERSION_2_17=y
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
+# BR2_EXT_BINUTILS_VERSION_2_17 is not set
+BR2_EXT_BINUTILS_VERSION_2_18=y
 # BR2_EXT_UCLIBC_VERSION_0_9_28_3 is not set
+# BR2_EXT_UCLIBC_VERSION_0_9_29 is not set
+BR2_EXT_UCLIBC_VERSION_0_9_30=y
+# BR2_EXT_UCLIBC_VERSION_0_9_30_1 is not set
 
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_2_4_25 is not set
-# BR2_KERNEL_HEADERS_2_4_27 is not set
-# BR2_KERNEL_HEADERS_2_4_29 is not set
-# BR2_KERNEL_HEADERS_2_4_31 is not set
-# BR2_KERNEL_HEADERS_2_6_9 is not set
-# BR2_KERNEL_HEADERS_2_6_11 is not set
-# BR2_KERNEL_HEADERS_2_6_12 is not set
-# BR2_KERNEL_HEADERS_2_6_20_4 is not set
-# BR2_KERNEL_HEADERS_2_6_20 is not set
-# BR2_KERNEL_HEADERS_2_6_21_5 is not set
-# BR2_KERNEL_HEADERS_2_6_21 is not set
-# BR2_KERNEL_HEADERS_2_6_22_1 is not set
-# BR2_KERNEL_HEADERS_2_6_22_10 is not set
-# BR2_KERNEL_HEADERS_2_6_22 is not set
 # BR2_KERNEL_HEADERS_2_6_23 is not set
-BR2_KERNEL_HEADERS_2_6_24=y
+# BR2_KERNEL_HEADERS_2_6_24 is not set
 # BR2_KERNEL_HEADERS_2_6_25 is not set
+# BR2_KERNEL_HEADERS_2_6_26 is not set
+# BR2_KERNEL_HEADERS_2_6_27 is not set
+# BR2_KERNEL_HEADERS_2_6_28 is not set
+BR2_KERNEL_HEADERS_2_6_29=y
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.24.7"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 
 #
 # uClibc Options
 #
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
-BR2_UCLIBC_VERSION_0_9_29=y
+# BR2_UCLIBC_VERSION_0_9_29 is not set
+BR2_UCLIBC_VERSION_0_9_30=y
+# BR2_UCLIBC_VERSION_0_9_30_1 is not set
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.30"
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
-# BR2_ENABLE_LOCALE is not set
-# BR2_PTHREADS_NONE is not set
-# BR2_PTHREADS is not set
-BR2_PTHREADS_OLD=y
-# BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
 # BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
 # Binutils Options
 #
-BR2_BINUTILS_VERSION_2_17=y
+# BR2_BINUTILS_VERSION_2_17 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
-# BR2_BINUTILS_VERSION_2_18 is not set
+BR2_BINUTILS_VERSION_2_18=y
 # BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
-BR2_BINUTILS_VERSION="2.17"
+# BR2_BINUTILS_VERSION_2_18_50_0_3 is not set
+# BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
+# BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
+# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
+# BR2_BINUTILS_VERSION_2_19 is not set
+# BR2_BINUTILS_VERSION_2_19_1 is not set
+BR2_BINUTILS_VERSION="2.18"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
@@ -241,14 +221,15 @@ BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_VERSION_4_2_3 is not set
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
+# BR2_GCC_VERSION_4_3_2 is not set
+# BR2_GCC_VERSION_4_3_3 is not set
+# BR2_GCC_VERSION_4_4_X is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2"
 # BR2_TOOLCHAIN_SYSROOT is not set
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
-# BR2_INSTALL_LIBSTDCPP is not set
 # BR2_GCC_SHARED_LIBGCC is not set
 
 #
@@ -266,42 +247,42 @@ BR2_GCC_CROSS_CXX=y
 #
 # Common Toolchain Options
 #
-# BR2_MKLIBS is not set
-# BR2_PACKAGE_SSTRIP_TARGET is not set
-# BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
+# BR2_ENABLE_LOCALE is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
+# BR2_USE_SSP is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+# BR2_INSTALL_LIBSTDCPP is not set
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+# BR2_ENABLE_MULTILIB is not set
 # BR2_CROSS_TOOLCHAIN_TARGET_UTILS is not set
 
 #
 # Package Selection for the target
 #
 BR2_PACKAGE_BUSYBOX=y
-# BR2_BUSYBOX_VERSION_1_2_2_1 is not set
-# BR2_BUSYBOX_VERSION_1_6_1 is not set
-# BR2_BUSYBOX_VERSION_1_7_X is not set
-# BR2_BUSYBOX_VERSION_1_8_X is not set
-# BR2_BUSYBOX_VERSION_1_9_X is not set
-# BR2_BUSYBOX_VERSION_1_10_X is not set
-BR2_BUSYBOX_VERSION_1_11_X=y
+# BR2_BUSYBOX_VERSION_1_12_X is not set
+# BR2_BUSYBOX_VERSION_1_13_X is not set
+BR2_BUSYBOX_VERSION_1_14_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.11.0"
+BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 
 #
 # The minimum needed to build a uClibc development system
 #
-# BR2_PACKAGE_BASH is not set
-# BR2_PACKAGE_BZIP2 is not set
-# BR2_PACKAGE_DIFFUTILS is not set
 # BR2_PACKAGE_FLEX is not set
 # BR2_PACKAGE_GCC_TARGET is not set
 # BR2_PACKAGE_MAKE is not set
@@ -321,10 +302,15 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
 # BR2_PACKAGE_LIBINTL is not set
 # BR2_PACKAGE_LIBGMP is not set
+# BR2_PACKAGE_GPERF is not set
 # BR2_PACKAGE_LIBMPFR is not set
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
-# BR2_PACKAGE_OPROFILE is not set
+
+#
+# oprofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_PKG_CONFIG is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
@@ -337,81 +323,91 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_BSDIFF is not set
 # BR2_PACKAGE_CUPS is not set
 # BR2_PACKAGE_CUSTOMIZE is not set
-# BR2_PACKAGE_DASH is not set
 # BR2_PACKAGE_FILE is not set
 # BR2_PACKAGE_GAMIN is not set
-# BR2_PACKAGE_ICU is not set
-# BR2_PACKAGE_IPKG is not set
+
+#
+# icu requires a toolchain with C++ support and WCHAR enabled
+#
 # BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
-# BR2_PACKAGE_LIBFLOAT is not set
 # BR2_PACKAGE_LIBGCRYPT is not set
 # BR2_PACKAGE_LIBGPG_ERROR is not set
 # BR2_PACKAGE_LIBICONV is not set
+# BR2_PACKAGE_LIBIDN is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBOIL is not set
 # BR2_PACKAGE_LIBSYSFS is not set
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
+# BR2_PACKAGE_LOGROTATE is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
 # BR2_PACKAGE_LTRACE is not set
-# BR2_PACKAGE_LTT is not set
+# BR2_PACKAGE_MEMSTAT is not set
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_POPT is not set
-# BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_SCREEN is not set
-# BR2_PACKAGE_SQLITE is not set
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_SUDO is not set
-BR2_DATABASE_SUPPORT=y
-# BR2_PACKAGE_MYSQL_CLIENT is not set
-BR2_NETWORK_SUPPORT=y
 
 #
-# Networking applications
+# Database
 #
 
 #
-# argus		- disabled (requires libpcap)
+# Mysql client requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_SQLITE is not set
+
+#
+# Networking
 #
-BR2_PACKAGE_AVAHI=y
-BR2_PACKAGE_AVAHI_AUTOIPD=y
 
 #
-# mDNS/DNS-SD daemon	- disabled (requires expat)
+# Networking applications
 #
+# BR2_PACKAGE_ARGUS is not set
+BR2_PACKAGE_AVAHI=y
+BR2_PACKAGE_AVAHI_AUTOIPD=y
+# BR2_PACKAGE_AVAHI_DAEMON is not set
 # BR2_PACKAGE_AXEL is not set
-# BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_CURL is not set
-# BR2_PACKAGE_LIBCURL is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
 # BR2_PACKAGE_HASERL is not set
 # BR2_PACKAGE_IFPLUGD is not set
-# BR2_PACKAGE_IRDA_UTILS is not set
-# BR2_PACKAGE_IPERF is not set
-# BR2_PACKAGE_IPROUTE2 is not set
 
 #
-# ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )
+# iperf requires a toolchain with C++ support enabled
 #
+# BR2_PACKAGE_IPROUTE2 is not set
+# BR2_PACKAGE_IPSEC_TOOLS is not set
 # BR2_PACKAGE_IPTABLES is not set
 # BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
-# BR2_PACKAGE_LIBCGICC is not set
+
+#
+# libcgicc requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBSOUP is not set
+# BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
 # BR2_PACKAGE_MDNSRESPONDER is not set
-# BR2_PACKAGE_MICROCOM is not set
 # BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
@@ -429,13 +425,12 @@ BR2_PACKAGE_AVAHI_AUTOIPD=y
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
 # BR2_PACKAGE_OPENVPN is not set
-# BR2_PACKAGE_OPENSWAN is not set
 # BR2_PACKAGE_PORTMAP is not set
 # BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RADVD is not set
 # BR2_PACKAGE_RP_PPPOE is not set
 # BR2_PACKAGE_PPTP_LINUX is not set
 # BR2_PACKAGE_PROFTPD is not set
-# BR2_PACKAGE_QUAGGA is not set
 
 #
 # quagga suite
@@ -458,32 +453,277 @@ BR2_PACKAGE_AVAHI_AUTOIPD=y
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
 # BR2_PACKAGE_UDPCAST is not set
-
-#
-# vpnc		- disabled (requires libgcrypt and libgpg_error)
-#
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WEBIF is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
-# BR2_BLOCKDEV_SUPPORT is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
+
+#
+# Hardware handling / blockdevices and filesystem maintenance
+#
+
+#
+# dbus not available (need expat or libxml2)
+#
+
+#
+# dbus-glib needs dbus to be compiled with expat support
+#
+# BR2_PACKAGE_DEVMEM2 is not set
+# BR2_PACKAGE_DM is not set
+# BR2_PACKAGE_DMRAID is not set
+# BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+# BR2_PACKAGE_LIBFUSE is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
+# BR2_PACKAGE_HAL is not set
+# BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
+# BR2_PACKAGE_IOSTAT is not set
+# BR2_PACKAGE_LIBAIO is not set
+# BR2_PACKAGE_LIBRAW1394 is not set
+# BR2_PACKAGE_LIBUSB is not set
+# BR2_PACKAGE_LM_SENSORS is not set
+# BR2_PACKAGE_LVM2 is not set
+# BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MEMTESTER is not set
+# BR2_PACKAGE_MKDOSFS is not set
 BR2_PACKAGE_MTD=y
-# BR2_AUDIO_SUPPORT is not set
-# BR2_GRAPHIC_SUPPORT is not set
-# BR2_COMPRESSOR_SUPPORT is not set
-# BR2_SCRIPTING_SUPPORT is not set
-BR2_XML_SUPPORT=y
+BR2_PACKAGE_MTD_UTILS=y
+# BR2_PACKAGE_MTD_20061007 is not set
+# BR2_PACKAGE_MTD_20050122 is not set
+# BR2_PACKAGE_MTD_UTILS_GIT is not set
+
+#
+# MTD tools selection
+#
+# BR2_PACKAGE_MTD_DOCFDISK is not set
+# BR2_PACKAGE_MTD_DOC_LOADBIOS is not set
+BR2_PACKAGE_MTD_FLASHCP=y
+BR2_PACKAGE_MTD_FLASH_ERASE=y
+BR2_PACKAGE_MTD_FLASH_ERASEALL=y
+BR2_PACKAGE_MTD_FLASH_INFO=y
+BR2_PACKAGE_MTD_FLASH_LOCK=y
+BR2_PACKAGE_MTD_FLASH_UNLOCK=y
+BR2_PACKAGE_MTD_FTL_CHECK=y
+BR2_PACKAGE_MTD_FTL_FORMAT=y
+BR2_PACKAGE_MTD_JFFS2DUMP=y
+BR2_PACKAGE_MTD_MKFSJFFS2=y
+# BR2_PACKAGE_MTD_MKFSJFFS is not set
+BR2_PACKAGE_MTD_MTD_DEBUG=y
+BR2_PACKAGE_MTD_NANDDUMP=y
+BR2_PACKAGE_MTD_NANDWRITE=y
+# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
+# BR2_PACKAGE_MTD_NFTLDUMP is not set
+BR2_PACKAGE_MTD_SUMTOOL=y
+# BR2_PACKAGE_NTFS_3G is not set
+# BR2_PACKAGE_PCIUTILS is not set
+# BR2_PACKAGE_PCMCIA is not set
+# BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SMARTMONTOOLS is not set
+# BR2_PACKAGE_USBMOUNT is not set
+# BR2_PACKAGE_USBUTILS is not set
+# BR2_PACKAGE_WIPE is not set
+# BR2_PACKAGE_XFSPROGS is not set
+
+#
+# Audio and video libraries and applications
+#
+# BR2_PACKAGE_ALSA_LIB is not set
+
+#
+# asterisk	- disabled (required openssl and mpg123)
+#
+# BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
+# BR2_PACKAGE_GSTREAMER is not set
+# BR2_PACKAGE_LIBID3TAG is not set
+# BR2_PACKAGE_LIBMAD is not set
+# BR2_PACKAGE_LIBMPD is not set
+# BR2_PACKAGE_LIBOGG is not set
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBTHEORA is not set
+# BR2_PACKAGE_LIBVORBIS is not set
+# BR2_PACKAGE_MADPLAY is not set
+# BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_MPLAYER is not set
+# BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_FESTIVAL is not set
+
+#
+# taglib requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_VLC is not set
+
+#
+# Graphic libraries and applications (graphic/text)
+#
+
+#
+# text rendering libraries
+#
+# BR2_PACKAGE_NCURSES is not set
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_SLANG is not set
+
+#
+# text rendering applications
+#
+# BR2_PACKAGE_DIALOG is not set
+
+#
+# graphic libraries
+#
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+# BR2_PACKAGE_LINUX_FUSION is not set
+# BR2_PACKAGE_PIXMAN is not set
+# BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_TIFF is not set
+
+#
+# busybox graphic applications
+#
+
+#
+# --> May be broken in busybox
+#
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_FBSET is not set
+
+#
+# other GUIs
+#
+
+#
+# qtopia4 requires a toolchain with C++ support enabled
+#
+BR2_PACKAGE_XSERVER_none=y
+# BR2_PACKAGE_XSERVER_xorg is not set
+# BR2_PACKAGE_XSERVER_tinyx is not set
+
+#
+# xorg requires a toolchain with LOCALE, LARGEFILE and WCHAR support
+#
+
+#
+# X libraries and helper libraries
+#
+# BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_PANGO is not set
+# BR2_PACKAGE_LIBDRM is not set
+# BR2_PACKAGE_LIBERATION is not set
+# BR2_PACKAGE_LIBGLIB12 is not set
+# BR2_PACKAGE_LIBGLIB2 is not set
+# BR2_PACKAGE_OPENMOTIF is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_TSLIB is not set
+
+#
+# webkit requires a toolchain with C++ support and WCHAR enabled
+#
+
+#
+# X Window managers
+#
+# BR2_PACKAGE_MATCHBOX is not set
+
+#
+# X applications
+#
+# BR2_PACKAGE_ALSAMIXERGUI is not set
+
+#
+# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
+#
+# BR2_PACKAGE_GQVIEW is not set
+# BR2_PACKAGE_GOB2 is not set
+# BR2_PACKAGE_LEAFPAD is not set
+
+#
+# midori		- disabled (requires Xorg(7))
+#
+# BR2_PACKAGE_PCMANFM is not set
+# BR2_PACKAGE_SYLPHEED is not set
+# BR2_PACKAGE_TORSMO is not set
+# BR2_PACKAGE_X11VNC is not set
+# BR2_PACKAGE_XPDF is not set
+# BR2_PACKAGE_XSTROKE is not set
+# BR2_PACKAGE_XVKBD is not set
+
+#
+# Compressors / decompressors
+#
+BR2_PACKAGE_LZO=y
+# BR2_PACKAGE_LZOP is not set
+
+#
+# lzma requires a toolchain with C++ support
+#
+# BR2_PACKAGE_LZMA_HOST is not set
+BR2_PACKAGE_ZLIB=y
+# BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+# BR2_PACKAGE_PORTAGE is not set
+
+#
+# Interpreter languages / Scripting
+#
+# BR2_PACKAGE_LUA is not set
+# BR2_PACKAGE_MICROPERL is not set
+# BR2_PACKAGE_PYTHON is not set
+# BR2_PACKAGE_RUBY is not set
+# BR2_PACKAGE_TCL is not set
+# BR2_PACKAGE_PHP is not set
+
+#
+# XML handling
+#
 # BR2_PACKAGE_EXPAT is not set
 # BR2_PACKAGE_EZXML is not set
 # BR2_PACKAGE_LIBXML2 is not set
 # BR2_PACKAGE_LIBXSLT is not set
-# BR2_PACKAGE_XERCES is not set
-BR2_JAVA_SUPPORT=y
+
+#
+# xerces-c++ requires a toolchain with C++ support enabled
+#
+
+#
+# Java
+#
 # BR2_PACKAGE_CLASSPATH is not set
-# BR2_GAMES is not set
+
+#
+# Games
+#
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_MAGICCUBE4D is not set
+# BR2_PACKAGE_PRBOOM is not set
+# BR2_PACKAGE_RUBIX is not set
+# BR2_PACKAGE_VICE is not set
+# BR2_PACKAGE_XBOARD is not set
 
 #
 # Target filesystem options
 #
+BR2_ROOTFS_PREFIX="rootfs"
+BR2_ROOTFS_SUFFIX="$(DATE)"
 
 #
 # filesystem for target device
@@ -494,6 +734,7 @@ BR2_JAVA_SUPPORT=y
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
+# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K is not set
 BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
 # BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
 # BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
@@ -505,7 +746,6 @@ BR2_TARGET_ROOTFS_JFFS2_PAD=y
 BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x0
 # BR2_TARGET_ROOTFS_JFFS2_LE is not set
 BR2_TARGET_ROOTFS_JFFS2_BE=y
-# BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
 BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
 BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
@@ -525,7 +765,21 @@ BR2_TARGET_ROOTFS_TAR_COPYTO=""
 #
 # bootloader for target device
 #
-# BR2_TARGET_UBOOT is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="atngw100"
+# BR2_TARGET_UBOOT_2009_03 is not set
+# BR2_TARGET_UBOOT_2009_01 is not set
+BR2_TARGET_UBOOT_2008_10=y
+# BR2_TARGET_UBOOT_1_3_4 is not set
+# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
+BR2_UBOOT_VERSION="2008.10"
+BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
+# BR2_TARGET_U_BOOT_ARCH_PATCH is not set
+BR2_TARGET_UBOOT_CUSTOM_PATCH=""
+# BR2_TARGET_UBOOT_SILENT is not set
+# BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
+# BR2_TARGET_UBOOT_TOOL_ENV is not set
+# BR2_TARGET_UBOOT_DEFAULT_ENV is not set
 
 #
 # Kernel
@@ -537,46 +791,41 @@ BR2_KERNEL_LINUX_ADVANCED=y
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.22.5.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.25.9"
-BR2_KERNEL_NEXT_VERSION="2.6.25"
-BR2_KERNEL_THIS_VERSION="2.6.24"
-BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
+BR2_KERNEL_CURRENT_VERSION="2.6.29.2"
+BR2_KERNEL_LATEST_2_6_29="2"
+BR2_KERNEL_LATEST_2_6_28="7"
+BR2_KERNEL_LATEST_2_6_27="13"
+BR2_KERNEL_LATEST_2_6_26="8"
+BR2_KERNEL_LATEST_2_6_25="19"
+BR2_KERNEL_LATEST_2_6_24="7"
+BR2_KERNEL_LATEST_2_6_23="17"
+BR2_KERNEL_LATEST_2_6_22="19"
+BR2_KERNEL_LATEST_2_6_21="7"
+BR2_KERNEL_LATEST_2_6_20="21"
+BR2_KERNEL_THIS_VERSION="2.6.29"
+BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
+BR2_LINUX_2_6_29=y
+# BR2_LINUX_2_6_28 is not set
+# BR2_LINUX_2_6_27 is not set
+# BR2_LINUX_2_6_26 is not set
 # BR2_LINUX_2_6_25 is not set
-BR2_LINUX_2_6_24=y
+# BR2_LINUX_2_6_24 is not set
 # BR2_LINUX_2_6_23 is not set
-# BR2_LINUX_2_6_22_10 is not set
-# BR2_LINUX_2_6_22_1 is not set
 # BR2_LINUX_2_6_22 is not set
-# BR2_LINUX_2_6_21_7 is not set
-# BR2_LINUX_2_6_21_5 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_26 is not set
-# BR2_LINUX_2_6_27 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
 # Patches
 #
 # BR2_KERNEL_ADD_KERNEL_ORG_PATCH is not set
-# BR2_KERNEL_ADD_PATCH is not set
-BR2_KERNEL_ARCH_PATCH_ENABLED=y
-BR2_ARCH_AVR32_2_6_24=y
-# BR2_ARCH_AVR32_2_6_23 is not set
-# BR2_ARCH_AVR32_2_6_22_10 is not set
-# BR2_ARCH_AVR32_2_6_22_1 is not set
-# BR2_ARCH_AVR32_2_6_21_5 is not set
-# BR2_ARCH_AVR32_2_6_20_4 is not set
-# BR2_LINUX_AVR32_ISI_PATCH is not set
-# BR2_LINUX_AVR32_AC97_PATCH is not set
-# BR2_LINUX_AVR32_PSIF_PATCH is not set
+# BR2_KERNEL_ARCH_PATCH_ENABLED is not set
 BR2_LINUX_BSP_PATCH=""
-# BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
-# BR2_KERNEL_LATEST is not set
 BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
 BR2_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
 
@@ -586,9 +835,6 @@ BR2_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
-BR2_MAKE_XCONFIG=y
-# BR2_MAKE_MENUCONFIG is not set
-BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set
-- 
1.6.0.6
