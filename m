Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8634FC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 530B4414C6;
	Mon,  4 Mar 2024 15:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCSFVLQBmhEV; Mon,  4 Mar 2024 15:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1863341578
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1863341578;
	Mon,  4 Mar 2024 15:34:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1C21BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3899F41508
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mI2ONaGyNJlS for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B292441500
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B292441500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B292441500
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so791642866b.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566462; x=1710171262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22LoPDWYEr8qpw9klGDqezi6sNR382c/bQpgL0iGnXU=;
 b=RZ8k8LvO68tB2L7RudHbNWd24/7ceGLgd1y22UV5onZUuw7k2iq6rKYzHp2vZkN8al
 ZXazJTuXCYWu0jHWcZopvxGcGZ22NljZAb18BnjRhD9m+eVzOHI/aLzOHkO8H5N1a7qL
 K5FE4fici13kDd1qsvTdrhwYJHsRrmf7PxHVgnT4B7PL3UF9yKW4Rh9Du+Zk5B/a62Nh
 Ii3NBSgyy7v1Yyq68QFDzTUG4+gswAu4mqzRO1tdObpBMiV0I+NGU92jL/8UWeOxy3w3
 BhTVv0/8J3Gew+RWc9cKFq2aCbmw4cQ5FXh8DGFPLRoEHX1kkHn2TG271hkAc+VZmio1
 nFAg==
X-Gm-Message-State: AOJu0YzYGtyY7CVawpU/CxI/R54C8UvRaWTwelNrj3QgE/UMdLDMr2xS
 NImRAWYs56MJBcvvuE52+WAGzm/sQOIsLByhB6JDQlDs/0ZdjZzMO49OSEFwJCcrfElQmYjIoEC
 F1JA=
X-Google-Smtp-Source: AGHT+IGkvgEWwCY25iNWKRzLRAITBDNFh9W0LThjOMrPxvE4v7y4W+N5/KxZT5Syq9T0e07VJC1WMA==
X-Received: by 2002:a17:906:394c:b0:a44:e3d:68a8 with SMTP id
 g12-20020a170906394c00b00a440e3d68a8mr6772866eje.45.1709566462640; 
 Mon, 04 Mar 2024 07:34:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:43 +0100
Message-ID: <20240304153253.732708-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566462; x=1710171262;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22LoPDWYEr8qpw9klGDqezi6sNR382c/bQpgL0iGnXU=;
 b=Ep/Gvf2hVkOSSrJOqBODpYE9pvW16LaARGQ58CRZiWr52giCeHgctQKbYSfUk1MOa8
 6JXjp3OEtg7u3bC8kpL+ZQWzsUoW7Y3VEaN/m/RXzg/Jn5Q9c64eRmi/Guy0dIUxcyrv
 dJ5PxB3/C8g11wXuiNKJ6H+9sLlLi3JOOG3q8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ep/Gvf2h
Subject: [Buildroot] [PATCH v9 12/22] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option BR2_TARGET_UBOOT_USE_BINMAN to
add additional host packages in U-Boot build dependency to use binman.

The binman requirement is directly included in buildman dependency
(tools/buildman/requirements.txt) since within U-Boot, binman is
invoked by the build system, here buildman [1].

Furthermore, the use of Binman no longer makes it necessary to set
`UBOOT_MAKE_OPTS += DM=...'. We had the explanation from [2]:

BINMAN_INDIRS is used to fetch the DM binary from <path to
ti-linux-firmware>/ti-dm/ and SYSFW binaries from <path to
ti-linux-firmware>/ti-sysfw/.

[1] https://docs.u-boot.org/en/v2024.01/develop/package/binman.html#invoking-binman-within-u-boot
[2] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- Replace ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y) with
  ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),).
- Update the commit message

Changes in v6:
- BR2_TARGET_UBOOT_USE_BINMAN
- Binman tool is not specific to TI K3 platform, so add an option to specify
  the use of Binman in U-Boot.
- Add runtime dependencies
- Update commit message
- Add SOB and COB tags of Romain Naour

Changes in v5:
- Drop "DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f"
  from UBOOT_MAKE_OPTS.

no changes since v1:

 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  | 12 +++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930db..e6e7956adccb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -290,6 +290,17 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	  This option makes sure that the needed binary blobs are copied
 	  into the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_USE_BINMAN
+	bool "U-Boot use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
+	select BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
+	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a88059..35a41d96a12d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -187,10 +187,12 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),)
+UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
@@ -269,6 +271,14 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
 UBOOT_DEPENDENCIES += host-vim
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+UBOOT_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml
+UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
