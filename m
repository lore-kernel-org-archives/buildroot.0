Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0A1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8986460F1A;
	Wed, 13 Dec 2023 16:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8986460F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOPTTXZY2VX6; Wed, 13 Dec 2023 16:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD69F61166;
	Wed, 13 Dec 2023 16:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD69F61166
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B66221BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D12460ED1
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D12460ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ij6ux7enm9Bj for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:19 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 584E2607D6
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584E2607D6
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55226029d17so1089803a12.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485797; x=1703090597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vSHa95Y+hyYJW6mEjmZQWjX0vbe4isiHm4HPq5W984=;
 b=aH5h0xB3PsgP4n7Mtg0wMEuitlHAHejQ+gPJn9a6FD+HR4o5QJSnVbpT1sXLMWba+d
 ExeSrZtKS9Phii/BfD34Azw+PMFNdr5QjTWh+kpSjMD0Z9NMEl9l/8M0ryd7LjhZf+cA
 H2lIGFMAAW70zwuDGd3dycKO/akzK8aRaJ/+0dMW90wHuTTvdCtzZOPU7PnQNdkKqwpT
 pBqAkVRm7IpA/S/X1da3NSknqEtfx2ktEpvesOyZGoR57aq3m2YuIBXvpxvN4jsUsdbY
 Bkywmgq+ZeYlMPvCLnDnkgPRPCGd79U7G3DREzb+TsPt+WPsLnRfXUj6SpMia1TBf7Cx
 2qYA==
X-Gm-Message-State: AOJu0YyyZZjhTZQX+FgQ0pQPJcOcEGx24eDaxHeSM1fjqMhBpjeOV5Ug
 mNqqW2WtaC5ySfvReOs5ANX7oYzVKXtW5rAbSOYwmw==
X-Google-Smtp-Source: AGHT+IHL+sUpIO+PV7+A4TI/XKsyqbz8luwwo4dors9z+TmXcQynVYoAzFv/f3JzbD4buKHa7Lbaqw==
X-Received: by 2002:a17:907:72cb:b0:a18:2e1c:f004 with SMTP id
 du11-20020a17090772cb00b00a182e1cf004mr4817632ejc.31.1702485796987; 
 Wed, 13 Dec 2023 08:43:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:02 +0100
Message-ID: <20231213164311.4180059-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485797; x=1703090597;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vSHa95Y+hyYJW6mEjmZQWjX0vbe4isiHm4HPq5W984=;
 b=mNVl837XV/nDNwlMyWu14+qgRu05ZffBE6elyZ8cY+vwopnUey8Lb5+GIRA5z2xmWG
 0Bl/7dsbKVepRVMXL1gcF4ATqFb5jyU6ae+4v9LCHFa3kbxjwrfzoWRImfC11bnE62cv
 iY2BvltuH0scEb8CifPLHrV48AAUabZyVH3qs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mNVl837X
Subject: [Buildroot] [PATCH v2 02/11] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch sets the configurations required by TI HS systems. Some of these
configurations (i. e. HS SYSFW image signing key, HS Software Revision)
are provided by the ti-k3-core-secdev package in the binaries directory.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-image-gen/Config.in          |  1 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
index d76cef82e911..38d1598d9fc0 100644
--- a/boot/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3-image-gen/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	bool "ti-k3-image-gen"
 	depends on BR2_TARGET_TI_K3_R5_LOADER
 	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS || BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
 	# We need FIT support in uboot-tools, which is why we select a
 	# host package
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
index 64be9a18f2c4..91aed63bab84 100644
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -29,10 +29,21 @@ TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
 TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
 TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
 
-TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
+ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP),y)
+TI_K3_IMAGE_GEN_SYSFW = \
+	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
+else
+TI_K3_IMAGE_GEN_DEPENDENCIES += ti-k3-core-secdev
+
+TI_K3_IMAGE_GEN_SYSFW = \
+	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE)-enc.bin \
+	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE)-cert.bin
+endif
 
 define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
-	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
+	$(foreach t,$(TI_K3_IMAGE_GEN_SYSFW),\
+		cp $(BINARIES_DIR)/ti-sysfw/$(t) $(@D)/
+	)
 endef
 
 define TI_K3_IMAGE_GEN_BUILD_CMDS
@@ -40,6 +51,7 @@ define TI_K3_IMAGE_GEN_BUILD_CMDS
 	$(BR2_MAKE) -C $(@D) \
 		SOC=$(TI_K3_IMAGE_GEN_SOC) \
 		SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
+		TI_SECURE_DEV_PKG=$(BINARIES_DIR) \
 		CONFIG=evm \
 		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
