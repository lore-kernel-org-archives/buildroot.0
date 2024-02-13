Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B9C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFA1416CD;
	Tue, 13 Feb 2024 17:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAM70A6vf0gH; Tue, 13 Feb 2024 17:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C83F41693
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C83F41693;
	Tue, 13 Feb 2024 17:29:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09D9B1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA9694159A
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9oXjfYMwIAu for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64E904159D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E904159D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64E904159D
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33cddf4b4b5so493883f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845306; x=1708450106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iV5e8jSUYWvZclePl7PGAnrEp49otOxyTepmeGPmqNo=;
 b=CAFB8422XbsxkjX/p1Fjg904gWSMRYYbXhLfGGVi6V74bII+UHj8fobfNJrL1w7hVh
 +QKPY98eKy08GjVosT6GA7qgmoV1R1xjoVBKqPK7YMcrWIriSmBJjv3ZZ9fJr2J+MYIK
 TEuRk018qzaVnVFxy9xcZpS1WmRr8viGvYDv2Yh4X2vkYw0e/fNf/imjzwJz5ib/X5ie
 GKy+CJDRGpGddXMomRe8G4zuEXTX7H48wLeKRRfmJDb6Ixr89gKjQ0JUUJT0v7Ioomck
 3XGn31YvWLATuhD5DZWVh3aS3lrXNrCUpDFe4yE3Id/P9G9OohHsYEOqioLH8bkpsD4h
 EMTA==
X-Gm-Message-State: AOJu0Yz0YAUs6yYzycNR0H5P7tLv474ADuS4u8OQo14/krK++Q4YjH8T
 gr6+MuqYZN62KZLigpyxZ+KuMivr41Z9HTw5jcM/7uee6s/dKel+XdbDWqi+easGZuwnlUtUTaL
 Q
X-Google-Smtp-Source: AGHT+IFEstnGCIxQ5VW10IdswK8Gv7aCY4mgeZUM1RtHEm+0h8YO1Pe8OEP4w20D/SwYipdXQtuNJw==
X-Received: by 2002:a05:6000:d92:b0:33b:79b2:881e with SMTP id
 dv18-20020a0560000d9200b0033b79b2881emr7644613wrb.27.1707845306485; 
 Tue, 13 Feb 2024 09:28:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:26 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:08 +0100
Message-ID: <20240213172817.2872849-13-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845306; x=1708450106;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iV5e8jSUYWvZclePl7PGAnrEp49otOxyTepmeGPmqNo=;
 b=S7Bgj1Sfc7D9Rc0TQWy6ig7+4Ez2NRvr0XnZLT+FGggkZXmxaMGYmDkRDpMc/nO1z4
 sWyJB16dd+Pfsvib9RR00Z82p8XdSEB5wMuz+xCKxdC+Wyza3GowS+/QBWpeevgZkUio
 R9xNOwBwks9yUeLfnjKl3GsgqPTpWBz3S1v75tkRveDRCRexLXIcu1Imp8xaFoq4O5i9
 NacLkh8xDhDCEJszvY2AmnRsaTGNjgofyL4ji7wio27YxKBzwVzFOAieCbnF7q12UK4P
 6wCF81Ni4CycC5NEmIGAsTrWK7leM8rQXcY5OgRs19xM+Wr0cwR9Oss2cLtBAcptxZS7
 Wrhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=S7Bgj1Sf
Subject: [Buildroot] [PATCH 12/21] boot/ti-k3-boot-firmware: introduce
 BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX, AM62X, AM64X, AM65X}
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ti-k3-image-gen tool is deprecated an replaced by binman [1].

But BR2_TARGET_TI_K3_IMAGE_GEN_SOC_{AM62AX,AM62X} is used by u-boot
package to select which Device Manager (DM) firmware to use for the
U-Boot build.

In order to remove ti-k3-image-gen package, introduce
BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX,AM62X,AM64X,AM65X} to
replace BR2_TARGET_TI_K3_IMAGE_GEN_SOC_{AM62AX,AM62X,AM64X,AM65X}.

In order to avoid breaking existing defconfig still using
ti-k3-image-gen tool (ti_am62x_sk_defconfig, ti_am64x_sk_defconfig)
select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC symbol from ti-k3-image-gen
package.

While at it, only install required firmware to BINARIES_DIR based
on the selected TI K3 SoC variant.

This requires two intall step:
  - ti-sysfw installation based on the SoC variant.
  - ti-dm installation only for SoC using split firmware boot flow
    (eg: am62, j721e)

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-boot-firmware/Config.in            | 34 +++++++++++++++++++
 .../ti-k3-boot-firmware.mk                    | 12 +++++--
 boot/ti-k3-image-gen/Config.in                |  4 +++
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
index d80bb4bdb3..8393699998 100644
--- a/boot/ti-k3-boot-firmware/Config.in
+++ b/boot/ti-k3-boot-firmware/Config.in
@@ -5,3 +5,37 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE
 	  This package downloads and installs the TI-specific ti-sysfw
 	  and ti-dm firmware needed to boot TI K3 platforms (which
 	  include AM62x, AM64x, AM65x and more).
+
+if BR2_TARGET_TI_K3_BOOT_FIRMWARE
+choice
+	prompt "SoC family"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX
+	bool "am62ax"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
+	bool "am62x"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X
+	bool "am64x"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM65X
+	bool "am65x"
+
+endchoice
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC
+	string
+	default "am62ax" if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX
+	default "am62x"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
+	default "am64x"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X
+	default "am65x"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM65X
+
+# Only devices with a split firmware boot flow requires a DM firmware (eg: am62, j721e)
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_DM
+	string
+	default "am62axx" if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX
+	default "am62xx"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
+	default ""
+
+endif
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 1f8ade207c..c7c5eb0818 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -13,9 +13,17 @@ TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
 TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary
 TI_K3_BOOT_FIRMWARE_LICENSE_FILES = LICENSE.ti
 
+ifneq ($(BR2_TARGET_TI_K3_BOOT_FIRMWARE_DM),)
+define TI_K3_BOOT_FIRMWARE_INSTALL_DM_FILES
+	mkdir -p $(BINARIES_DIR)/ti-dm
+	cp -dpfr $(@D)/ti-dm/$(BR2_TARGET_TI_K3_BOOT_FIRMWARE_DM) $(BINARIES_DIR)/ti-dm
+endef
+endif
+
 define TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES_CMDS
-	cp -dpfr $(@D)/ti-sysfw $(BINARIES_DIR)/
-	cp -dpfr $(@D)/ti-dm $(BINARIES_DIR)/
+	mkdir -p $(BINARIES_DIR)/ti-sysfw
+	cp -dpfr $(@D)/ti-sysfw/*$(BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC)* $(BINARIES_DIR)/ti-sysfw
+	$(TI_K3_BOOT_FIRMWARE_INSTALL_DM_FILES)
 endef
 
 $(eval $(generic-package))
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
index d76cef82e9..e54f5ec992 100644
--- a/boot/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3-image-gen/Config.in
@@ -18,15 +18,19 @@ choice
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
 	bool "am62ax"
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
 	bool "am62x"
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
 	bool "am64x"
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X
 
 config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
 	bool "am65x"
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM65X
 
 endchoice
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
