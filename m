Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8ACC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C3C8397F;
	Fri,  1 Mar 2024 13:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8hucwTh1NC3; Fri,  1 Mar 2024 13:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A6783935
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A6783935;
	Fri,  1 Mar 2024 13:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3AC1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 096AE41E06
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6nwDFjQoPfG for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9737B41C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9737B41C61
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9737B41C61
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso3197686a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300211; x=1709905011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJ71s/QGpP5X5lkEqyzORGQ2zPtVEnK+RIn+rQevEaE=;
 b=Gq+NiUEV3+gu1oJMPshiuGlnuBE5KsIwAeWc3lWvlbCSagxAB9MoQ/xysWX8EZlbOm
 +sR8bOQdwpT9/KyARKkk9WdRvmQ8i5rZ7Si+JEcsTIo1bGbhO/wCujw0tKyGIZRidJIf
 rx0GPJW3SDpz2MqPEXUJMVN8W+BrqmOw2h4PQwHCjg/We4VL+ARTR8C1R1pp2/RO+kko
 TyHG22cJUazCnfmROemWnuJf9Fms6eA0WTwcNzuLnrjPZXkMjmBwtm6Da3t2u+N6QpJI
 GBPUWOLRou5bk2wRlm7M1nycsLbHbK6L37a/Bd4VRPbZ5jMy7LAKyVqiVREVxJJ/Zvt/
 tzmA==
X-Gm-Message-State: AOJu0YzGJnv70WavprJHTzpBv03lf4hw0/oLr7Ko1wb3Tr1/TFcF/KFT
 KGLtH7PKYfORZ1FHnNSQZS+P5CeuGwxjeeZCwjX3MwEbdkDNN/QUUBbSPSiSod6WxDoC/Df08+W
 d4Sw=
X-Google-Smtp-Source: AGHT+IHdXVZstigw8HsvohZR9I5ayhb/KZyMECYHMhq1MQ5a3gAf4h+MmnwlIBIygpn5Ra46dSvdMA==
X-Received: by 2002:a50:cac7:0:b0:564:ded0:6072 with SMTP id
 f7-20020a50cac7000000b00564ded06072mr1306928edi.1.1709300211439; 
 Fri, 01 Mar 2024 05:36:51 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:20 +0100
Message-ID: <20240301133620.3547430-24-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300211; x=1709905011;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJ71s/QGpP5X5lkEqyzORGQ2zPtVEnK+RIn+rQevEaE=;
 b=jjCE/HiSwFTDBLM8RArywVczHaw5f17Z5ZmOyxiPYtgUyT8QfnyokG57gkcCmBPNcZ
 M32JFkprL01xBbT+R29QK0eOEi1cVVjLiLcgH8h02eHS9AKqfGjWTq9HUuDi2YWzm0MG
 rHaFPzpXnB8sCN7vwL/1ruEZb7N97qRgdIkmw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jjCE/HiS
Subject: [Buildroot] [PATCH v8 23/23] boot/ti-k3-image-gen: remove package
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

ti-k3-image-gen tool is deprecated an replaced by binman [1].

All defconfig that was using it have been updated to use U-boot
binman tool instead.

So, we can safely remove ti-k3-image-gen package.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235

Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 Config.in.legacy                          |  7 +++
 DEVELOPERS                                |  2 -
 boot/Config.in                            |  1 -
 boot/ti-k3-image-gen/Config.in            | 24 ----------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  3 --
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 54 -----------------------
 6 files changed, 7 insertions(+), 84 deletions(-)
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a869279af781..2b59a65f1c8f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_TARGET_TI_K3_IMAGE_GEN
+	bool "ti-k3-image-gen removed"
+	select BR2_LEGACY
+	help
+	  ti-k3-image-gen tool  has been removed and replaced by
+	  U-Boot binman tool (requires U-boot >= 2024.01).
+
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0bfe91f064a9..fb9555915ec1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -151,7 +151,6 @@ N:	Anand Gadiyar <gadiyar@ti.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
@@ -3219,7 +3218,6 @@ N:	Xuanhao Shi <X15000177@gmail.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad439e..87e1b7c00e35 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
-source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
deleted file mode 100644
index a57319f4be6d..000000000000
--- a/boot/ti-k3-image-gen/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_TARGET_TI_K3_IMAGE_GEN
-	bool "ti-k3-image-gen"
-	depends on BR2_TARGET_TI_K3_R5_LOADER
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	# We need FIT support in uboot-tools, which is why we select a
-	# host package
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
-	help
-	  Use TI's k3-image-gen to build a separate bare metal boot
-	  binary from a separate SPL that is running on the R5 core.
-
-	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
-
-if BR2_TARGET_TI_K3_IMAGE_GEN
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
-	string
-	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62AX
-	default "ti-fs"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM64X
-	default "ti-sci" if BR2_PACKAGE_TI_K3_SOC_AM65X
-
-endif
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
deleted file mode 100644
index c968c5648f71..000000000000
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  f89ea4b1f5c992455b1a682fde48359221b53f3294135df4bf20feea6aea90e4  k3-image-gen-08.06.00.007.tar.gz
-sha256  f012e8d000d711d0539e5b4c812fc1d3a59c10fc1e3d6ea155556f5b78286845  LICENSE
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
deleted file mode 100644
index aca29bcf1bd4..000000000000
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# ti-k3-image-gen
-#
-################################################################################
-
-TI_K3_IMAGE_GEN_VERSION = 08.06.00.007
-TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
-TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
-TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
-TI_K3_IMAGE_GEN_LICENSE_FILES = LICENSE
-TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
-
-# - ti-k3-image-gen is used to build tiboot3.bin, using the
-#   r5-u-boot-spl.bin file from the ti-k3-r5-loader package. Hence the
-#   dependency on ti-k3-r5-loader.
-# - the ti-k3-image-gen makefiles seem to need some feature from Make
-#   v4.0, similar to u-boot.
-TI_K3_IMAGE_GEN_DEPENDENCIES = \
-	host-arm-gnu-toolchain \
-	host-python3 \
-	host-openssl \
-	host-uboot-tools \
-	ti-k3-r5-loader \
-	ti-k3-boot-firmware \
-	$(BR2_MAKE_HOST_DEPENDENCY)
-
-TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
-TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
-TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
-
-TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
-
-define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
-	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
-endef
-
-define TI_K3_IMAGE_GEN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) \
-	$(BR2_MAKE) -C $(@D) \
-		SOC=$(TI_K3_IMAGE_GEN_SOC) \
-		SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
-		CONFIG=evm \
-		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
-		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
-		O=$(@D)/tmp \
-		BIN_DIR=$(@D)
-endef
-
-define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
-	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
-endef
-
-$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
