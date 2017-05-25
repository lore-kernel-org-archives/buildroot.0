From: Theore Ateba <tf.ateba@gmail.com>
Date: Thu, 25 May 2017 15:40:27 +0200
Subject: [Buildroot] [v2,next,01/11] gstreamer1: bump version to 1.12.0
Message-ID: <00d0056a-ce9f-1179-fcf7-acd51c845625@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Theodore Ateba, tf.ateba at gmail.com

Build test:
	Gstreamer1-v1.12.0 was build successfully with glibc-v2.24 and qt5.8 on x86_64 PC for a Beaglebone black.

Runtime test:
	The run time test was made on Beaglebone Black board.
	I made the test of some Qt examples applications, such as opengl-hellowindows and keyinteraction.

I have attached the  configuration used to test gstreamer.

thanks, Theodore Ateba.

On May 12, 2017, 10:17 a.m, Vicente Olivert Riera wrote: 
<https://patchwork.ozlabs.org/project/buildroot/list/?submitter=46496>

0001 patch already included in this release:
   https://github.com/GStreamer/gstreamer/commit/c893882fd93238ce722096ecf4db87b6a9f87c5d
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
- Nothing.
---
  ....in-Fix-unaligned-access-support-for-the-.patch | 33 ----------------------
  package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +--
  package/gstreamer1/gstreamer1/gstreamer1.mk        |  2 +-
  3 files changed, 3 insertions(+), 36 deletions(-)
  delete mode 100644 package/gstreamer1/gstreamer1/0001-gstconfig.h.in-Fix-unaligned-access-support-for-the-.patch


diff --git a/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-Fix-unaligned-access-support-for-the-.patch b/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-Fix-unaligned-access-support-for-the-.patch
deleted file mode 100644
index 88f3373..0000000
--- a/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-Fix-unaligned-access-support-for-the-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 437b3e38d9127ae021ca8510709c2e6be3e6b819 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sat, 18 Feb 2017 10:03:24 +0100
-Subject: [PATCH] gstconfig.h.in: Fix unaligned access support for the openrisc
- architecture
-
-Teach gstconfig.h.in about the openrisc (or1k) architecture.  Fixes
-buildroot autobuild failure:
-
-http://autobuild.buildroot.net/results/717/717d78ce0935749f477bdf3133b6f20057a28c01/build-end.log
-
-Submitted-upstream: https://bugzilla.gnome.org/show_bug.cgi?id=778866
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- gst/gstconfig.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
-index cf95f61ab..1b2ca64ac 100644
---- a/gst/gstconfig.h.in
-+++ b/gst/gstconfig.h.in
-@@ -104,7 +104,7 @@
-  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
-  * https://software.intel.com/en-us/node/583402
-  */
--#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__)
-+#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__)
- #  define GST_HAVE_UNALIGNED_ACCESS 0
- #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
- #  define GST_HAVE_UNALIGNED_ACCESS 1
---
-2.11.0
-
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 455e7fb..56e1c17 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.4.tar.xz.sha256sum
-sha256 50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218  gstreamer-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.0.tar.xz.sha256sum
+sha256 14d5eef8297d2bf2a728d38fa43cd92cc267a0ad260cf83d770215212aff4302  gstreamer-1.12.0.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index fc756c3..ac498d5 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
  #
  ################################################################################
  
-GSTREAMER1_VERSION = 1.10.4
+GSTREAMER1_VERSION = 1.12.0
  GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
  GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
  GSTREAMER1_INSTALL_STAGING = YES

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170525/5b3c8822/attachment.html>
-------------- next part --------------
BR2_arm=y
BR2_cortex_a8=y
BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_BAD=y
BR2_PACKAGE_GST1_PLUGINS_UGLY=y
BR2_PACKAGE_BITSTREAM_VERA=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_FONT_AWESOME=y
BR2_PACKAGE_FBV=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_TI_SGX_DEMOS=y
BR2_PACKAGE_TI_SGX_KM=y
BR2_PACKAGE_TI_SGX_UM=y
BR2_PACKAGE_DROPBEAR=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
BR2_TARGET_UBOOT_NEEDS_DTC=y
# BR2_TARGET_UBOOT_FORMAT_BIN is not set
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
