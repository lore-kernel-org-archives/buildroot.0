From: root <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 18:43:29 -0300
Subject: [Buildroot] [PATCH] Update i386_defconfig
In-Reply-To: <1242251013-25228-6-git-send-email-thiago.correa@gmail.com>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-3-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-4-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-5-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-6-git-send-email-thiago.correa@gmail.com>
Message-ID: <1242251013-25228-7-git-send-email-thiago.correa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 target/device/x86/i686/i386_defconfig |  139 +++++++++++++++++----------------
 1 files changed, 72 insertions(+), 67 deletions(-)

diff --git a/target/device/x86/i686/i386_defconfig b/target/device/x86/i686/i386_defconfig
index da28324..a4d6ae9 100644
--- a/target/device/x86/i686/i386_defconfig
+++ b/target/device/x86/i686/i386_defconfig
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 29 19:58:33 2009
+# Wed May 13 01:39:19 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="2009.02-svn"
+BR2_VERSION="2009.05-rc1"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -21,10 +21,10 @@ BR2_i386=y
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
-# BR2_x86_i386 is not set
+BR2_x86_i386=y
 # BR2_x86_i486 is not set
 # BR2_x86_i586 is not set
-BR2_x86_i686=y
+# BR2_x86_i686 is not set
 # BR2_x86_pentiumpro is not set
 # BR2_x86_pentium_mmx is not set
 # BR2_x86_pentium_m is not set
@@ -45,10 +45,10 @@ BR2_x86_i686=y
 # BR2_x86_c3 is not set
 # BR2_x86_winchip_c6 is not set
 # BR2_x86_winchip2 is not set
-BR2_ARCH="i686"
+BR2_ARCH="i386"
 BR2_ENDIAN="LITTLE"
-BR2_GCC_TARGET_TUNE="i686"
-BR2_GCC_TARGET_ARCH="i686"
+BR2_GCC_TARGET_TUNE="i386"
+BR2_GCC_TARGET_ARCH="i386"
 
 #
 # Target options
@@ -64,17 +64,22 @@ BR2_BANNER="Welcome to the Erik's uClibc development environment."
 #
 # Preset Devices
 #
-BR2_BOARD_NAME="i386"
+# BR2_TARGET_AMD is not set
+BR2_BOARD_NAME="i686"
 BR2_BOARD_PATH="target/device/x86/$(BR2_BOARD_NAME)"
 BR2_TARGET_X86=y
-BR2_TARGET_I386=y
+BR2_TARGET_I686=y
 
 #
 # Generic System Support
 #
 # BR2_TARGET_GENERIC_ACCESS_POINT is not set
 # BR2_TARGET_GENERIC_FIREWALL is not set
-# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
+
+#
+# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
+#
+# BR2_TARGET_GENERIC_GETTY is not set
 
 #
 # Build options
@@ -108,8 +113,6 @@ BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-BR2_ROOTFS_PREFIX="rootfs"
-BR2_ROOTFS_SUFFIX=""
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
 BR2_GNU_TARGET_SUFFIX="linux-uclibc"
 BR2_JLEVEL=1
@@ -149,41 +152,31 @@ BR2_EXT_BINUTILS_VERSION_2_18=y
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
-BR2_KERNEL_HEADERS_2_6_28=y
+# BR2_KERNEL_HEADERS_2_6_28 is not set
+BR2_KERNEL_HEADERS_2_6_29=y
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 
 #
 # uClibc Options
 #
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
-BR2_UCLIBC_VERSION_0_9_29=y
+# BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not set
+BR2_UCLIBC_VERSION_0_9_30_1=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
-BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
-# BR2_PTHREADS_NONE is not set
-# BR2_PTHREADS is not set
-BR2_PTHREADS_OLD=y
-# BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
 # BR2_UCLIBC_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
@@ -193,14 +186,15 @@ BR2_PTHREADS_OLD=y
 #
 # BR2_BINUTILS_VERSION_2_17 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
-BR2_BINUTILS_VERSION_2_18=y
+# BR2_BINUTILS_VERSION_2_18 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_3 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
 # BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
 # BR2_BINUTILS_VERSION_2_19 is not set
-BR2_BINUTILS_VERSION="2.18"
+BR2_BINUTILS_VERSION_2_19_1=y
+BR2_BINUTILS_VERSION="2.19.1"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
@@ -214,16 +208,16 @@ BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 # BR2_GCC_VERSION_4_2_3 is not set
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
-BR2_GCC_VERSION_4_3_2=y
+# BR2_GCC_VERSION_4_3_2 is not set
+# BR2_GCC_VERSION_4_3_3 is not set
+BR2_GCC_VERSION_4_4_X=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
-BR2_GCC_VERSION="4.3.2"
+BR2_GCC_VERSION="4.4.0"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
-BR2_INSTALL_LIBSTDCPP=y
 # BR2_INSTALL_LIBGCJ is not set
 # BR2_INSTALL_OBJC is not set
 # BR2_INSTALL_FORTRAN is not set
@@ -240,45 +234,46 @@ BR2_GCC_SHARED_LIBGCC=y
 # BR2_PACKAGE_GDB is not set
 BR2_PACKAGE_GDB_SERVER=y
 # BR2_PACKAGE_GDB_HOST is not set
-# BR2_GDB_VERSION_6_2_1 is not set
-# BR2_GDB_VERSION_6_3 is not set
 # BR2_GDB_VERSION_6_4 is not set
 # BR2_GDB_VERSION_6_5 is not set
 # BR2_GDB_VERSION_6_6 is not set
 # BR2_GDB_VERSION_6_7_1 is not set
 BR2_GDB_VERSION_6_8=y
-# BR2_GDB_VERSION_SNAPSHOT is not set
 BR2_GDB_VERSION="6.8"
 
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
+# BR2_USE_SSP is not set
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
-BR2_BUSYBOX_VERSION="1.13.4"
+BR2_BUSYBOX_VERSION="1.14.0"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -311,6 +306,7 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
+# BR2_PACKAGE_PKG_CONFIG is not set
 # BR2_PACKAGE_READLINE is not set
 # BR2_PACKAGE_VALGRIND is not set
 # BR2_PACKAGE_PCRE is not set
@@ -322,7 +318,10 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_BEECRYPT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
-# BR2_PACKAGE_CUPS is not set
+
+#
+# cups requires a toolchain with Stack Protection support
+#
 # BR2_PACKAGE_CUSTOMIZE is not set
 # BR2_PACKAGE_FILE is not set
 # BR2_PACKAGE_GAMIN is not set
@@ -349,6 +348,7 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_SUDO is not set
@@ -378,10 +378,7 @@ BR2_HOST_FAKEROOT=y
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
@@ -392,11 +389,11 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBSOUP is not set
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
 # BR2_PACKAGE_MDNSRESPONDER is not set
-# BR2_PACKAGE_MICROCOM is not set
 # BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
@@ -414,7 +411,6 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_OPENSSH is not set
 # BR2_PACKAGE_OPENSSL is not set
 # BR2_PACKAGE_OPENVPN is not set
-# BR2_PACKAGE_OPENSWAN is not set
 # BR2_PACKAGE_PORTMAP is not set
 # BR2_PACKAGE_PPPD is not set
 # BR2_PACKAGE_RADVD is not set
@@ -448,6 +444,7 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WEBIF is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
 
 #
 # Hardware handling / blockdevices and filesystem maintenance
@@ -457,6 +454,10 @@ BR2_HOST_FAKEROOT=y
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
@@ -507,7 +508,7 @@ BR2_PACKAGE_MTD_NANDWRITE=y
 BR2_PACKAGE_MTD_NFTL_FORMAT=y
 BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
-# BR2_PACKAGE_NTFS-3G is not set
+# BR2_PACKAGE_NTFS_3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
@@ -526,6 +527,7 @@ BR2_PACKAGE_MTD_SUMTOOL=y
 # asterisk	- disabled (required openssl and mpg123)
 #
 # BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
 # BR2_PACKAGE_GSTREAMER is not set
 # BR2_PACKAGE_LIBID3TAG is not set
 # BR2_PACKAGE_LIBMAD is not set
@@ -533,15 +535,13 @@ BR2_PACKAGE_MTD_SUMTOOL=y
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
 # BR2_PACKAGE_SPEEX is not set
 # BR2_PACKAGE_FESTIVAL is not set
+# BR2_PACKAGE_TAGLIB is not set
 # BR2_PACKAGE_VLC is not set
 
 #
@@ -597,6 +597,7 @@ BR2_PACKAGE_XSERVER_none=y
 # X libraries and helper libraries
 #
 # BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBERATION is not set
@@ -622,6 +623,7 @@ BR2_PACKAGE_XSERVER_none=y
 # dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
 #
 # BR2_PACKAGE_GQVIEW is not set
+# BR2_PACKAGE_GOB2 is not set
 # BR2_PACKAGE_LEAFPAD is not set
 
 #
@@ -639,6 +641,7 @@ BR2_PACKAGE_XSERVER_none=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
+# BR2_PACKAGE_LZOP is not set
 # BR2_PACKAGE_LZMA_TARGET is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
@@ -687,6 +690,8 @@ BR2_PACKAGE_ZLIB=y
 #
 # Target filesystem options
 #
+BR2_ROOTFS_PREFIX="rootfs"
+BR2_ROOTFS_SUFFIX=""
 
 #
 # filesystem for target device
@@ -708,7 +713,6 @@ BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
 # BR2_TARGET_ROOTFS_JFFS2_PAD is not set
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 # BR2_TARGET_ROOTFS_JFFS2_BE is not set
-# BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
 BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
 BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
@@ -738,8 +742,9 @@ BR2_KERNEL_LINUX_ADVANCED=y
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="target/device/x86/i386/linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="bzImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
-BR2_KERNEL_LATEST_2_6_28="2"
+BR2_KERNEL_CURRENT_VERSION="2.6.29.2"
+BR2_KERNEL_LATEST_2_6_29="2"
+BR2_KERNEL_LATEST_2_6_28="7"
 BR2_KERNEL_LATEST_2_6_27="13"
 BR2_KERNEL_LATEST_2_6_26="8"
 BR2_KERNEL_LATEST_2_6_25="19"
@@ -752,6 +757,7 @@ BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
+# BR2_LINUX_2_6_29 is not set
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
 # BR2_LINUX_2_6_26 is not set
@@ -761,7 +767,6 @@ BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_22 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_29 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
-- 
1.6.0.6
