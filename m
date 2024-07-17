Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F4BC3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44B4F40EE1;
	Wed, 17 Jul 2024 21:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oFb-ue8FpUm; Wed, 17 Jul 2024 21:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E72B40EF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E72B40EF5;
	Wed, 17 Jul 2024 21:18:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 094841BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EFEE40CA1
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o91OXDEsydel for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CCD040E74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CCD040E74
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78DEB86D80; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:17:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13ac570c9f7d1b29c5ffcc351d104a63c2557e36
X-Git-Newrev: 281134f346ad8652dffd89b4488beb00e8ccd5d0
X-Patchwork-Hint: ignore
Message-Id: <20240717211735.78DEB86D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi*: sort some configs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4104780166277364126=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4104780166277364126==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=281134f346ad8652dffd89b4488beb00e8ccd5d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This moves some configs in the defconfigs and removes some comments so
the defconfig files look similar.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi0_defconfig        |  3 ---
 configs/raspberrypi0w_defconfig       |  1 +
 configs/raspberrypi2_defconfig        |  6 ++----
 configs/raspberrypi3_64_defconfig     |  6 ++----
 configs/raspberrypi3_defconfig        |  6 ++----
 configs/raspberrypi3_qt5we_defconfig  | 15 +++++++--------
 configs/raspberrypi4_64_defconfig     |  6 ++----
 configs/raspberrypi4_defconfig        |  6 ++----
 configs/raspberrypi5_defconfig        | 11 +++++------
 configs/raspberrypi_defconfig         |  2 --
 configs/raspberrypicm4io_64_defconfig |  6 ++----
 configs/raspberrypicm4io_defconfig    |  6 ++----
 configs/raspberrypizero2w_defconfig   |  5 +++--
 13 files changed, 30 insertions(+), 49 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index b2b7351ac1..23ea25eb6f 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -15,9 +15,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
-
-# Build the DTBs for A/B from the kernel sources: the zero is the same
-# as the A+ model, just in a different form-factor
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
 
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index a198596b40..fc40471b77 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc1
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
+
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 75310fdb28..30b7ff9fde 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,19 +7,17 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
 
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index f4ecf2575f..bfef4683b3 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -6,19 +6,17 @@ BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
 
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index ba2d5b6eed..d55410777d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -6,19 +6,17 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
 
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 450a82f8f3..826181a2ec 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -6,20 +6,18 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
 
@@ -34,13 +32,14 @@ BR2_PACKAGE_QT5BASE_JPEG=y
 BR2_PACKAGE_QT5BASE_PNG=y
 BR2_PACKAGE_QT5WEBENGINE=y
 BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_CA_CERTIFICATES=y
+BR2_PACKAGE_NTP=y
+
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
 BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3_qt5we.txt"
-BR2_PACKAGE_RPI_USERLAND=y
-BR2_PACKAGE_CA_CERTIFICATES=y
-BR2_PACKAGE_NTP=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index b7336e334f..d5fa72d57d 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -6,19 +6,17 @@ BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
 
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 2cf533e32e..d7d5ec2499 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -6,19 +6,17 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
 
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 67026e0d6d..268bf2892a 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -2,20 +2,22 @@ BR2_aarch64=y
 BR2_cortex_a76_a55=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b"
 
@@ -45,6 +47,3 @@ BR2_PACKAGE_KMOD_TOOLS=y
 BR2_PACKAGE_XZ=y
 BR2_PACKAGE_KMOD=y
 BR2_PACKAGE_HOST_KMOD_XZ=y
-
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_GLOBAL_PATCH_DIR="board/raspberrypi5/patches"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index c6b296e1af..97cb4e734d 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -17,8 +17,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
-
-# Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
 
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index e9d57091b5..cff9270ed6 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -6,19 +6,17 @@ BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
 
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 537d077b71..2972419ac7 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -6,19 +6,17 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
-
-# Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
 
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 37922909f3..7f83e9a258 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -6,7 +6,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, 6.6 series
+# Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
+
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
@@ -26,7 +27,7 @@ BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
 BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2w/config_zero2w.txt"
 
-# MicroSD images generation tools
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y

--===============4104780166277364126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4104780166277364126==--
