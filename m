Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A9C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C2C83F63;
	Sat, 17 Feb 2024 16:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0CDXDQgIvG8; Sat, 17 Feb 2024 16:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D36B83F3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D36B83F3B;
	Sat, 17 Feb 2024 16:03:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF4631BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6B5F4076E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsq3x0oQjpDq for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EB3D4076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB3D4076A
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EB3D4076A
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56399fb02b3so3703384a12.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185801; x=1708790601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxHuKzo6ZR/Q9Kv9kJm/EEGNy0GjIlHEj4XhFg3le+k=;
 b=VSh5Ed4GesV5lsJgi783hb6lTG3JHpwQakHBMcpWYVzyGxHcztLqgu5IBpCd3DN/67
 uSKuQQEoQW/RBc1CwSi/iclqgXO8yP4gmM+xqH2mE2XOLlWyEXZaVG8WyLgszzmxrY3G
 9hA/JGQ+u5GvS8TL5Hk17a8Kl0Xg4PD0C++lUDGfLH0W4nrwR4/hypACQAAu831uzG48
 wZodBrDF4cEU+CI9S3ErAwihPaoL//bTP0btBr2idBaInRy8R3ZnZtHl5kDMlVNbHpPI
 jSSICzyJ9Eu+ZNB09dB+jk5xKYEZsmz6FFtjJ1ZLNmdaTSvevG3Zf33rTIKMseCBY1uG
 erLA==
X-Gm-Message-State: AOJu0YxfryKi4BquusBBWzgiVkaWe0XxFJwxsEOHdOBfGK2H4V6/jVwh
 JSY3G0ydjZEDrs7s+NveRYEoPZOsOjF8Dt0oYIf2JEFjepu35tHerY9F1M69VKkzA71P4PJed7o
 NMog=
X-Google-Smtp-Source: AGHT+IHyFblnUh4PndUZoHldA8F7F7F/Md/QaqoOSPOmA/me+FWT1xFt1DvuC2UP4imIdaP1Y5+SwA==
X-Received: by 2002:a50:cd58:0:b0:563:e5e0:85e1 with SMTP id
 d24-20020a50cd58000000b00563e5e085e1mr3869379edj.25.1708185801600; 
 Sat, 17 Feb 2024 08:03:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:42 +0100
Message-ID: <20240217160244.1320482-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185801; x=1708790601;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxHuKzo6ZR/Q9Kv9kJm/EEGNy0GjIlHEj4XhFg3le+k=;
 b=NhgJypa5M4ryoiQofb49QHvEi6uu5ICPTZCIrfE7dmLXjb9tajVhQpRf5DEEO5Q63y
 IuXijERDigrZ/oONsRK8GhEVsyhJtkWttCsH3Yaqe1uAufgUzPZv1fl8KzZCuhlIURyl
 pR1LqxzmSmLggR+/XNV+wCMHl78CK2z/WsUy0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NhgJypa5
Subject: [Buildroot] [PATCH v4 18/20] boot/ti-k3: move TI_K3_{SECTYPE,
 SOC} out of the image-gen scope
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

Recent versions of U-Boot can use Binman to compile and sign the generated
binaries, thus making the use of custom tools like ti-k3-image-gen no
longer necessary. In ti-k3-image-gen, options such as SECTYPE and SOC were
configured and used outside of it. This patch allows setting such options
even if the package is not enabled.

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3/Config.in                          | 46 ++++++++++++++
 boot/ti-k3/ti-k3-image-gen/Config.in          | 63 ++-----------------
 boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk |  6 +-
 boot/uboot/Config.in                          |  7 +--
 configs/ti_am62x_sk_defconfig                 |  2 +-
 configs/ti_am64x_sk_defconfig                 |  2 +-
 6 files changed, 59 insertions(+), 67 deletions(-)

diff --git a/boot/ti-k3/Config.in b/boot/ti-k3/Config.in
index 06dda2f156a9..9e508326c9c8 100644
--- a/boot/ti-k3/Config.in
+++ b/boot/ti-k3/Config.in
@@ -5,6 +5,52 @@ config BR2_TARGET_TI_K3
 
 if BR2_TARGET_TI_K3
 
+choice
+	prompt "SoC family"
+
+config BR2_TARGET_TI_K3_SOC_AM62AX
+	bool "am62ax"
+
+config BR2_TARGET_TI_K3_SOC_AM62X
+	bool "am62x"
+
+config BR2_TARGET_TI_K3_SOC_AM64X
+	bool "am64x"
+
+config BR2_TARGET_TI_K3_SOC_AM65X
+	bool "am65x"
+
+endchoice
+
+choice
+	prompt "Security type"
+	help
+	  The target SoC security type option.
+
+config BR2_TARGET_TI_K3_SECTYPE_GP
+	bool "gp"
+
+config BR2_TARGET_TI_K3_SECTYPE_HS_FS
+	bool "hs-fs"
+
+config BR2_TARGET_TI_K3_SECTYPE_HS
+	bool "hs"
+
+endchoice
+
+config BR2_TARGET_TI_K3_SOC
+	string
+	default "am62ax" if BR2_TARGET_TI_K3_SOC_AM62AX
+	default "am62x"  if BR2_TARGET_TI_K3_SOC_AM62X
+	default "am64x"  if BR2_TARGET_TI_K3_SOC_AM64X
+	default "am65x"  if BR2_TARGET_TI_K3_SOC_AM65X
+
+config BR2_TARGET_TI_K3_SECTYPE
+	string
+	default "gp"    if BR2_TARGET_TI_K3_SECTYPE_GP
+	default "hs-fs" if BR2_TARGET_TI_K3_SECTYPE_HS_FS
+	default "hs"    if BR2_TARGET_TI_K3_SECTYPE_HS
+
 source "boot/ti-k3/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3/ti-k3-core-secdev/Config.in"
 source "boot/ti-k3/ti-k3-image-gen/Config.in"
diff --git a/boot/ti-k3/ti-k3-image-gen/Config.in b/boot/ti-k3/ti-k3-image-gen/Config.in
index 38d1598d9fc0..2d53d62dd4ee 100644
--- a/boot/ti-k3/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3/ti-k3-image-gen/Config.in
@@ -2,7 +2,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	bool "ti-k3-image-gen"
 	depends on BR2_TARGET_TI_K3_R5_LOADER
 	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS || BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_SECTYPE_HS_FS || BR2_TARGET_TI_K3_SECTYPE_HS
 	# We need FIT support in uboot-tools, which is why we select a
 	# host package
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS
@@ -14,65 +14,12 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
 
 if BR2_TARGET_TI_K3_IMAGE_GEN
-choice
-	prompt "SoC family"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	bool "am62ax"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	bool "am62x"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	bool "am64x"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-	bool "am65x"
-
-endchoice
-
-choice
-	prompt "Security type"
-	help
-	  The target SoC security type option for image gen.  Valid
-	  options are "gp" for General Purpose devices, "hs-fs" for
-	  High Security - Field Securable devices, or "hs" for High
-	  Security - Security Enforcing devices.  Note for all High
-	  Security device variants the TI_SECURE_DEV_PKG environmental
-	  variable must be defined at build time pointing to a valid
-	  core-secdev-k3 folder location, otherwise the build will
-	  fail, see
-	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	bool "gp"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	bool "hs-fs"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
-	bool "hs"
-
-endchoice
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
-	string
-	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
 	string
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
-	string
-	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+	default "ti-fs"  if BR2_TARGET_TI_K3_SOC_AM62AX
+	default "ti-fs"  if BR2_TARGET_TI_K3_SOC_AM62X
+	default "ti-sci" if BR2_TARGET_TI_K3_SOC_AM64X
+	default "ti-sci" if BR2_TARGET_TI_K3_SOC_AM65X
 
 endif
diff --git a/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
index 74b4fcb4bf89..834d8f7d5cd5 100644
--- a/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
+++ b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -26,10 +26,10 @@ TI_K3_IMAGE_GEN_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY)
 
 TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
-TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
-TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
+TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_SOC))
+TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_SECTYPE))
 
-ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP),y)
+ifeq ($(BR2_TARGET_TI_K3_SECTYPE_GP),y)
 TI_K3_IMAGE_GEN_SYSFW = \
 	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
 else
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930db..1a9d21e7c6d1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -244,8 +244,7 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	bool "U-Boot needs TI K3 Device Manager (DM)"
 	# We use the SoC selection defined for the ti-k3-image-gen
 	# package
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	depends on BR2_TARGET_TI_K3_SOC_AM62AX || BR2_TARGET_TI_K3_SOC_AM62X
 	help
 	  Some TI K3 devices need the Device Manager (DM) firmware to
 	  be available for the U-Boot build.
@@ -254,8 +253,8 @@ if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 
 config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
 	string
-	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	default "am62axx" if BR2_TARGET_TI_K3_SOC_AM62AX
+	default "am62xx"  if BR2_TARGET_TI_K3_SOC_AM62X
 
 endif
 
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index cd26235342e4..cfefce0a77a4 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -24,8 +24,8 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am62x"
 BR2_TARGET_TI_K3=y
+BR2_TARGET_TI_K3_SOC_AM62X=y
 BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 1befeb4ab96c..daf78dbffff8 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -24,8 +24,8 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am64x"
 BR2_TARGET_TI_K3=y
+BR2_TARGET_TI_K3_SOC_AM64X=y
 BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
