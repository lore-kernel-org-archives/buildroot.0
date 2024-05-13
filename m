Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D052C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306DB607A8;
	Mon, 13 May 2024 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhMIw9EcN2IZ; Mon, 13 May 2024 19:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782C360A6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782C360A6E;
	Mon, 13 May 2024 19:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5E2B1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBD2E8227C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOpTYqWUFe1z for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18EB682255
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18EB682255
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04CF9870EE; Mon, 13 May 2024 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:36:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19d12dffc4550aaec50b3d2ffcdc67746fff60f4
X-Git-Newrev: 22fd54b737d81ceb8b1cb0ccb0896c0b914b02cd
X-Patchwork-Hint: ignore
Message-Id: <20240513193617.04CF9870EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx93evk: Update to NXP
 lf-6.6.3-1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=22fd54b737d81ceb8b1cb0ccb0896c0b914b02cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update kernel, TF-A and U-Boot repos to the NXP lf-6.6.3-1.0.0 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx93evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index fa16967884..f30bafd9a2 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93evk/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.55-2.2.0)/linux-imx-lf-6.1.55-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.3-1.0.0)/linux-imx-lf-6.6.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.55-2.2.0)/imx-atf-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.3-1.0.0)/imx-atf-lf-6.6.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.55-2.2.0)/uboot-imx-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.3-1.0.0)/uboot-imx-lf-6.6.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
