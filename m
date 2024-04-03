Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD65CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1239418DF;
	Wed,  3 Apr 2024 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odkOKeevjfci; Wed,  3 Apr 2024 19:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69416418ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69416418ED;
	Wed,  3 Apr 2024 19:54:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90AB91BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8F03402E6
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY-5uBYPwdDi for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE1B440437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1B440437
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE1B440437
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41625000a61so1461025e9.3
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174049; x=1712778849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmeqXEPrZJAIFb+871yeIjIlzCEvmwfy/iThmb6WAZY=;
 b=vPQH118abT0yvXF2rb5dDt/pAevhvIQPWFnYvt9ZQtNhaj/B40Sd5cekS9VS1f4vZb
 cspX+33JHfGZkEqpjEl1a3zvzCQEAzUPoC1K2Qf9Xv8XbHsOCHuq1dSStfABP+YhRU+e
 /ne2dt/9TbKAEvZWgrb+Y7ve6lwbc//7f1PSCieKG6Xj7EfsWozPrfGslNeB/SRJuldV
 dU2uAY5lzqdv6Hgf2C9ZwaXj+zW3hFa64EdzyXB+D1D0VPpR93QvOWUswgyDXg9nziZe
 ALgmihb1cGXQCgyIICR432/eVhTwDXajn315hTEB0AqHPV/vp/HrANwrWVCclhPGRTp7
 Fy0w==
X-Gm-Message-State: AOJu0Yyl3WdcWMoxttQDd6FjtLW+0jtf3aNmfjRcOtzocf1jHZpo2HOz
 zn0JgFr5geEYkj2OF3ZoQZiw/ygkATAOE2/HGYZXPvo/6aO4Cc2Hakwzw0mcXMSciuUE34X3TgI
 q
X-Google-Smtp-Source: AGHT+IF6nDG5k+74vCm5ROoxWQ8rCrSxK76FfUzpXjxf8bVqNNjAyNCN3rx2CNcLzyz9c8PKn7LIOw==
X-Received: by 2002:adf:e845:0:b0:33e:69a8:fe85 with SMTP id
 d5-20020adfe845000000b0033e69a8fe85mr351475wrn.37.1712174049646; 
 Wed, 03 Apr 2024 12:54:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:09 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:40 +0200
Message-ID: <20240403195403.1359007-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174049; x=1712778849;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmeqXEPrZJAIFb+871yeIjIlzCEvmwfy/iThmb6WAZY=;
 b=ocD6oaRqBDgjWr2nl/ZUF8Beta1c8LCL3xA3ykBAJG9HvNyBbXBDao1TCGbxPD42eV
 xrKWTz4ufMWG8vk+qX/WbxtF/5V+fwRC6Nf9vU6ty9BP+fGqOks83COqhmkCsLcl1B+g
 pKq41xjX5v/GeINp6eB+xwcLl+ZH219nbNUjBSr3AvyCLOeVaNBLGoBEJa2s1RtkV4rL
 9wuXW0yy5R/Gknt5PX3srf7CNS4vK30fmh6FdHg5nzCgVqf3UhODFo2qVM70AG8+FgFx
 QJgDOzxg9jFw85G0LcWcbjlaV/mHhnxfurbt068WzKoMq4DSQaV9THZM2iS9s2JZ+yxz
 Hacg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ocD6oaRq
Subject: [Buildroot] [PATCH v11 06/17] boot/uboot: add
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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
`UBOOT_MAKE_OPTS += DM=...' for TI K3 SoCs using a Device Manager (DM)
firmware, BINMAN_INDIRS instead to find such firmware.
We had the explanation from [2]:

For all TI K3 SoCs using binman, install ti-k3-boot-firmware before
building u-boot to provide DM (if any) and SYSFW binaries installed in
BINARIES_DIR.

Note: BR2_TARGET_UBOOT_NEEDS_TI_K3_DM is still needed when binman
is not used. This option will be removed when all TI K3 based defconfig
will be updated to use binman.

[1] https://docs.u-boot.org/en/v2024.01/develop/package/binman.html#invoking-binman-within-u-boot
[2] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Add ti-k3-boot-firmware depedendency when both BR2_TARGET_UBOOT_USE_BINMAN
  and BR2_PACKAGE_TI_K3 are set
- drop BR2_TARGET_UBOOT_NEEDS_TI_K3_DM related changes

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
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 31ecdeec12..2dc20e4770 100644
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
index dda606a880..be366e7c31 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -269,6 +269,18 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
 UBOOT_DEPENDENCIES += host-vim
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN)$(BR2_PACKAGE_TI_K3),yy)
+UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+endif
+
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
