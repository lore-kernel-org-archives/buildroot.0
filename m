Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD6CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC1A818EC;
	Wed, 29 Dec 2021 09:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-93_Tzg6hUT; Wed, 29 Dec 2021 09:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2488E82438;
	Wed, 29 Dec 2021 09:14:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E50C1BF9BA
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D1BB4067C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7f8Aqu6d9cB for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3BA04089A
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:13:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A78C582A7D; Wed, 29 Dec 2021 09:07:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:13:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 661032e32c28976b3abb58fe88f8f0e75d3d2dde
X-Git-Newrev: aed7e58219b25371eb6997b50e983f6d41f29e85
X-Patchwork-Hint: ignore
Message-Id: <20211229090749.A78C582A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/{microchip,
 atmel}: update Linux kernel to linux4microchip 5.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aed7e58219b25371eb6997b50e983f6d41f29e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux4sam has moved to linux4microchip.
First linux4microchip release for the SAMA & SAM9X60 boards is
linux4microchip 2021.10.
Bump all boards to use this kernel version.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 4 ++--
 configs/atmel_sama5d2_xplained_mmc_defconfig           | 4 ++--
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 4 ++--
 configs/atmel_sama5d3_xplained_defconfig               | 4 ++--
 configs/atmel_sama5d3_xplained_dev_defconfig           | 4 ++--
 configs/atmel_sama5d3_xplained_mmc_defconfig           | 4 ++--
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 4 ++--
 configs/atmel_sama5d4_xplained_defconfig               | 4 ++--
 configs/atmel_sama5d4_xplained_dev_defconfig           | 4 ++--
 configs/atmel_sama5d4_xplained_mmc_defconfig           | 4 ++--
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 4 ++--
 configs/microchip_sam9x60ek_mmc_defconfig              | 4 ++--
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 4 ++--
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig     | 4 ++--
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 4 ++--
 configs/microchip_sama5d2_icp_mmc_defconfig            | 4 ++--
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 4 ++--
 17 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index e85c38af50..ba9b61936b 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_som1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.04)/linux-at91-linux4sam-2020.04.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek"
diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index 32e9f582e6..3b21e7a56d 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -3,12 +3,12 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d2_xplained_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained"
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index f71e284ff5..843c033cf5 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -6,7 +6,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
@@ -24,7 +24,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d2_xplained_mmc/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained"
diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index b03c0db2c5..83390f41ef 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -2,10 +2,10 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 89c273da33..720ed57e25 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
@@ -20,7 +20,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 8256a5e199..068b5d443b 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -2,12 +2,12 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d3_xplained_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 7c39a5a2d4..a530c7d9f6 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d3_xplained_mmc/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 2a3e91954d..82da11f392 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -3,10 +3,10 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained"
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 6779c04d47..5a4bec344d 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -6,7 +6,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
@@ -21,7 +21,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained"
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index e0b1e5147f..52905c82ef 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -3,12 +3,12 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d4_xplained_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained"
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index e638e6758a..565ff06900 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -6,7 +6,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
@@ -24,7 +24,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d4_xplained_mmc/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained"
diff --git a/configs/microchip_sam9x60ek_mmc_defconfig b/configs/microchip_sam9x60ek_mmc_defconfig
index 081aa16e24..8b1c3feb55 100644
--- a/configs/microchip_sam9x60ek_mmc_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.04)/linux-linux4sam-2020.04.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sam9x60ek"
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index a2c4e29822..20b5dbb9f9 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -1,5 +1,5 @@
 BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.04)/linux-linux4sam-2020.04.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sam9x60ek"
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
index cebebaaea6..f49068584b 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
@@ -3,12 +3,12 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_wlsom1_ek"
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index f6895dd83b..555e823263 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_wlsom1_ek"
diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
index 5d0eac3250..5b7080dbb8 100644
--- a/configs/microchip_sama5d2_icp_mmc_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -3,12 +3,12 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama5d2_icp/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.10)/linux-linux4sam-2020.10.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 46e802f67b..84a0b1b375 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama5d2_icp/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam-2020.10)/linux-linux4sam-2020.10.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
