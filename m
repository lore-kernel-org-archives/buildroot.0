From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 16 Jan 2009 22:39:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel/atngw1 etc...
Message-ID: <20090116223907.4517B77584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-16 22:39:05 +0000 (Fri, 16 Jan 2009)
New Revision: 24891

Log:
Update broken AVR32 toolchain, and update configs for this, deprecate all but latest AVR32 toolchain

Added:
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-16 22:06:49 UTC (rev 24890)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-16 22:39:05 UTC (rev 24891)
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Sat Jan 10 02:15:06 2009
+# Fri Jan 16 23:00:00 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="0.10.0-svn"
+BR2_VERSION="2009.02-svn"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -16,7 +16,6 @@
 # BR2_mipsel is not set
 # BR2_nios2 is not set
 # BR2_powerpc is not set
-# BR2_s390 is not set
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
@@ -85,7 +84,6 @@
 #
 # Build options
 #
-BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
@@ -98,6 +96,8 @@
 #
 # Mirrors and Download locations
 #
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
@@ -165,7 +165,7 @@
 # BR2_EXT_BINUTILS_VERSION_2_17 is not set
 BR2_EXT_BINUTILS_VERSION_2_18=y
 # BR2_EXT_UCLIBC_VERSION_0_9_28_3 is not set
-BR2_EXT_UCLIBC_VERSION_0_9_29=y
+# BR2_EXT_UCLIBC_VERSION_0_9_29 is not set
 BR2_EXT_UCLIBC_VERSION_0_9_30=y
 
 #
@@ -186,7 +186,7 @@
 BR2_KERNEL_HEADERS_2_6_27=y
 # BR2_KERNEL_HEADERS_2_6_28 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.27.10"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.27.11"
 
 #
 # uClibc Options
@@ -352,6 +352,7 @@
 # BR2_PACKAGE_LIBGCRYPT is not set
 # BR2_PACKAGE_LIBGPG_ERROR is not set
 BR2_PACKAGE_LIBICONV=y
+# BR2_PACKAGE_LIBIDN is not set
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBOIL is not set
 # BR2_PACKAGE_LIBSYSFS is not set
@@ -398,7 +399,6 @@
 BR2_PACKAGE_HASERL_VERSION_0_9_X=y
 BR2_PACKAGE_HASERL_VERSION="0.9.25"
 # BR2_PACKAGE_IFPLUGD is not set
-# BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
 
@@ -411,6 +411,7 @@
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
 # BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
@@ -602,6 +603,7 @@
 # BR2_PACKAGE_LIBART is not set
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
+BR2_PACKAGE_LINUX_FUSION=y
 # BR2_PACKAGE_PIXMAN is not set
 # BR2_PACKAGE_SDL is not set
 # BR2_PACKAGE_TIFF is not set
@@ -728,6 +730,7 @@
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
+# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K is not set
 BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
 # BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
 # BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set

Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-01-16 22:06:49 UTC (rev 24890)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-01-16 22:39:05 UTC (rev 24891)
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Sat Jul  5 10:08:08 2008
+# Fri Jan 16 23:02:32 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="0.10.0-svn"
+BR2_VERSION="2009.02-svn"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -16,15 +16,11 @@
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
 
@@ -45,33 +41,19 @@
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
 BR2_TARGET_AVR32_ATSTK1002=y
+# BR2_TARGET_AVR32_ATSTK1005 is not set
 # BR2_TARGET_AVR32_ATNGW100 is not set
 # BR2_TARGET_AVR32_ATNGW100_BASE is not set
 # BR2_TARGET_AVR32_ATNGW100_EXPANDED is not set
@@ -86,7 +68,7 @@
 #
 BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
+BR2_KERNEL_ARCH_PATCH_VERSION="2.6.27.6"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 # BR2_TARGET_VALKA is not set
 
@@ -104,7 +86,6 @@
 #
 # Build options
 #
-BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
@@ -117,6 +98,8 @@
 #
 # Mirrors and Download locations
 #
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
@@ -139,6 +122,7 @@
 # BR2_PREFER_IMA is not set
 # BR2_DEPRECATED is not set
 BR2_RECENT=y
+# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
@@ -151,6 +135,7 @@
 # BR2_PREFER_STATIC_LIB is not set
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
+# BR2_HAVE_DOCUMENTATION is not set
 # BR2_HAVE_DEVFILES is not set
 BR2_UPDATE_CONFIG=y
 
@@ -163,15 +148,15 @@
 BR2_TOOLCHAIN_SOURCE=y
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2 is not set
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
-BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2 is not set
+BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2=y
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3 is not set
 # BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
-# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)"
 BR2_VENDOR_SUFFIX="-avr32"
-BR2_VENDOR_BINUTILS_RELEASE="-2.1.5"
-BR2_VENDOR_GCC_RELEASE="-2.1.5"
+BR2_VENDOR_BINUTILS_RELEASE="-1.0.1"
+BR2_VENDOR_GCC_RELEASE="-1.1.3"
 BR2_VENDOR_UCLIBC_RELEASE="-2.1.5"
 BR2_VENDOR_GDB_RELEASE="-2.1.5"
 BR2_VENDOR_PATCH_DIR="Atmel/avr32"
@@ -179,20 +164,16 @@
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
 
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_2_4_25 is not set
-# BR2_KERNEL_HEADERS_2_4_27 is not set
-# BR2_KERNEL_HEADERS_2_4_29 is not set
 # BR2_KERNEL_HEADERS_2_4_31 is not set
-# BR2_KERNEL_HEADERS_2_6_9 is not set
-# BR2_KERNEL_HEADERS_2_6_11 is not set
-# BR2_KERNEL_HEADERS_2_6_12 is not set
 # BR2_KERNEL_HEADERS_2_6_20_4 is not set
 # BR2_KERNEL_HEADERS_2_6_20 is not set
 # BR2_KERNEL_HEADERS_2_6_21_5 is not set
@@ -201,34 +182,45 @@
 # BR2_KERNEL_HEADERS_2_6_22_10 is not set
 # BR2_KERNEL_HEADERS_2_6_22 is not set
 # BR2_KERNEL_HEADERS_2_6_23 is not set
-BR2_KERNEL_HEADERS_2_6_24=y
+# BR2_KERNEL_HEADERS_2_6_24 is not set
 # BR2_KERNEL_HEADERS_2_6_25 is not set
+# BR2_KERNEL_HEADERS_2_6_26 is not set
+# BR2_KERNEL_HEADERS_2_6_27 is not set
+BR2_KERNEL_HEADERS_2_6_28=y
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.24.7"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.28"
 
 #
 # uClibc Options
 #
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
-BR2_UCLIBC_VERSION_0_9_29=y
+# BR2_UCLIBC_VERSION_0_9_29 is not set
+BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 BR2_ENABLE_LOCALE=y
+# BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
 BR2_UCLIBC_PROGRAM_INVOCATION=y
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
+BR2_BINUTILS_VERSION="2.18"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
@@ -242,6 +234,7 @@
 # BR2_GCC_VERSION_4_2_3 is not set
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
+# BR2_GCC_VERSION_4_3_2 is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2"
@@ -298,9 +291,11 @@
 # BR2_BUSYBOX_VERSION_1_8_X is not set
 # BR2_BUSYBOX_VERSION_1_9_X is not set
 # BR2_BUSYBOX_VERSION_1_10_X is not set
-BR2_BUSYBOX_VERSION_1_11_X=y
+# BR2_BUSYBOX_VERSION_1_11_X is not set
+# BR2_BUSYBOX_VERSION_1_12_X is not set
+BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.11.0"
+BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="target/device/Atmel/atstk100x/busybox-1.9.1.config"
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
@@ -338,6 +333,7 @@
 BR2_PACKAGE_GETTEXT=y
 BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
+# BR2_PACKAGE_GPERF is not set
 # BR2_PACKAGE_LIBMPFR is not set
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
@@ -360,9 +356,10 @@
 BR2_PACKAGE_FILE=y
 # BR2_PACKAGE_GAMIN is not set
 # BR2_PACKAGE_ICU is not set
-# BR2_PACKAGE_IPKG is not set
 # BR2_PACKAGE_KEXEC is not set
 # BR2_PACKAGE_LESS is not set
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 # BR2_PACKAGE_LIBEVENT is not set
@@ -370,59 +367,61 @@
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
 # BR2_PACKAGE_LTT is not set
+# BR2_PACKAGE_MEMSTAT is not set
 # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
 # BR2_PACKAGE_MODUTILS is not set
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_POPT is not set
-# BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_PROCPS is not set
 # BR2_PACKAGE_PSMISC is not set
-# BR2_PACKAGE_RPM is not set
 # BR2_PACKAGE_SCREEN is not set
-# BR2_PACKAGE_SQLITE is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
 # BR2_PACKAGE_SYSKLOGD is not set
 # BR2_PACKAGE_SYSVINIT is not set
-# BR2_PACKAGE_TINYLOGIN is not set
 # BR2_PACKAGE_UTIL-LINUX is not set
 # BR2_PACKAGE_WHICH is not set
-BR2_DATABASE_SUPPORT=y
+
+#
+# Database
+#
 # BR2_PACKAGE_MYSQL_CLIENT is not set
-BR2_TEXTEDIT_SUPPORT=y
+# BR2_PACKAGE_SQLITE is not set
+
+#
+# Text editors
+#
 # BR2_PACKAGE_ED is not set
 # BR2_PACKAGE_NANO is not set
 # BR2_PACKAGE_UEMACS is not set
 # BR2_PACKAGE_VIM is not set
-BR2_NETWORK_SUPPORT=y
 
 #
-# Networking applications
+# Networking
 #
 
 #
-# argus		- disabled (requires libpcap)
+# Networking applications
 #
+# BR2_PACKAGE_ARGUS is not set
 BR2_PACKAGE_AVAHI=y
 BR2_PACKAGE_AVAHI_AUTOIPD=y
-
-#
-# mDNS/DNS-SD daemon	- disabled (requires expat)
-#
+# BR2_PACKAGE_AVAHI_DAEMON is not set
 # BR2_PACKAGE_AXEL is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_CURL is not set
-# BR2_PACKAGE_LIBCURL is not set
 # BR2_PACKAGE_ISC_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 BR2_PACKAGE_DROPBEAR=y
@@ -430,9 +429,8 @@
 BR2_PACKAGE_HASERL=y
 # BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
 BR2_PACKAGE_HASERL_VERSION_0_9_X=y
-BR2_PACKAGE_HASERL_VERSION="0.9.23"
+BR2_PACKAGE_HASERL_VERSION="0.9.25"
 # BR2_PACKAGE_IFPLUGD is not set
-# BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
 
@@ -444,9 +442,21 @@
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBUPNP is not set
+BR2_PACKAGE_LIGHTTPD=y
+
+#
+# lighttpd packages
+#
+BR2_PACKAGE_LIGHTTPD_OPENSSL=y
+BR2_PACKAGE_LIGHTTPD_ZLIB=y
+BR2_PACKAGE_LIGHTTPD_BZIP2=y
+# BR2_PACKAGE_LIGHTTPD_PCRE is not set
 # BR2_PACKAGE_LINKS is not set
 BR2_PACKAGE_LRZSZ=y
 # BR2_PACKAGE_MDNSRESPONDER is not set
@@ -479,7 +489,8 @@
 # BR2_PACKAGE_OPENNTPD is not set
 # BR2_PACKAGE_OPENSSH is not set
 BR2_PACKAGE_OPENSSL=y
-# BR2_PACKAGE_OPENSSL_TARGET_HEADERS is not set
+# BR2_PACKAGE_OPENSSL_BIN is not set
+# BR2_PACKAGE_OPENSSL_ENGINES is not set
 # BR2_PACKAGE_OPENVPN is not set
 # BR2_PACKAGE_OPENSWAN is not set
 BR2_PACKAGE_PORTMAP=y
@@ -487,7 +498,6 @@
 # BR2_PACKAGE_RP_PPPOE is not set
 # BR2_PACKAGE_PPTP_LINUX is not set
 BR2_PACKAGE_PROFTPD=y
-# BR2_PACKAGE_QUAGGA is not set
 
 #
 # quagga suite
@@ -507,37 +517,30 @@
 # BR2_PACKAGE_TCPDUMP is not set
 # BR2_PACKAGE_DHCPDUMP is not set
 # BR2_PACKAGE_TFTPD is not set
-BR2_PACKAGE_LIGHTTPD=y
-
-#
-# lighttpd packages
-#
-BR2_PACKAGE_LIGHTTPD_OPENSSL=y
-BR2_PACKAGE_LIGHTTPD_ZLIB=y
-BR2_PACKAGE_LIGHTTPD_BZIP2=y
-# BR2_PACKAGE_LIGHTTPD_PCRE is not set
 # BR2_PACKAGE_THTTPD is not set
 # BR2_PACKAGE_TINYHTTPD is not set
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
 # BR2_PACKAGE_WGET is not set
 BR2_PACKAGE_WIRELESS_TOOLS=y
-BR2_BLOCKDEV_SUPPORT=y
 
 #
+# Hardware handling / blockdevices and filesystem maintenance
+#
+
+#
 # dbus not available (need expat or libxml2)
 #
 # BR2_PACKAGE_DEVMEM2 is not set
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_EEPROG is not set
 # BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FIS is not set
 # BR2_PACKAGE_LIBFUSE is not set
@@ -597,7 +600,10 @@
 # BR2_PACKAGE_USBUTILS is not set
 # BR2_PACKAGE_WIPE is not set
 # BR2_PACKAGE_XFSPROGS is not set
-BR2_AUDIO_SUPPORT=y
+
+#
+# Audio and video libraries and applications
+#
 BR2_PACKAGE_ALSA_LIB=y
 BR2_PACKAGE_ALSA_UTILS=y
 
@@ -623,11 +629,14 @@
 # asterisk	- disabled (required openssl and mpg123)
 #
 # BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_GSTREAMER is not set
 # BR2_PACKAGE_LIBID3TAG is not set
 BR2_PACKAGE_LIBMAD=y
 # BR2_PACKAGE_LIBMAD_TARGET_HEADERS is not set
+# BR2_PACKAGE_LIBMPD is not set
 # BR2_PACKAGE_LIBOGG is not set
 # BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBTHEORA is not set
 
 #
 # libvorbis requires the package libogg to build
@@ -635,11 +644,16 @@
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
 BR2_PACKAGE_MPG123_ALSA=y
+BR2_PACKAGE_MPLAYER=y
 # BR2_PACKAGE_SPEEX is not set
 # BR2_PACKAGE_FESTIVAL is not set
-BR2_GRAPHIC_SUPPORT=y
+# BR2_PACKAGE_VLC is not set
 
 #
+# Graphic libraries and applications (graphic/text)
+#
+
+#
 # text rendering libraries
 #
 BR2_PACKAGE_NCURSES=y
@@ -659,14 +673,15 @@
 # graphic libraries
 #
 # BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
 # BR2_PACKAGE_IMAGEMAGICK is not set
 BR2_PACKAGE_JPEG=y
 # BR2_PACKAGE_LIBART is not set
 BR2_PACKAGE_LIBPNG=y
 BR2_PACKAGE_LIBUNGIF=y
+BR2_PACKAGE_LINUX_FUSION=y
+# BR2_PACKAGE_PIXMAN is not set
 # BR2_PACKAGE_SDL is not set
-# BR2_PACKAGE_SDL_MIXER is not set
-# BR2_PACKAGE_SDL_TTF is not set
 # BR2_PACKAGE_TIFF is not set
 
 #
@@ -709,16 +724,34 @@
 # BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE is not set
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="$(ARCH)"
 # BR2_PACKAGE_QTOPIA4_SQL_MODULE is not set
+
+#
+# Graphics drivers
+#
+BR2_PACKAGE_QTOPIA4_GFX_LINUXFB=y
+# BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED is not set
+# BR2_PACKAGE_QTOPIA4_GFX_QVFB is not set
+# BR2_PACKAGE_QTOPIA4_GFX_VNC is not set
+# BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN is not set
+
+#
+# Mouse drivers
+#
+# BR2_PACKAGE_QTOPIA4_MOUSE_PC is not set
+# BR2_PACKAGE_QTOPIA4_MOUSE_BUS is not set
+# BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP is not set
+# BR2_PACKAGE_QTOPIA4_MOUSE_YOPY is not set
+# BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX is not set
+# BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB is not set
+# BR2_PACKAGE_QTOPIA4_MOUSE_QVFB is not set
+# BR2_PACKAGE_QTOPIA4_PHONON is not set
 # BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
 # BR2_PACKAGE_QTOPIA4_SVG is not set
 # BR2_PACKAGE_QTOPIA4_WEBKIT is not set
 # BR2_PACKAGE_QTOPIA4_OPENSSL is not set
-
-#
-# X Window System server
-#
 BR2_PACKAGE_XSERVER_none=y
-BR2_X11_PREFIX="/usr"
+# BR2_PACKAGE_XSERVER_xorg is not set
+# BR2_PACKAGE_XSERVER_tinyx is not set
 
 #
 # X libraries and helper libraries
@@ -726,13 +759,9 @@
 # BR2_PACKAGE_ATK is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
+# BR2_PACKAGE_LIBERATION is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
-# BR2_PACKAGE_LIBSEXY is not set
-
-#
-# fltk		- disabled (requires Xorg(7))
-#
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
@@ -745,10 +774,6 @@
 # BR2_PACKAGE_MATCHBOX is not set
 
 #
-# blackbox		- disabled (requires Xorg(7))
-#
-
-#
 # X applications
 #
 # BR2_PACKAGE_ALSAMIXERGUI is not set
@@ -756,7 +781,6 @@
 #
 # dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
 #
-# BR2_PACKAGE_DOCKER is not set
 # BR2_PACKAGE_GQVIEW is not set
 # BR2_PACKAGE_LEAFPAD is not set
 
@@ -772,29 +796,57 @@
 # BR2_PACKAGE_XVKBD is not set
 
 #
-# Video libraries/codecs and applications
+# Compressors / decompressors
 #
-BR2_PACKAGE_MPLAYER=y
-# BR2_PACKAGE_VLC is not set
-BR2_COMPRESSOR_SUPPORT=y
 # BR2_PACKAGE_GZIP is not set
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
-# BR2_SCRIPTING_SUPPORT is not set
-BR2_XML_SUPPORT=y
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+# BR2_PACKAGE_PORTAGE is not set
+# BR2_PACKAGE_RPM is not set
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
 # BR2_PACKAGE_XERCES is not set
-BR2_JAVA_SUPPORT=y
+
+#
+# Java
+#
 # BR2_PACKAGE_CLASSPATH is not set
-# BR2_GAMES is not set
 
 #
+# Games
+#
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_MAGICCUBE4D is not set
+# BR2_PACKAGE_PRBOOM is not set
+# BR2_PACKAGE_RUBIX is not set
+# BR2_PACKAGE_VICE is not set
+# BR2_PACKAGE_XBOARD is not set
+
+#
 # Target filesystem options
 #
 
@@ -833,16 +885,18 @@
 #
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
+# BR2_TARGET_UBOOT_2009_01_RC1 is not set
+BR2_TARGET_UBOOT_2008_10=y
+# BR2_TARGET_UBOOT_1_3_4 is not set
+# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
+BR2_UBOOT_VERSION="2008.10"
+BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
-BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
-BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
-BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
-BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
-BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
-BR2_TARGET_UBOOT_ETH1ADDR=""
 # BR2_TARGET_UBOOT_SILENT is not set
 # BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
 # BR2_TARGET_UBOOT_TOOL_ENV is not set
+# BR2_TARGET_UBOOT_DEFAULT_ENV is not set
+# BR2_BOOTSOURCE is not set
 
 #
 # Kernel
@@ -854,17 +908,29 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.24.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
+BR2_KERNEL_CURRENT_VERSION="2.6.28"
+BR2_KERNEL_LATEST_2_6_28="1"
+BR2_KERNEL_LATEST_2_6_27="10"
+BR2_KERNEL_LATEST_2_6_26="8"
+BR2_KERNEL_LATEST_2_6_25="9"
+BR2_KERNEL_LATEST_2_6_24="7"
+BR2_KERNEL_LATEST_2_6_23="17"
+BR2_KERNEL_LATEST_2_6_22="19"
+BR2_KERNEL_LATEST_2_6_21="7"
+BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
-BR2_KERNEL_CURRENT_VERSION="2.6.25.9"
-BR2_KERNEL_NEXT_VERSION="2.6.25"
-BR2_KERNEL_THIS_VERSION="2.6.24"
+BR2_KERNEL_NEXT_VERSION="2.6.28"
+BR2_KERNEL_THIS_VERSION="2.6.27"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
 # BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_28 is not set
+BR2_LINUX_2_6_27=y
+# BR2_LINUX_2_6_26 is not set
 # BR2_LINUX_2_6_25 is not set
-BR2_LINUX_2_6_24=y
+# BR2_LINUX_2_6_24 is not set
 # BR2_LINUX_2_6_23 is not set
 # BR2_LINUX_2_6_22_10 is not set
 # BR2_LINUX_2_6_22_1 is not set
@@ -873,8 +939,7 @@
 # BR2_LINUX_2_6_21_5 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_26 is not set
-# BR2_LINUX_2_6_27 is not set
+# BR2_LINUX_2_6_29 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
@@ -893,7 +958,9 @@
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="3"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
-BR2_ARCH_AVR32_2_6_24=y
+BR2_ARCH_AVR32_2_6_27_6=y
+# BR2_ARCH_AVR32_2_6_25_10 is not set
+# BR2_ARCH_AVR32_2_6_24 is not set
 # BR2_ARCH_AVR32_2_6_23 is not set
 # BR2_ARCH_AVR32_2_6_22_10 is not set
 # BR2_ARCH_AVR32_2_6_22_1 is not set
@@ -905,9 +972,7 @@
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
-# BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
-# BR2_KERNEL_LATEST is not set
 BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION)"
 BR2_LINUX26_VERSION="$(BR2_KERNEL_THIS_VERSION).$(BR2_KERNEL_PATCH_LEVEL)"
 
@@ -917,9 +982,6 @@
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
-BR2_MAKE_XCONFIG=y
-# BR2_MAKE_MENUCONFIG is not set
-BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set

Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2009-01-16 22:06:49 UTC (rev 24890)
+++ trunk/buildroot/target/device/Config.in.toolchain	2009-01-16 22:39:05 UTC (rev 24891)
@@ -20,6 +20,7 @@
 config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
 	bool "Use prepatched source for AVR32 gcc-4.2.1 toolchain"
 	depends on BR2_avr32
+	depends on BR2_DEPRECATED
 	select BR2_EXT_GCC_VERSION_4_2_1
 	select BR2_EXT_BINUTILS_VERSION_2_17
 	select BR2_EXT_UCLIBC_VERSION_0_9_29
@@ -37,6 +38,7 @@
 config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
 	bool "Use prepatched source for AVR32 gcc-4.2.2 toolchain"
 	depends on BR2_avr32
+	depends on BR2_DEPRECATED
 	select BR2_EXT_GCC_VERSION_4_2_2
 	select BR2_EXT_BINUTILS_VERSION_2_17
 	select BR2_EXT_UCLIBC_VERSION_0_9_29
@@ -56,7 +58,6 @@
 	depends on BR2_avr32
 	select BR2_EXT_GCC_VERSION_4_2_2
 	select BR2_EXT_BINUTILS_VERSION_2_18
-	select BR2_EXT_UCLIBC_VERSION_0_9_29
 	select BR2_EXT_UCLIBC_VERSION_0_9_30
 	select BR2_TOOLCHAIN_ATMEL_AVR32
 	select BR2_GCC_SUPPORTS_SYSROOT
@@ -72,6 +73,7 @@
 config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 	bool "Use prepatched source for AVR32 gcc-4.2.3 toolchain"
 	depends on BR2_avr32
+	depends on BR2_DEPRECATED
 	depends on BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
 	select BR2_EXT_GCC_VERSION_4_2_3
 	select BR2_EXT_BINUTILS_VERSION_2_17

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 22:06:49 UTC (rev 24890)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 22:39:05 UTC (rev 24891)
@@ -32,9 +32,8 @@
 		bool "gcc 4.2.1"
 
 	config BR2_GCC_VERSION_4_2_2
-		depends on BR2_avr32
 		depends on BR2_EXT_GCC_VERSION_4_2_2
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED || BR2_avr32
 		bool "gcc 4.2.2"
 
 	config BR2_GCC_VERSION_4_2_3

Added: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch	2009-01-16 22:39:05 UTC (rev 24891)
@@ -0,0 +1,42 @@
+--- a/libstdc++-v3/acinclude.m4
++++ b/libstdc++-v3/acinclude.m4
+@@ -125,6 +125,15 @@ AC_DEFUN([GLIBCXX_CONFIGURE], [
+   ## other macros from doing the same.  This should be automated.)  -pme
+   need_libmath=no
+ 
++  # Check for uClibc since Linux platforms use different configuration
++  # directories depending on the C library in use.
++  AC_EGREP_CPP([_using_uclibc], [
++  #include <stdio.h>
++  #if __UCLIBC__
++    _using_uclibc
++  #endif
++  ], uclibc=yes, uclibc=no)
++
+   # Find platform-specific directories containing configuration info.
+   # Also possibly modify flags used elsewhere, as needed by the platform.
+   GLIBCXX_CHECK_HOST
+--- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
++++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+@@ -31,8 +31,6 @@
+ //
+ // ISO C++ 14882: 22.1  Locales
+ //
+-#include <features.h>
+-#include <ctype.h>
+   
+ /** @file ctype_base.h
+  *  This is an internal header file, included by other library headers.
+@@ -47,11 +45,7 @@ _GLIBCXX_BEGIN_NAMESPACE(std)
+   struct ctype_base
+   {
+     // Non-standard typedefs.
+-#ifdef __UCLIBC__
+-    typedef const __ctype_touplow_t*   __to_type;
+-#else
+-    typedef const int*         __to_type;
+-#endif
++    typedef const int*		__to_type;
+  
+     // NB: Offsets into ctype<char>::_M_table force a particular size
+     // on the mask type. Because of this, we don't use an enum.

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-16 22:06:49 UTC (rev 24890)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-16 22:39:05 UTC (rev 24891)
@@ -529,5 +529,10 @@
 gcc_target-dirclean:
 	rm -rf $(GCC_BUILD_DIR3)
 
+gcc-status:
+	@echo GCC_OFFICIAL_VERSION=$(GCC_OFFICIAL_VERSION)
+	@echo GCC_PATCH_DIR=$(GCC_PATCH_DIR)
+	@echo GCC_SITE=$(GCC_SITE)
+
 endif
 # gcc-4.x only
