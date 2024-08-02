Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F277C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D62612FE;
	Fri,  2 Aug 2024 21:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4Tmcbj-rC8Y; Fri,  2 Aug 2024 21:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54DB60744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54DB60744;
	Fri,  2 Aug 2024 21:42:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCE11BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7745340372
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKYDr4Vt1SFT for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9ECC40353
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9ECC40353
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:42:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3B3E83C55; Fri,  2 Aug 2024 21:42:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:42:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1941fe3d82236f4b4e92eedf6e7f7a34db70016e
X-Git-Newrev: fb974003c136f7e0eea6bea057011db55fa922c0
X-Patchwork-Hint: ignore
Message-Id: <20240802214239.D3B3E83C55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mn_bsh_smm_s2[_pro]: bump TF-A,
 U-Boot and Linux versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb974003c136f7e0eea6bea057011db55fa922c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps:

  - TF-A to version v2.10
  - U-Boot to versione v2024.07
  - Linux kernel to version 6.10

The TF-A bump required applying a patch, sent upstream, to fix a
regression in the domain access permissions configuration for the boot
console UART.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x8m-drop-UARTs-domain-permissions-setting.patch | 65 ++++++++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 .../imx8mn-bsh-smm-s2/patches/linux/linux.hash     |  2 +-
 .../imx8mn-bsh-smm-s2/patches/uboot/uboot.hash     |  2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                |  8 +--
 configs/imx8mn_bsh_smm_s2_pro_defconfig            |  8 +--
 6 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch
new file mode 100644
index 0000000000..74b12df38d
--- /dev/null
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch
@@ -0,0 +1,65 @@
+From 0d12fc41d6c68b257de1610a1511144d731f9af4 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 24 Jul 2024 10:46:49 +0200
+Subject: [PATCH] fix(imx8m): drop UARTs domain permissions setting
+
+The commit d76f012ea8fc0 ("refactor(imx8m): replace magic number with
+enum type") also hardcodes the domain permissions configuration for the
+UARTs, causing a regression for any board using a boot console different
+from UART2. Indeed, previously, the RDC_PDAP_UARTn registers were set to
+the reset value (0xff), meaning all domains were enabled for read and
+write access.
+
+This patch partially reverts that commit to fix the regression.
+
+Fixes: d76f012ea8fc0 ("refactor(imx8m): replace magic number with enum type")
+Change-Id: I2670bf485372f32ef45cebb72a7694a9a800f417
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/30131
+---
+ plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c | 2 --
+ plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c | 2 --
+ plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c | 1 -
+ 3 files changed, 5 deletions(-)
+
+diff --git a/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c b/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c
+index f6e46eb67bc9..539df931a6a4 100644
+--- a/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c
++++ b/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c
+@@ -67,8 +67,6 @@ static const struct imx_rdc_cfg rdc[] = {
+ 	RDC_MDAn(RDC_MDA_M4, DID1),
+ 
+ 	/* peripherals domain permission */
+-	RDC_PDAPn(RDC_PDAP_UART4, D1R | D1W),
+-	RDC_PDAPn(RDC_PDAP_UART2, D0R | D0W),
+ 
+ 	/* memory region */
+ 
+diff --git a/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c b/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c
+index befa7698f912..604ef3cae6dc 100644
+--- a/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c
++++ b/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c
+@@ -53,8 +53,6 @@ static const struct imx_rdc_cfg rdc[] = {
+ 	RDC_MDAn(RDC_MDA_M7, DID1),
+ 
+ 	/* peripherals domain permission */
+-	RDC_PDAPn(RDC_PDAP_UART4, D1R | D1W),
+-	RDC_PDAPn(RDC_PDAP_UART2, D0R | D0W),
+ 
+ 	/* memory region */
+ 	RDC_MEM_REGIONn(16, 0x0, 0x0, 0xff),
+diff --git a/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c b/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c
+index ffad3d159e59..5251c28e6ba8 100644
+--- a/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c
++++ b/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c
+@@ -54,7 +54,6 @@ static const struct imx_rdc_cfg rdc[] = {
+ 	RDC_MDAn(RDC_MDA_M7, DID1),
+ 
+ 	/* peripherals domain permission */
+-	RDC_PDAPn(RDC_PDAP_UART2, D0R | D0W),
+ 
+ 	/* memory region */
+ 
+-- 
+2.43.0
+
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 80e592dab6..02714d06a0 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fc4cdac7c08fc398b6d4b705285dc13ac2d2b30a7449c6f07e9ccd81207241df  arm-trusted-firmware-v2.5.tar.gz
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index b017ef2a89..53eb143894 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3e4d8e561da5703a205ae8d7b2bed6c5c64fc4299eebcbfd20481e63b57d5ee3  linux-6.1.6.tar.xz
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 7cef5b688e..fe9b4f53dc 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 841512ed1a..2b358cf57b 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,14 +22,14 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index b4553ceb52..e903cbf314 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
