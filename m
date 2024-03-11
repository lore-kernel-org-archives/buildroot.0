Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE52C54E58
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 21:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E8E60610;
	Mon, 11 Mar 2024 21:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FcyA3Q-_igUv; Mon, 11 Mar 2024 21:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24F06073A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24F06073A;
	Mon, 11 Mar 2024 21:59:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B681BF282
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 21:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A8F4018E
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-f4oRm1OBvt for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 21:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=zaporozhets.taras@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E277400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E277400E4
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E277400E4
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 21:59:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4499ef8b5aso340436466b.0
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 14:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710194351; x=1710799151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M7lBpHosSio6gNsXwdqu1n3A51tjBGqzfs1U8iHHGcM=;
 b=l8OOCTprXspvEOXmqzo4v9Do7o6XvofjP5hT090Ea/CLnBpLjmF0Nwg+4/6lbKYhlK
 5Hc+mINorXCWBP04z6c6DKo5v096WC/W/OPKRDPYoAYmEEy7kLpUKAy2bACnB2NGz/4E
 WqrIuYO6jjRRmZnTQUpe9r1BRZU9Nle402hBJix0sIdPYNdtgjty5vldD24AkhhwtqlC
 A4s53t1XOilIMpBxDgbVsVR0ttm9P2sNcxxXyRyA9pBRVFsD+cFvVFe+VgR2xO/hDkWd
 zkAo58ctZnV+hRcAGV85yVkoaNix8F+XLLsIlqyiKhDK9A/6swuBMkwd7ygOkgkcrwoV
 GINw==
X-Gm-Message-State: AOJu0YzMSyr9cP1mM8PDQDjzMtKCRTjwNbSgf9qcX//nns0tuY9RtJ7z
 cwLtJ0j/RheG+bj2FVyIOLJAm2x1EWvRcBSnx23cHRRv7lc7Bh1fdgPNpFz6Tj0=
X-Google-Smtp-Source: AGHT+IEy4POn7VLGyHA5cTlxRVzE/3XVM+Y1GUTh8x1SGYEgOzLgQAkKbWdJgJAl5Q5aWM9joNR6BQ==
X-Received: by 2002:a17:906:7f1a:b0:a45:2e21:c779 with SMTP id
 d26-20020a1709067f1a00b00a452e21c779mr4776343ejr.4.1710194351149; 
 Mon, 11 Mar 2024 14:59:11 -0700 (PDT)
Received: from t7810.. ([158.181.79.94]) by smtp.gmail.com with ESMTPSA id
 lr1-20020a170906fb8100b00a442e2940fdsm3252736ejb.179.2024.03.11.14.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 14:59:10 -0700 (PDT)
From: Taras Zaporozhets <zaporozhets.taras@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 22:59:03 +0100
Message-Id: <20240311215903.10569-1-zaporozhets.taras@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710194351; x=1710799151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M7lBpHosSio6gNsXwdqu1n3A51tjBGqzfs1U8iHHGcM=;
 b=DMcGlvpGMxC7iXYOhhOuhtqRwDUDbbIbqGiTXngbC9U2UOXKmBGnFwsWAnBprqmuxJ
 nOg0mJbSGNkZBHCRiiMrbVvwq9IFp/jQOsMNdWKVmTvYS88X/a+HHpYaKgkxu+PE2hxh
 kjabdpP72yETVPXhOT942xC9D7dF9vZEkYRuZQIWwBj9/GR9lFPRrjlBDpBndUec1xcu
 VLZeEAm1BBn8P/b8ywl8yoydO0AU/jQILSIWzPiCtQW6UITLkqaSqectr/Ddn8ZFOGPV
 WqAxiSEunOjseqH6meB7YgQn8Kw/+mnMCWjAYusVGy7Q+zA3ThQA90GI/Sm3p9ULYlfn
 UuAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DMcGlvpG
Subject: [Buildroot] [PATCH 1/1] boot/uboot: allow to use custom ps7_init
 files for zynq7000 SoC
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
Cc: Taras Zaporozhets <zaporozhets.taras@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Similar to zynqmp, add an option to pass init files from the outside.

Signed-off-by: Taras Zaporozhets <zaporozhets.taras@gmail.com>
---
 boot/uboot/Config.in | 37 +++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  | 14 ++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..4eeab458fa 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,6 +512,12 @@ config BR2_TARGET_UBOOT_ZYNQMP
 	help
 	  Enable options specific to the Xilinx ZynqMP family of SoCs.
 
+config BR2_TARGET_UBOOT_ZYNQ
+	bool "Boot on the Xilinx Zynq 7000 SoCs"
+	depends on BR2_cortex_a9
+	help
+	  Enable options specific to the Xilinx Zynq 7000 SoCs.
+
 if BR2_TARGET_UBOOT_ZYNQMP
 
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
@@ -588,6 +594,37 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 
 endif
 
+if BR2_TARGET_UBOOT_ZYNQ
+
+config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
+	string "Custom ps7_init_gpl file"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  On Zynq 7000 the booloader is responsible for some basic
+	  initializations, such as enabling peripherals and
+	  configuring pinmuxes. The ps7_init_gpl.c file (and,
+	  optionally, ps7_init_gpl.h) contains the code for such
+	  initializations.
+
+	  Although U-Boot contains ps7_init_gpl.c files for some
+	  boards, each of them describes only one specific
+	  configuration. Users of a different board, or needing a
+	  different configuration, can generate custom files using the
+	  Xilinx development tools.
+
+	  Set this variable to the path to your ps7_init_gpl.c file
+	  (e.g. "board/myboard/ps7_init_gpl.c"). ps7_init_gpl.h, if
+	  needed, should be in the same directory. U-Boot will build
+	  and link the user-provided file instead of the built-in one.
+
+	  Leave empty to use the files provided by U-Boot.
+
+	  This feature requires commit
+	  6da4f67ad09cd8b311d77b2b04e557b7ef65b56c from upstream
+	  U-Boot, available from versions after 2018.07.
+
+endif
+
 config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	bool "CRC image for Altera SoC FPGA (mkpimage)"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a880..b36968c064 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -461,6 +461,19 @@ endif
 
 endif # BR2_TARGET_UBOOT_ZYNQMP
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQ),y)
+
+UBOOT_ZYNQ_PS7_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE))
+UBOOT_ZYNQ_PS7_INIT_PATH = $(shell readlink -f $(UBOOT_ZYNQ_PS7_INIT))
+
+ifneq ($(UBOOT_ZYNQ_PS7_INIT),)
+define UBOOT_ZYNQ_KCONFIG_PS7_INIT
+	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(UBOOT_ZYNQ_PS7_INIT_PATH)")
+endef
+endif
+
+endif # BR2_TARGET_UBOOT_ZYNQ
+
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
 	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
 endef
@@ -503,6 +516,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
 	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
+	$(UBOOT_ZYNQ_KCONFIG_PS7_INIT)
 endef
 
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
