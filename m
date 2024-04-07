Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E51CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC7441779;
	Sun,  7 Apr 2024 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI-gBtKoo-3b; Sun,  7 Apr 2024 10:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38DB418BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38DB418BC;
	Sun,  7 Apr 2024 10:35:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F27D21BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD73403E9
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQCJSxcp0CtV for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACC6340614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC6340614
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACC6340614
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-415446af364so26281365e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486118; x=1713090918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI1VSwtTAUPr3dyoJeMCgViOH+efd4q05v0ey0wQBPw=;
 b=itqgDRYUv20Rr56/pKRhhhRkTm9xa31/+WTMS+nyPypnLykkBJS7f3mUZ3LrZ9O7j8
 RPZOxhRrdOyjjeQMA6JtuflXjI1GRZIM+ODXCGAt1Jke+8qwH7N6s/jOGTsG42x17hVL
 crbaJehnfvCxIF3Nt07J7RZGkuUysDz9ZwkNujS6mtkAzJHE438OXQNUKWY2ZVzoH274
 r+96dNTII2eLw1cygCS1u2fJxM6MKjLTb3x2sBTkm+l5ATtSqbjgTa3BlXVthusnH9rU
 sZnrND+h5gclzYCR6pqada9HD+jWY+nCie0unfSUbAWnxBPwWGPdRGS/tPmv/vGVLimI
 zqHw==
X-Gm-Message-State: AOJu0Yxz+H3OLYdbc4L9V6jRdVPeT9g0L7robiQbbehNDmGZ02IyXkfw
 axZBpHAYJTXLoLX1BQtA3HMv6PBzF6RPzgGM9LMgNKv3rXlnnlLRfIqy7G54mrcMcowy0jxYkKa
 b
X-Google-Smtp-Source: AGHT+IExgbri1J13Nwp0xAmfZXRq1Ag50I+o4Vtm2Z96XyWuB6d8sO+l8iooPU2ilW2FUOP1HfZnpQ==
X-Received: by 2002:a05:600c:3514:b0:415:666e:9355 with SMTP id
 h20-20020a05600c351400b00415666e9355mr5436170wmq.15.1712486117712; 
 Sun, 07 Apr 2024 03:35:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:17 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:57 +0200
Message-ID: <20240407103512.1112712-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486118; x=1713090918;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI1VSwtTAUPr3dyoJeMCgViOH+efd4q05v0ey0wQBPw=;
 b=AwRYQ6ojTezWInxNARZTp1VrYMsTDaXeb8F4gJeHmQExQ9kXh9U5vJGk2Sg4U4hFFP
 7lj7Vpw69/M90/8K3Nq636YXk4gBxiL3csNIzNrJE0t4zyODy1oSYbt8FmTC5RLUYYEF
 6In1yfZrHDtSAfQ+/8gffKb7/M2oo+vStfblYcJ3Z48crsBTfGjX6178eHx2Kemeoe0M
 ZxjL8auIc7fYk3ND1BEaZ+veyiPgf/B3oBL/odPTKTWqJD+456HgC45SpTRgxecsuZKT
 BIqdlRLkWshm7DZ2ixaxu3eZowqhPCfGOCEsARhMGS5XsCtXGZghaNWsQgUeMxejGPzm
 NrRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=AwRYQ6oj
Subject: [Buildroot] [PATCH v12 04/16] boot/ti-k3-r5-loader: add
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option
BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN to add additional host packages
in U-Boot build dependency to use binman.

When BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is set, BINMAN_INDIRS
environment variable to provide the directory to search for binary
blobs and select the packages required by binman. Make sure that
ti-k3-boot-firmware package has been installed before building
ti-k3-r5-loader in order to provide such firmwares.

The BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option is currently needed
since we are in the middle of the process to switch TI AM62 and AM64
board defconfig to binman. Keep BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
disabled for them until the u-boot/ti-k3-r5-loader version bump to
2024.01.

The dependency of binman is not really easy to follow. First we have
the packages list from binman.rst [1] then we have to install
additional python modules [2]. Maybe in the future it will be
necessary to add host-lzma and host-lz4 in the dependencies list.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Use BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option while AM62 and AM64
  still use ti-k3-image-gen
- Add missing ti-k3-boot-firmware dependency

Changes in v6:
- Update the commit message adding the links of requirements.

Changes in v5:
- Add dependecy on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
- Drop runtime dependecies
- Add host-python-pylibfdt dependency without requiring
  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT configuration
- Add host-python3 and host-python-setuptools dependencies
- Add SOB and COB tags of Romain Naour

Changes in v4:
- Drop the BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option

Changes in v2:
- Change commit message
- Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Select packages required by binman if
  BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled
---
 boot/ti-k3-r5-loader/Config.in          |  9 +++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f86c045c9..5f4f33b220 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -93,4 +93,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
+	bool "ti-k3-r5-loader use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f..cf18b43871 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -60,6 +60,21 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml \
+	ti-k3-boot-firmware
+# Make sure that all binman requirements are build before ti-k3-r5-loader.
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python3 \
+	host-python-pyelftools \
+	host-python-pylibfdt \
+	host-python-setuptools
+TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
