Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E994DC19F2A
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 20:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B14D408BC;
	Sat, 30 Jul 2022 20:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B14D408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Etsu3dj7Jg5o; Sat, 30 Jul 2022 20:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A38340489;
	Sat, 30 Jul 2022 20:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A38340489
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCAEF1BF290
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 20:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1C4D60E61
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 20:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1C4D60E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7o922bdNClZy for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 20:37:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43AD160E4D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43AD160E4D
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 20:37:23 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.40.217])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9A1CA2003DC;
 Sat, 30 Jul 2022 22:37:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 22:37:10 +0200
Message-Id: <20220730203711.439923-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659213439;
 bh=yhBYdNROrf/JJe0HEOPXSpGzUfOCWEvFDX+olhsamuE=;
 h=From:To:Cc:Subject:Date:From;
 b=l9jUNFnQe3hjIP1mMlGgtE4i875/4V7hiWTZkyWLIlxmCnTblTy4qFmYGmRIfwWAB
 1kFYLQER7UUN38n63wVun9ya6DZwZUUB8pwuPUFxwlZwBP9f+9pi+wPxyhx0LCiHY6
 DuuFIWl4B5xOvGhYYC9jG2vA3thHkLPVCsHa1f3hiRtq8+fb/5t4ORswusRC92ndKg
 JGB73weLhFvquqqMsI/2zQRAfCfNKSAscUTDQZJLzn8jdMndjCXl0sWRVpohPGB944
 WuyXsCmMvySnVFFJk+85bG9asUQDruN/tPGUwXAjwg6KRex1c5sBWZXOLFMPr+azNS
 JIWty+HLoGo6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l9jUNFnQ
Subject: [Buildroot] [PATCH 1/2] configs/imx8mmpico: bump bsp components to
 version tn-hardknott_5.10.72-2.2.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those components are aligned with NXP BSP lf-5.10.72-2.2.0.

This commit also refresh the readme.txt file:
- update no longer working URLs,
- enhance flashing instructions (use ${mmcdev} uboot variable),
- add "bs=1M" option to dd for better flashing performances.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800730

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/technexion/imx8mmpico/readme.txt | 18 +++++++++++-------
 configs/imx8mmpico_defconfig           | 11 ++++++-----
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/board/technexion/imx8mmpico/readme.txt b/board/technexion/imx8mmpico/readme.txt
index 3095d67b2c..56a8c9bdfe 100644
--- a/board/technexion/imx8mmpico/readme.txt
+++ b/board/technexion/imx8mmpico/readme.txt
@@ -46,7 +46,7 @@ J2: jumper on pins 2 and 4.
 
 In case the board was flashed with a wrong u-boot, or the eMMC is
 erased, u-boot can be loaded by USB Serial Download boot mode, using
-imx-usb-loader. See [3] and [4].
+imx-usb-loader. See [3].
 
 For flashing:
 - Plug the micro USB cable from the Debug USB Port, to your computer
@@ -54,9 +54,13 @@ For flashing:
 
 In the U-Boot prompt launch:
 
-=> ums 0 mmc 1
+=> ums 0 mmc ${mmcdev}
 
 This will mount the eMMC content in the host PC as a mass storage device.
+Note: the ${mmcdev} id may change from one uboot version to another. The
+actual id can be confirmed by running commands "mmc rescan" then
+"mmc list", to find the eMMC entry. Finally it's possible to enter
+directly the mmc device id, for example: "ums 0 mmc 2".
 
 To determine the device associated to the eMMC card have a look in the
 /proc/partitions file:
@@ -70,12 +74,13 @@ Buildroot prepares a bootable "sdcard.img" image in the output/images/
 directory, ready to be dumped on the eMMC. Launch the following
 command as root:
 
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+  dd bs=1M if=output/images/sdcard.img of=/dev/<your-sd-device>
 
 *** WARNING! This will destroy all the eMMC content. Use with care! ***
 
 This operation can take several minutes, depending on the image
-size. When tested, a 2MB/s transfer rate was observed.
+size. When tested, a 10MB/s transfer rate was observed. Note: the
+blocksize "bs=1M" parameter gives better transfer performances.
 
 For details about the medium image layout, see the definition in
 board/freescale/common/imx/genimage.cfg.template.
@@ -91,6 +96,5 @@ To boot your newly created system:
 Enjoy!
 
 [1]. https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX8M-MINI
-[2]. https://www.technexion.com/products/pico-evaluation-kits/detail/PICOPIIMX8MM1GDEV
-[3]. https://www.technexion.com/support/knowledgebase/boot-configuration-settings-for-pico-baseboards/
-[4]. https://www.technexion.com/support/knowledgebase/loading-bootable-software-images-onto-the-emmc-of-picosom-on-pico-pi/
+[2]. https://www.technexion.com/products/system-on-modules/evk/pico-pi-imx8m-mini/
+[3]. https://developer.technexion.com/docs/recover-to-factory-settings-pico-imx8m-mini
diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index f04946a8d1..7c19c8c81b 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-pico-pi.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,9146d4dcb2dda0c7614f74f824cfb20d29bd85f8)/linux-9146d4dcb2dda0c7614f74f824cfb20d29bd85f8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-hardknott_5.10.72-2.2.0_20220207)/linux-tn-im-tn-hardknott_5.10.72-2.2.0_20220207.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-pico-pi freescale/imx8mm-pico-pi-ili9881c freescale/imx8mm-pico-pi-sn65dsi84-hj070na"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-pico-pi freescale/imx8mm-pico-pi-ili9881c"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
 BR2_PACKAGE_FIRMWARE_IMX=y
@@ -18,13 +19,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.72-2.2.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,9a070a5b4460124054bc459edfc9d1b43e5403bb)/u-boot-edm-9a070a5b4460124054bc459edfc9d1b43e5403bb.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-hardknott_5.10.72-2.2.0_20220207)/u-boot-tn-imx-tn-hardknott_5.10.72-2.2.0_20220207.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
