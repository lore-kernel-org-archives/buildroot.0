Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430A7C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA48183C25;
	Wed,  7 Feb 2024 16:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9FP0sSkYVJ9; Wed,  7 Feb 2024 16:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC6183C1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CC6183C1D;
	Wed,  7 Feb 2024 16:26:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2F31BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 794BD401D1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6BheeZHXu86 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66391401CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66391401CB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:26:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C21F8763F; Wed,  7 Feb 2024 16:26:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:24:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b33d7a47dd41fed5364a398320c2b7d0687ba5e
X-Git-Newrev: 98a49edda69e868c95bd8cf4e923eb0bd0a65ff7
X-Patchwork-Hint: ignore
Message-Id: <20240207162621.5C21F8763F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: drop redundant configuration for
 no MMU platforms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98a49edda69e868c95bd8cf4e923eb0bd0a65ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package/busybox/busybox-minimal.config is the default configuration
for MMU-less systems, so the setting is redundant and can be removed
without effect.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/canaan_kd233_defconfig            | 1 -
 configs/imxrt1050-evk_defconfig           | 3 ---
 configs/qemu_m68k_mcf5208_defconfig       | 3 ---
 configs/qemu_riscv64_nommu_virt_defconfig | 3 ---
 configs/qemu_xtensa_lx60_nommu_defconfig  | 3 ---
 configs/sipeed_maix_bit_defconfig         | 1 -
 configs/sipeed_maix_bit_sdcard_defconfig  | 1 -
 configs/sipeed_maix_dock_defconfig        | 1 -
 configs/sipeed_maix_dock_sdcard_defconfig | 1 -
 configs/sipeed_maix_go_defconfig          | 1 -
 configs/sipeed_maix_go_sdcard_defconfig   | 1 -
 configs/sipeed_maixduino_defconfig        | 1 -
 configs/sipeed_maixduino_sdcard_defconfig | 1 -
 configs/stm32f429_disco_xip_defconfig     | 1 -
 configs/stm32f469_disco_sd_defconfig      | 1 -
 configs/stm32f469_disco_xip_defconfig     | 1 -
 configs/stm32f769_disco_sd_defconfig      | 1 -
 17 files changed, 25 deletions(-)

diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 3335195f25..672fee57a1 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 947abe5df2..b493c11098 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -23,9 +23,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 
-# NOMMU Busybox
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index e35f3546fe..0c95756a8e 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -29,9 +29,6 @@ BR2_LINUX_KERNEL_VMLINUX=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
-# use minimal busybox with hush and networking tools
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 2a0aea01d7..9999bcf7f3 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -6,9 +6,6 @@ BR2_RISCV_64=y
 # Linux headers same as kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
-# Busybox with hush
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # System
 BR2_TARGET_GENERIC_GETTY=y
 
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index c3224576f7..d1d59b9525 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -4,9 +4,6 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 # BR2_XTENSA_USE_MMU is not set
 
-# Use minimal busybox with hush and networking tools
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 03ae57e1b7..e45996879a 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 720d216920..7e293e5a49 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index 045967f589..0352382fcd 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index eb7294d559..20658813ba 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index c320d19703..27272dac4c 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index d2392ba822..1bc12dd058 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index ba83dd76ee..3e04ea3a04 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -29,7 +29,6 @@ BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 
 # Packages
 BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 09bc1b4ab1..253ee7d7cf 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -31,7 +31,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 
 # Packages
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index d4e000487a..99ae8cc753 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 8b10bc6741..66840a7742 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index e362a99851..6e6ead0fde 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 2ae27fb2d8..725c985ec0 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -13,7 +13,6 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
