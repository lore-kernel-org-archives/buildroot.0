Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C1DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C6F607D6;
	Wed, 13 Dec 2023 16:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C6F607D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzxYwPujAybl; Wed, 13 Dec 2023 16:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80045615C0;
	Wed, 13 Dec 2023 16:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80045615C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0654B1BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E04D740648
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E04D740648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIYb799lF3L5 for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:25 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53BCB400AB
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53BCB400AB
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9f8faf57bso91766841fa.3
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485803; x=1703090603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDjU7b7cQpPQxDfohqEkz0s3BJ8vGCJlNjpFuwnGY1w=;
 b=aQMkdW3m5aRPUp7Fxb3W8os2klnGvRGQPxBPx/IrDNkpmTtD/OjJhoP+u65rxqdXhZ
 +Y5EQGZEFYt7GN7NTnsw4UqSOZSZHN33exYLrexQ74OiyVRfFY9TBefhdumaPIkyB00W
 KTUyar+ZEfTwxD7iioeMHL6i4gI9JvXR5J5Xksj565QC523oOhUySk0JdtvclX+1OxxO
 cmhQ8UOeRldeAexy3AQbRmkl5uL6sgKTMA9oN7K7v7xmMx2sc9eXmiMGqcj/6ALRD2Qp
 ITwx3YBEuSPpsjaCi4NaVvXL6Z2DcdcpYO+SSnENG6uWJZug8koyE5JL4swuXtsybpWM
 Pgpw==
X-Gm-Message-State: AOJu0Yyrm311hLBL5gIdgo43Fomn1rh1eac/hessc0RZA0WWHFyx7F0P
 dw+rbP0+DJCi8h6hvt8fWlC5Eaf5DNYRFymsiWu3SQ==
X-Google-Smtp-Source: AGHT+IFz+c/YN9PO2Kyc1d2CfhLnpiti8n09SBBbgByOL16k0uIpjkvrHvuPtYuqQdQYAZZkbSy3CA==
X-Received: by 2002:a19:6758:0:b0:50b:d764:969c with SMTP id
 e24-20020a196758000000b0050bd764969cmr3931534lfj.128.1702485802887; 
 Wed, 13 Dec 2023 08:43:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:08 +0100
Message-ID: <20231213164311.4180059-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485803; x=1703090603;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDjU7b7cQpPQxDfohqEkz0s3BJ8vGCJlNjpFuwnGY1w=;
 b=nouwRoByMCHDbsWGPudxO4XtaWEPXqyvcjNrEduJ59genL/K2oGsrVbHHalEQvO5Bj
 Pytma8uM+ao6hhbOskvTJJXuvAe/I5gK2DinSYQgrekDTqjqns3q07hxPtyKWeEnrmxM
 UvMRonAjkqFoBwlCTe+y9hSiy+QN9ZXEthHYc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nouwRoBy
Subject: [Buildroot] [PATCH v2 08/11] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

The patch set the BINMAN_INDIRS environment variable to provide the
directory to search for binary blobs and select the packages required by
binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Change commit message
- Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Select packages required by binman if
  BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-r5-loader/Config.in          | 13 +++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  1 +
 2 files changed, 14 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 8c8368a1a5a8..a40eaed9467b 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -93,4 +93,17 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
+	bool "U-Boot uses binman"
+	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
+	select BR2_PACKAGE_HOST_PYTHON_ATTRS
+	select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
+	select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS
+	select BR2_PACKAGE_HOST_PYTHON_PYYAML
+	select BR2_PACKAGE_HOST_PYTHON_REFERENCING
+	select BR2_PACKAGE_HOST_PYTHON_RPDS_PY
+	help
+	  Select this option if your U-Boot version uses binman
+	  for building images.
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f2e..d5ec8fa8ba96 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -58,6 +58,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	BINMAN_INDIRS=$(BINARIES_DIR) \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 define TI_K3_R5_LOADER_BUILD_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
