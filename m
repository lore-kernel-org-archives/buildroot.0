Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CECEC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4898282065;
	Thu,  7 Sep 2023 14:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4898282065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncaYYKFwkgu1; Thu,  7 Sep 2023 14:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC4382039;
	Thu,  7 Sep 2023 14:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BC4382039
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19BAF1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B6A66123E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B6A66123E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAIiM9DaFsix for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B6256125D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B6256125D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 277AD86A27; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 19:34:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89d39912f9520ac542a5936574be434546cf3421
X-Git-Newrev: beb74069ef890a0874e06be98690949492d83f3a
X-Patchwork-Hint: ignore
Message-Id: <20230907145127.277AD86A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: add
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
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

commit: https://git.buildroot.net/buildroot/commit/?id=beb74069ef890a0874e06be98690949492d83f3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for the i.MX8DXL SoC from NXP, by adding a
new BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL and propagate its
support in the affected packages.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh    | 2 ++
 board/freescale/common/imx/post-image.sh                 | 2 ++
 package/freescale-imx/Config.in                          | 7 ++++++-
 package/freescale-imx/firmware-imx/Config.in             | 1 +
 package/freescale-imx/imx-sc-firmware/Config.in          | 3 ++-
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk | 4 ++++
 package/freescale-imx/imx-seco/Config.in                 | 6 ++++--
 7 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index ace0f6d610..7ebf15b6ff 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -63,6 +63,8 @@ main ()
 		dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
 		if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
 			${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	        elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
+			${HOST_DIR}/bin/mkimage_imx8 -soc DXL -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8dxl-evk-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 		else
 			${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 		fi
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index d36f82917e..c359ef6032 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -46,6 +46,8 @@ genimage_type()
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
 		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 13d611b696..fe3f265941 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -57,6 +57,10 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
+	bool "imx8dxl"
+
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
@@ -100,7 +104,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0c1913e227..087ddef877 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
 	default "imx6"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	bool
diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
index 4932e62dd2..016f9739bf 100644
--- a/package/freescale-imx/imx-sc-firmware/Config.in
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_IMX_SC_FIRMWARE
 	bool "imx-sc-firmware"
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	help
 	  System Control Unit Firmware blobs for the Freescale i.MX8
 	  SoCs.
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 3452e8b0eb..55b6fb00e3 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -25,6 +25,10 @@ define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
 	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL),y)
+define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
+	cp $(@D)/mx8dxl-evk-scfw-tcm.bin $(BINARIES_DIR)/
+endef
 else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
 define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp $(@D)/mx8qm-*-scfw-tcm.bin $(BINARIES_DIR)/
diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
index 41f8444651..7abdd7eb0d 100644
--- a/package/freescale-imx/imx-seco/Config.in
+++ b/package/freescale-imx/imx-seco/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_IMX_SECO
 	bool "imx-seco"
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	help
 	  Firmware file for the i.MX8 and i.MX8X Security Controller.
 
@@ -14,6 +15,7 @@ choice
 	prompt "i.MX Seco Firmware Release"
 	default BR2_PACKAGE_IMX_SECO_MX8QMB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default BR2_PACKAGE_IMX_SECO_MX8QXC0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	default BR2_PACKAGE_IMX_SECO_MX8DXLB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	help
 	  Select the appropriate ahab container image to install
 	  to match the iMX asics revision.
@@ -30,7 +32,7 @@ config BR2_PACKAGE_IMX_SECO_MX8DXLA1
 
 config BR2_PACKAGE_IMX_SECO_MX8DXLB0
 	bool "imx-seco-mx8dxlb0"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 config BR2_PACKAGE_IMX_SECO_MX8QMB0
 	bool "imx-seco-mx8qmb0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
