Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E379EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F1141860;
	Mon, 24 Jul 2023 19:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F1141860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDhOFfuMF9vl; Mon, 24 Jul 2023 19:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 196E641862;
	Mon, 24 Jul 2023 19:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196E641862
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 044811BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D13AE41855
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13AE41855
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjkSDMArtgqu for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:16:46 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48FBB41846
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FBB41846
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fd190065a7so38157025e9.2
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690226204; x=1690831004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7P8en46smQI84nGiH1F4o8v+SnMn/zvw+Cwg2sy9kc=;
 b=Lh7GHo1HDwZBnQobvCDw2O08qVqmJ7Uu/KUXnX6HKkTFCy5pSlhQ8ePMSI6BauzVlG
 nOvCp47wRVsO4u/+45Bsn6h41gBz4hurijgkBTH5b9QbxE3lqWeAA5Dv5uqKetCHIYob
 TF072vtf5FgwMRj3tEQH/9tdY3J0UtCb4uqmrmh9MsUPTa9dNGnU07/PqnI0G9r/uHaM
 Kg2YVXNjacl6D6BHLX5bypQRf4PMWP00zE/sLyvQQuuQVdtDVNAqHkmGEJcNRTYWiqTG
 SK6kehXQ50TRIK5EIHq2uMp8g1hzZWTevv/Zf7JeafZX6ffxTjyRj0tdDcN/qbQIjN9F
 Zt+A==
X-Gm-Message-State: ABy/qLbhK6YCSDJYJYoeVXSF+jRgZmmW5JlHDRJBSBuJV4/Ey4uv1yBQ
 UlK0c0GpCq3tq1c151WpJX6POzopMq258A==
X-Google-Smtp-Source: APBJJlG8LDeYjWvtUjW0QR+be6oTOnZJ0zlyL66WmZxJ1CNA9FsfrJSOmAR/9aCsK/DqiMliQ3CwoQ==
X-Received: by 2002:a05:600c:22c3:b0:3f9:b430:199b with SMTP id
 3-20020a05600c22c300b003f9b430199bmr8567859wmg.15.1690226203734; 
 Mon, 24 Jul 2023 12:16:43 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa973e6612sm13652513wml.44.2023.07.24.12.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:16:43 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:16:38 +0200
Message-ID: <20230724191638.637054-6-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690226204; x=1690831004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7P8en46smQI84nGiH1F4o8v+SnMn/zvw+Cwg2sy9kc=;
 b=dKRRcVsPZ0PDSWzY1iaA0CMjksDPeodCYsft1x0NKBz2kGVaoLp89E0GXn94skjLRy
 TaRrNgx0p6g1+uyjoYkTNh9ZdOsBNoLgKD9dz/wNtSyz9A85wppn8Rd4meK0HJXeQUig
 A2SGHErppHKoBlTEiUxA9i0ONUxS1SJ7HZQovc+3AzuCFFPEciyg2t6EuyZLgKdGcmx9
 s75MnB2a3uxs8pr19zyIYYi2KHFCHjkz3rxIR9fsaNI0HLuGFr3qyoY/VK+iSneb3dn+
 j6QOJOjbBDVm+csu3y1rr7zJJYmKEussmhcj1G/fnWEC6gab+AfFB89avSGMA6NisfGV
 7bOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dKRRcVsP
Subject: [Buildroot] [PATCH v2 5/5] Add
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, Charles Hardin <ckhardin@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
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
index ace0f6d6..7ebf15b6 100755
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
index d36f8291..c359ef60 100755
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
index 13d611b6..fe3f2659 100644
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
index 0c1913e2..087ddef8 100644
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
index 4932e62d..016f9739 100644
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
index 3452e8b0..55b6fb00 100644
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
index 41f84446..7abdd7eb 100644
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
