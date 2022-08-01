Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B9C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF4C9400C7;
	Mon,  1 Aug 2022 21:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF4C9400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2cppIvKnhWm; Mon,  1 Aug 2022 21:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8E31400B9;
	Mon,  1 Aug 2022 21:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E31400B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40F6E1BF319
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25457400B9
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25457400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILpzCrD7gc5s for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:06:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24923400AC
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24923400AC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BF33D86C64; Mon,  1 Aug 2022 20:52:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 23:06:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bf4575036183a049c22fe9be124da43cbf200b8
X-Git-Newrev: b265fa5c7f2257c51b0ff363c2ff017b2e91d680
X-Patchwork-Hint: ignore
Message-Id: <20220801205258.BF33D86C64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mpico: bump bsp components to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b265fa5c7f2257c51b0ff363c2ff017b2e91d680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those components are aligned with NXP BSP lf-5.10.72-2.2.0.

This commit also refresh the readme.txt file:
- update no longer working URLs,
- enhance flashing instructions (use ${mmcdev} uboot variable),
- add "bs=1M" option to dd for better flashing performances.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800735

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/technexion/imx8mpico/readme.txt | 18 +++++++++++-------
 configs/imx8mpico_defconfig           |  9 +++++----
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/board/technexion/imx8mpico/readme.txt b/board/technexion/imx8mpico/readme.txt
index 1a04e44572..c20bfc0f44 100644
--- a/board/technexion/imx8mpico/readme.txt
+++ b/board/technexion/imx8mpico/readme.txt
@@ -45,7 +45,7 @@ J2: jumper on pins 2 and 4.
 
 In case the board was flashed with a wrong u-boot, or the eMMC is
 erased, u-boot can be loaded by USB Serial Download boot mode, using
-imx-usb-loader. See [3] and [4].
+imx-usb-loader. See [3].
 
 For flashing:
 - Plug the micro USB cable from the Debug USB Port, to your computer
@@ -53,9 +53,13 @@ For flashing:
 
 In the U-Boot prompt launch:
 
-=> ums 0 mmc 0
+=> ums 0 mmc ${mmcdev}
 
 This will mount the eMMC content in the host PC as a mass storage device.
+Note: the ${mmcdev} id may change from one uboot version to another. The
+actual id can be confirmed by running commands "mmc rescan" then
+"mmc list", to find the eMMC entry. Finally it's possible to enter
+directly the mmc device id, for example: "ums 0 mmc 2".
 
 To determine the device associated to the eMMC card have a look in the
 /proc/partitions file:
@@ -69,12 +73,13 @@ Buildroot prepares a bootable "sdcard.img" image in the output/images/
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
@@ -90,6 +95,5 @@ To boot your newly created system:
 Enjoy!
 
 [1]. https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX8M
-[2]. https://www.technexion.com/products/system-on-modules/pico-evaluation-kits/detail/PICO-PI-IMX8M-BASIC
-[3]. https://www.technexion.com/support/knowledgebase/boot-configuration-settings-for-pico-baseboards/
-[4]. https://www.technexion.com/support/knowledgebase/loading-bootable-software-images-onto-the-emmc-of-picosom-on-pico-pi/
+[2]. https://www.technexion.com/products/system-on-modules/evk/pico-pi-imx8m/
+[3]. https://developer.technexion.com/docs/pico-evaluation-kit-boot-mode-settings#picoimx8m-and-picoimx8mmini
diff --git a/configs/imx8mpico_defconfig b/configs/imx8mpico_defconfig
index 5478f267fc..55746fb67e 100644
--- a/configs/imx8mpico_defconfig
+++ b/configs/imx8mpico_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-pico-pi.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,9146d4dcb2dda0c7614f74f824cfb20d29bd85f8)/linux-9146d4dcb2dda0c7614f74f824cfb20d29bd85f8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-hardknott_5.10.72-2.2.0_20220207)/linux-tn-im-tn-hardknott_5.10.72-2.2.0_20220207.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-pico-pi freescale/imx8mq-pico-pi-dcss-ili9881c"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
 BR2_PACKAGE_FIRMWARE_IMX=y
@@ -18,13 +19,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.72-2.2.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,9a070a5b4460124054bc459edfc9d1b43e5403bb)/u-boot-edm-9a070a5b4460124054bc459edfc9d1b43e5403bb.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-hardknott_5.10.72-2.2.0_20220207)/u-boot-tn-imx-tn-hardknott_5.10.72-2.2.0_20220207.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mq"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
