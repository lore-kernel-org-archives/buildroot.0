Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6198C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670C041602;
	Tue, 11 Jan 2022 21:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvkvp7GJ8lDl; Tue, 11 Jan 2022 21:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B46415FB;
	Tue, 11 Jan 2022 21:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96B561BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91440408FE
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkU0WQkkd2Ik for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A6524016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:17:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso2240853wmc.3
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 13:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+Z33/IEjdwQfLMcCEHbqkuBzN2CprlGWzununhX8cw=;
 b=XEtJetQn1ZoLHbtxwN9C7IkY3Jfr3yihJOZmuPpmM+Cozy8pQ1L/8y8ssRBRUlFevU
 pdqwSopC+LcIi/jSOu3DBY9hYjWkCe7MU+9zcL6BM1DOW12pGw5WQcRhQHFCEIAwu/iC
 7TXEcLzkcbQTmmShgfgdQ/ofqTvajGDRJlCK/5YmSPwwlXnLHuVE9srnGGl07rNUzj3o
 3x0B6jQhATKHz2YEp57sbHOlYlx2IOG+7XaGnUp0jZEbv2u3LtpkxwHRj/xqCgazWPyU
 4a/zKW8Dvi8bIyBl9m51+tbcUKlZYCdbUlSFDa0aVL6UiSyzaI1F+GeBtZc71j2KIkgB
 r4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=n+Z33/IEjdwQfLMcCEHbqkuBzN2CprlGWzununhX8cw=;
 b=BdbMAgayMRoGzZDM0hzyIG0vgNt5GPaAEN44xG4yfWRsIizb5RLXogHIy1NHAWhKnk
 dXo6lcaf6R7eN6byp0S33twZuRBwbTiRbNxliA4fME6SAv9kgFnV0zrj4k6+r2RhG1XQ
 Sm+LHNxiDe4XzXziKPaxeUarMiVQFE7VAHKRO1iiO+COkH8CqsDVXVpaGluRylovQV36
 mQ2UMtoA2d5bnItN5yAFiVbKAAYdHQGOjvVBsdd9Ywev3mVoRpSq+tDtGq8yoornXRYW
 Lh86aIbY0tHJ+rQMaQHr5HlCKYS27GjB90fnc6znU0f0uSWbFhl5xIGoHO9hTCwqF7zO
 Y8Cg==
X-Gm-Message-State: AOAM531vGUuntEowyPB8mPO2qvM9JWV44pEHE+twe3YD3Nq6uF5FzsEM
 rex/NpxHpPM++gfHk51xpJbI04b+SbI=
X-Google-Smtp-Source: ABdhPJx4lctFoKeXe3aPouZLoh2KzFzFnUYfi9GmbVdieOBCM1GShNkKsrh7Xtj0Kmqtp9VLgqATzA==
X-Received: by 2002:a05:600c:a54:: with SMTP id
 c20mr3991575wmq.48.1641935833517; 
 Tue, 11 Jan 2022 13:17:13 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4de3:3dd8:1079:d363])
 by smtp.gmail.com with ESMTPSA id n11sm2700361wmr.26.2022.01.11.13.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 13:17:13 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:17:08 +0100
Message-Id: <20220111211708.517341-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zynq-boot-bin: drop legacy package
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 6dd5a33c485c (zynq_zed: bump U-Boot to xilinx-v2016.2), we
have no in-tree users of zynq-boot-bin.py, as U-Boot has since v2016.01
been able to natively generate Xilinx images.

zynq-boot-bin.py is python2-only and there is zero chance that upstream
will move it to python3. WE could carry a pytohn3-compatible copy, but
that tool is now virtually unused.

6 years have passed now; let it rest in peace at last.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 Config.in.legacy                         |  7 +++++++
 boot/uboot/Config.in                     | 12 ------------
 boot/uboot/uboot.mk                      | 11 -----------
 package/zynq-boot-bin/zynq-boot-bin.hash |  2 --
 package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ----------------------
 5 files changed, 7 insertions(+), 47 deletions(-)
 delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
 delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b3e8d5a6d8..16d5ac40b3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_TARGET_UBOOT_ZYNQ_IMAGE
+	bool "Generate image for Xilinx Zynq"
+	select BR2_LEGACY
+	help
+	  Since 2016.1, U-Boot can natively generate the Zynq boot image,
+	  and so the Xilinx-specific format and tools have been removed.
+
 config BR2_KERNEL_HEADERS_5_14
 	bool "kernel headers version 5.14.x are no longer supported"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c630fc6552..1fd4dede92 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -455,18 +455,6 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
 	  MLO on OMAP and SPL on i.MX6 for example.
 
-config BR2_TARGET_UBOOT_ZYNQ_IMAGE
-	bool "Generate image for Xilinx Zynq"
-	depends on BR2_arm
-	depends on BR2_TARGET_UBOOT_SPL
-	depends on BR2_TARGET_UBOOT_FORMAT_DTB_IMG
-	help
-	  Generate the BOOT.BIN file from U-Boot's SPL. The image
-	  boots the Xilinx Zynq chip without any FPGA bitstream.
-	  A bitstream can be loaded by the U-Boot. The SPL searchs
-	  for u-boot-dtb.img file so this U-Boot format is required
-	  to be set.
-
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
 	depends on BR2_aarch64
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 574fc7089a..a61d1c8135 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -432,17 +432,6 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
-define UBOOT_GENERATE_ZYNQ_IMAGE
-	$(HOST_DIR)/bin/python2 \
-		$(HOST_DIR)/bin/zynq-boot-bin.py \
-		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
-		-o $(BINARIES_DIR)/BOOT.BIN
-endef
-UBOOT_DEPENDENCIES += host-zynq-boot-bin
-UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
 ifeq ($(BR2_TARGET_UBOOT_SPL),y)
 UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
diff --git a/package/zynq-boot-bin/zynq-boot-bin.hash b/package/zynq-boot-bin/zynq-boot-bin.hash
deleted file mode 100644
index 0bc23de197..0000000000
--- a/package/zynq-boot-bin/zynq-boot-bin.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://raw.githubusercontent.com/Xilinx/u-boot-xlnx
-sha1	940331ee02b0007099effa61e382fe7ea4174054	zynq-boot-bin.py
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
deleted file mode 100644
index deba5f4096..0000000000
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# zynq-boot-bin
-#
-################################################################################
-
-ZYNQ_BOOT_BIN_VERSION = 2015.1
-ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
-ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/xilinx-v$(ZYNQ_BOOT_BIN_VERSION)/tools
-ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
-
-HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
-
-define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
-	cp $(HOST_ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
-endef
-
-define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/bin/$(ZYNQ_BOOT_BIN_SOURCE)
-endef
-
-$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
