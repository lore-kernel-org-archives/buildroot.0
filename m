From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 17 Apr 2009 05:50:44 +0000 (UTC)
Subject: [Buildroot] svn commit: [26129]
	trunk/buildroot/target/device/x86/i686
Message-ID: <20090417055045.0E148763A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-17 05:50:44 +0000 (Fri, 17 Apr 2009)
New Revision: 26129

Log:
Updated i686 config

Modified:
   trunk/buildroot/target/device/x86/i686/i686_defconfig


Changeset:
Modified: trunk/buildroot/target/device/x86/i686/i686_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-04-17 05:44:01 UTC (rev 26128)
+++ trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-04-17 05:50:44 UTC (rev 26129)
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 29 20:18:11 2009
+# Fri Apr 17 03:45:22 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="2009.02-svn"
+BR2_VERSION="2009.05-svn"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -64,6 +64,7 @@
 #
 # Preset Devices
 #
+# BR2_TARGET_AMD is not set
 BR2_BOARD_NAME="i686"
 BR2_BOARD_PATH="target/device/x86/$(BR2_BOARD_NAME)"
 BR2_TARGET_X86=y
@@ -74,9 +75,13 @@
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
 # BR2_TARGET_GENERIC_FIREWALL is not set
-# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
 
 #
+# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
+#
+# BR2_TARGET_GENERIC_GETTY is not set
+
+#
 # Build options
 #
 BR2_WGET="wget --passive-ftp"
@@ -108,8 +113,6 @@
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_ROOTFS_PREFIX="i686-rootfs"
-BR2_ROOTFS_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
@@ -149,41 +152,31 @@
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_30=y
+BR2_EXT_UCLIBC_VERSION_0_9_30_1=y
 
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
-BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.28.9"
 
 #
 # uClibc Options
 #
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
-BR2_UCLIBC_VERSION_0_9_30=y
+# BR2_UCLIBC_VERSION_0_9_30 is not set
+BR2_UCLIBC_VERSION_0_9_30_1=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
-BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
-# BR2_PTHREADS_NONE is not set
-# BR2_PTHREADS is not set
-BR2_PTHREADS_OLD=y
-# BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
 # BR2_UCLIBC_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
@@ -199,8 +192,9 @@
 # BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
-BR2_BINUTILS_VERSION_2_19=y
-BR2_BINUTILS_VERSION="2.19"
+# BR2_BINUTILS_VERSION_2_19 is not set
+BR2_BINUTILS_VERSION_2_19_1=y
+BR2_BINUTILS_VERSION="2.19.1"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
@@ -215,15 +209,14 @@
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
 BR2_GCC_VERSION_4_3_2=y
+# BR2_GCC_VERSION_4_3_3 is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
-BR2_INSTALL_LIBSTDCPP=y
 # BR2_INSTALL_LIBGCJ is not set
 # BR2_INSTALL_OBJC is not set
 # BR2_INSTALL_FORTRAN is not set
@@ -253,32 +246,35 @@
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
+BR2_ENABLE_LOCALE=y
+# BR2_ENABLE_LOCALE_PREGENERATED is not set
+# BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+BR2_GCC_CROSS_CXX=y
+BR2_INSTALL_LIBSTDCPP=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
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
-# BR2_BUSYBOX_VERSION_1_11_X is not set
 # BR2_BUSYBOX_VERSION_1_12_X is not set
-BR2_BUSYBOX_VERSION_1_13_X=y
+# BR2_BUSYBOX_VERSION_1_13_X is not set
+BR2_BUSYBOX_VERSION_1_14_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -311,6 +307,7 @@
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
+# BR2_PACKAGE_PKG_CONFIG is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_VALGRIND is not set
 # BR2_PACKAGE_PCRE is not set
@@ -378,10 +375,7 @@
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
@@ -396,7 +390,6 @@
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
 # BR2_PACKAGE_MDNSRESPONDER is not set
-# BR2_PACKAGE_MICROCOM is not set
 # BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
@@ -414,7 +407,6 @@
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
 # BR2_PACKAGE_OPENVPN is not set
-# BR2_PACKAGE_OPENSWAN is not set
 # BR2_PACKAGE_PORTMAP is not set
 # BR2_PACKAGE_PPPD is not set
 # BR2_PACKAGE_RADVD is not set
@@ -448,6 +440,7 @@
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WEBIF is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
 
 #
 # Hardware handling / blockdevices and filesystem maintenance
@@ -507,7 +500,10 @@
 BR2_PACKAGE_MTD_NFTL_FORMAT=y
 BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
-# BR2_PACKAGE_NTFS-3G is not set
+
+#
+# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
+#
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
@@ -526,6 +522,7 @@
 # asterisk	- disabled (required openssl and mpg123)
 #
 # BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
 # BR2_PACKAGE_GSTREAMER is not set
 # BR2_PACKAGE_LIBID3TAG is not set
 # BR2_PACKAGE_LIBMAD is not set
@@ -533,10 +530,7 @@
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
@@ -597,6 +591,7 @@
 # X libraries and helper libraries
 #
 # BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
@@ -639,6 +634,7 @@
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
+# BR2_PACKAGE_LZOP is not set
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
@@ -687,6 +683,8 @@
 #
 # Target filesystem options
 #
+BR2_ROOTFS_PREFIX="i686-rootfs"
+BR2_ROOTFS_SUFFIX=""
 
 #
 # filesystem for target device
@@ -708,7 +706,6 @@
 # BR2_TARGET_ROOTFS_JFFS2_PAD is not set
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
-# BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
 BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
 BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
@@ -738,8 +735,8 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="bzImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
-BR2_KERNEL_LATEST_2_6_28="2"
+BR2_KERNEL_CURRENT_VERSION="2.6.28.7"
+BR2_KERNEL_LATEST_2_6_28="7"
 BR2_KERNEL_LATEST_2_6_27="13"
 BR2_KERNEL_LATEST_2_6_26="8"
 BR2_KERNEL_LATEST_2_6_25="19"
