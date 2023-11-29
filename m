Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93211C10DAA
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4B3843E6;
	Wed, 29 Nov 2023 17:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4B3843E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JrqozPAPJG5o; Wed, 29 Nov 2023 17:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9543843DF;
	Wed, 29 Nov 2023 17:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9543843DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D52221BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE92961536
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE92961536
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZEE8Crmj5dU for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:28:59 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B641661528
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B641661528
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bc59115c2so74267e87.2
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278936; x=1701883736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsWBK3P/0vLqwlhFdEAqNlwBnnVWCAAyxcJs5YedLM0=;
 b=MHSS9Oa3Uar+JCvSGMNL+WEtnG+Rn1yyl9BiQmHt0q7yD2b5mxoU+V7O1Ut4u/h+KE
 Ze45nrzABHM1bZnOPApHFm+ZgOxmo95GJC6OlcQY8+gXhfHDGL6yJONRdn7U3gJw3Cm3
 /5oPmHm0VIJ5iqDqhedPWPZJGaDTe/2+KHH7Dn6tKOJFKFn4Q/O+rSDWXRq8inA54r9b
 zmT5vwE9wEDwT/Gd46rhhgwArY04Ki/YdxYNxgtbn6mf33oaDIi6flNc+QLkgDEa0I9Y
 RLBtKyb18Ea0iFsc0nrT1XCpj20ORusAD8iYsppqyYDTC4SujY/fJUWH30DozsrpXrim
 OUlg==
X-Gm-Message-State: AOJu0Yzz1gbWfvDuQl9SgvT4c203so+zkL8xcVrng0EVJwgkdpz2Ef8l
 22SmywACJ3MjIQik5q33Wzq0/KUK3aA3+G/Nk7JkTg==
X-Google-Smtp-Source: AGHT+IH3fVqU2z0+NkHDtADEGNhr9WoEqDa8cDr2OythZH4+XqP9Pd58xIMDSSQ1nGId53289wK9+A==
X-Received: by 2002:a19:ad07:0:b0:50b:c4f1:9058 with SMTP id
 t7-20020a19ad07000000b0050bc4f19058mr1718999lfc.12.1701278936407; 
 Wed, 29 Nov 2023 09:28:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a50d4dc000000b0054b9c98b852sm2240218edj.55.2023.11.29.09.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:28:56 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:28:52 +0100
Message-ID: <20231129172852.1684628-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278936; x=1701883736;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rsWBK3P/0vLqwlhFdEAqNlwBnnVWCAAyxcJs5YedLM0=;
 b=kkjyL0pSSBlEh8xyD30Hh/YneibIVL2AKNqvYK+qJ4waEmhLuaIjoyoKExIHbXFJp2
 WMQ5J1GlhwSpAqnXPJ6GkpBCVPzkKBWABCHQeG/o2AxYvc6ERNMpVysMZzNe8OkqYEOc
 dM28gGz+i2YMhIdUtEWvoF+6fNM6VBhP39L+4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kkjyL0pS
Subject: [Buildroot] [PATCH 1/1] boot/ti-k3-r5-loader: add support for patch
 files and URLs
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
Cc: Xuanhao Shi <X15000177@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds support for URLs using similar code as found
in linux/linux.mk and uboot/uboot.mk.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-r5-loader/Config.in          | 11 +++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 8c8368a1a5a8..e17e18299d46 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -68,6 +68,17 @@ config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || \
 		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG  || \
 		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+
+config BR2_TARGET_TI_K3_R5_LOADER_PATCH
+	string "Custom U-Boot patches"
+	help
+	  A space-separated list of patches to apply to U-Boot.
+	  Each patch can be described as an URL, a local file path,
+	  or a directory. In the case of a directory, all files
+	  matching *.patch in the directory will be applied.
+
+	  Most users may leave this empty
+
 choice
 	prompt "U-Boot Configuration"
 	default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f2e..4b7b10950b2d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -49,6 +49,24 @@ TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
+# Analogous code exists in uboot/uboot.mk. Basically, the generic
+# package infrastructure handles downloading and applying remote
+# patches. Local patches are handled depending on whether they are
+# directories or files.
+TI_K3_R5_LOADER_PATCHES = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_PATCH))
+TI_K3_R5_LOADER_PATCH = $(filter ftp://% http://% https://%,$(TI_K3_R5_LOADER_PATCHES))
+
+define TI_K3_R5_LOADER_APPLY_LOCAL_PATCHES
+	for p in $(filter-out ftp://% http://% https://%,$(TI_K3_R5_LOADER_PATCHES)) ; do \
+		if test -d $$p ; then \
+			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+		else \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+		fi \
+	done
+endef
+TI_K3_R5_LOADER_POST_PATCH_HOOKS += TI_K3_R5_LOADER_APPLY_LOCAL_PATCHES
+
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
 TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
