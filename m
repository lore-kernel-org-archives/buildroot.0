Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C4FC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5300F4098E;
	Mon, 18 Dec 2023 08:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5300F4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMwpuKkHnfF8; Mon, 18 Dec 2023 08:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6263C40A5C;
	Mon, 18 Dec 2023 08:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6263C40A5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06B6A1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1EDF41805
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1EDF41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GD0r3aaR-zc for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:24 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3921417F8
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3921417F8
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a235eb41251so43151366b.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887622; x=1703492422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHOcIozQeZlxJDMpQ9dd5gfCPjt6Jsx9U9ejZJjX9dw=;
 b=MoNjgL+tzVYki1aIv4RX3nF5tEWupu26luTn84vir7QNcTZrhCjkdlZmEbTwcVGSek
 wuV/MbjbPYaWKtypFvKgmpc93Eqk+PZF0i+zkuIfCHNSpFL5afhLhck2X5V+VQYM20Lm
 FpDC4CXcMIT357igGBft5MYoJdZ1yT5rLgbULYrmZNOZeer+7N6+ZNgL97HklA/NC/VD
 XWxat9JwVpxeh+NiL3FMLldRQPxpiyGOX1xIUe+JY+m/bbDS2FNo4DQ3QVRXD3x3A6r5
 BcmS8PCiIGmCf6QKu3BUwMWiMIK8HA4PDJK3ufleMVrzgn65n39oVYliu3ehuUuyOuqA
 0V2w==
X-Gm-Message-State: AOJu0Yz+flKy+vQECEml/YLED8eEHHrGILdx2uajrLFmq9WpIAdp8hX3
 OuHuIAtgONAAeyNIEnLTrEhxtuHurZv0umdFcd92LA==
X-Google-Smtp-Source: AGHT+IGB7U2T6P0DUJfuZUUQ0fFbPhQzZJQ5wZJF9yTElbyBXJSlp4cUajVueRyhothFjPBqJY7oow==
X-Received: by 2002:a17:906:259:b0:a23:665f:3981 with SMTP id
 25-20020a170906025900b00a23665f3981mr46473ejl.88.1702887621926; 
 Mon, 18 Dec 2023 00:20:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:55 +0100
Message-ID: <20231218081958.506691-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887622; x=1703492422;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHOcIozQeZlxJDMpQ9dd5gfCPjt6Jsx9U9ejZJjX9dw=;
 b=p7L3xVAeYX7yPHsa7lJWTtY0Ll/a8hEmlUaBLMg2OfboOzP8wswTZvOCqXPksEyaGj
 RDgIFQXc7Njry/6O/UXxHmQQvtam5AZQN4ztmQWSjQEPHazXZYBYfsTdjv0Iuy736fl9
 fdKSAbBXuMVBjOCQ5RrXQIRt/EjEo1oknWTOs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p7L3xVAe
Subject: [Buildroot] [PATCH v3 08/11] boot/ti-k3-r5-loader: set binman
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
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

 boot/ti-k3-r5-loader/Config.in          | 13 +++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

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
index 0ffcb8235f2e..7f6da0fb24ea 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -49,6 +49,20 @@ TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
+TI_K3_R5_LOADER_DEPENDENCIES += host-python-pylibfdt
+endif
+
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python-attrs \
+	host-python-jsonschema \
+	host-python-jsonschema-specifications \
+	host-python-pyyaml \
+	host-python-referencing \
+	host-python-rpds-py
+endif
+
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
 TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
@@ -58,6 +72,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
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
