From: root <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 18:43:27 -0300
Subject: [Buildroot] [PATCH] Update i686_defconfig
In-Reply-To: <1242251013-25228-4-git-send-email-thiago.correa@gmail.com>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-3-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-4-git-send-email-thiago.correa@gmail.com>
Message-ID: <1242251013-25228-5-git-send-email-thiago.correa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 target/device/x86/i686/i686_defconfig |   42 +++++++++++++++++++-------------
 1 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/target/device/x86/i686/i686_defconfig b/target/device/x86/i686/i686_defconfig
index 916bc6b..116d0a2 100644
--- a/target/device/x86/i686/i686_defconfig
+++ b/target/device/x86/i686/i686_defconfig
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Fri Apr 17 03:45:22 2009
+# Wed May 13 01:35:07 2009
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="2009.05-svn"
+BR2_VERSION="2009.05-rc1"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -162,10 +162,10 @@ BR2_EXT_UCLIBC_VERSION_0_9_30_1=y
 # BR2_KERNEL_HEADERS_2_6_25 is not set
 # BR2_KERNEL_HEADERS_2_6_26 is not set
 # BR2_KERNEL_HEADERS_2_6_27 is not set
-BR2_KERNEL_HEADERS_2_6_28=y
-# BR2_KERNEL_HEADERS_2_6_29 is not set
+# BR2_KERNEL_HEADERS_2_6_28 is not set
+BR2_KERNEL_HEADERS_2_6_29=y
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.28.9"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 
 #
 # uClibc Options
@@ -208,11 +208,12 @@ BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 # BR2_GCC_VERSION_4_2_3 is not set
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
-BR2_GCC_VERSION_4_3_2=y
+# BR2_GCC_VERSION_4_3_2 is not set
 # BR2_GCC_VERSION_4_3_3 is not set
+BR2_GCC_VERSION_4_4_X=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
-BR2_GCC_VERSION="4.3.2"
+BR2_GCC_VERSION="4.4.0"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
@@ -233,14 +234,11 @@ BR2_GCC_SHARED_LIBGCC=y
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
@@ -253,6 +251,7 @@ BR2_ENABLE_LOCALE=y
 # BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
+# BR2_USE_SSP is not set
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
@@ -319,7 +318,10 @@ BR2_HOST_FAKEROOT=y
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
@@ -346,6 +348,7 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_SUDO is not set
@@ -386,6 +389,7 @@ BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBSOUP is not set
 # BR2_PACKAGE_LIBUPNP is not set
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
@@ -450,6 +454,10 @@ BR2_HOST_FAKEROOT=y
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
@@ -500,10 +508,7 @@ BR2_PACKAGE_MTD_NANDWRITE=y
 BR2_PACKAGE_MTD_NFTL_FORMAT=y
 BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
-
-#
-# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
-#
+# BR2_PACKAGE_NTFS_3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
@@ -536,6 +541,7 @@ BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_MPLAYER is not set
 # BR2_PACKAGE_SPEEX is not set
 # BR2_PACKAGE_FESTIVAL is not set
+# BR2_PACKAGE_TAGLIB is not set
 # BR2_PACKAGE_VLC is not set
 
 #
@@ -617,6 +623,7 @@ BR2_PACKAGE_XSERVER_none=y
 # dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
 #
 # BR2_PACKAGE_GQVIEW is not set
+# BR2_PACKAGE_GOB2 is not set
 # BR2_PACKAGE_LEAFPAD is not set
 
 #
@@ -735,7 +742,8 @@ BR2_KERNEL_LINUX_ADVANCED=y
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="bzImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.28.7"
+BR2_KERNEL_CURRENT_VERSION="2.6.29.2"
+BR2_KERNEL_LATEST_2_6_29="2"
 BR2_KERNEL_LATEST_2_6_28="7"
 BR2_KERNEL_LATEST_2_6_27="13"
 BR2_KERNEL_LATEST_2_6_26="8"
@@ -749,6 +757,7 @@ BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
+# BR2_LINUX_2_6_29 is not set
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
 # BR2_LINUX_2_6_26 is not set
@@ -758,7 +767,6 @@ BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_22 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_29 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
-- 
1.6.0.6
