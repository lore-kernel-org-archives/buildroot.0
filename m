Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 00:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED8534019A;
	Tue, 10 May 2022 00:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IktnH8mi1gz; Tue, 10 May 2022 00:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7373400A8;
	Tue, 10 May 2022 00:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACBB1BF9A4
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 00:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D3C80B5F
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 00:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEq7R1BJdOqf for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 00:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7972A80A00
 for <buildroot@buildroot.org>; Tue, 10 May 2022 00:31:23 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id e189so16957565oia.8
 for <buildroot@buildroot.org>; Mon, 09 May 2022 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lT2oA45RwnAnrvsNDutKut8xw7f309vh2qAAKp6Sqg=;
 b=jEeYBkvuonr5d8o4REaJcZXKi/LfmCIMliLj0NER1WpTzgb3gHmFeH6S4gp03utmB6
 g7F1pJ/BgmF14s9Y37ivpGgx1dgY8lBEIDKDfG+Mi6tx04E/69iLujIA6bTO+YDuLVkD
 NS1VvuZd3kmUFKQMECoa9Y6i9vGN2wFXX87DawnkYuHY5iSsL76i7hjaWyBC+FSbvutE
 Y6EyHsMsLQNswYUVL202V0QaGLBwlkSe+ZVxZjqXwmo/6Rj0gR8bHuzxlc04JzSN2xmn
 LL+XfFkqoDfT5SJ65sac7MJcwWBTMdOC5fxmcrik9m3ripzCwxeIu7xltG+1t4Klc6ya
 2vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lT2oA45RwnAnrvsNDutKut8xw7f309vh2qAAKp6Sqg=;
 b=ez8uYEXjCTUd/VEQcyTbs/BUdFNfVNF3VQqtees3o01pGHmJrpPCx+Clg/Bp3G/N0i
 Knz/69sQKKDKN3UZG2dmkWnEc0lp9rYmsxLA2R5W/6WTty/xeQu7GXGAUD8GJonac1+q
 Qt0TbhZkokqXBUhWOg+GH1IRZbo8s6qzPy93t7FL4GAIR1oCsV/dUSjCbbO3Pg5o9df9
 jeWqbwVpPPNS3st4KquV6CI8Y3Pyr0CAeP8RM6WJZIVQXiTVJplKx/BtGC7vQDCpcN4I
 Wy7E9EVk/vBOqM2295GPwHMn0GH64KaRUyYKWfrBYEifazsgwlTvuB8+ILo6UV+jJmm9
 z/GQ==
X-Gm-Message-State: AOAM530stiEwXIpglUSyPUp+lkAB1zZuJp5V9RgSjyWloXBGyHwZHdFS
 sK+Pzgi7pNSY1T2JvFpkVJfYQfOrnDE=
X-Google-Smtp-Source: ABdhPJzR8wMHwvWfWakycDn4UPm0ZOKDZezdFFbmXs7gX0TzptZG/1V5EZU2a/0s4BH5QvPoA7XiuQ==
X-Received: by 2002:a05:6808:92:b0:325:bdf6:f824 with SMTP id
 s18-20020a056808009200b00325bdf6f824mr12729459oic.147.1652142682357; 
 Mon, 09 May 2022 17:31:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-126-237.hlrn.qwest.net.
 [71.218.126.237]) by smtp.gmail.com with ESMTPSA id
 i7-20020a9d53c7000000b006060322127esm5161159oth.78.2022.05.09.17.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 17:31:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 18:31:16 -0600
Message-Id: <20220510003116.336797-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510003116.336797-1-james.hilliard1@gmail.com>
References: <20220510003116.336797-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/python-orjson: bump to version
 3.6.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Convert package to use python infrastructure instead of cargo
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash |  5 +++--
 package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 5ef2726d82..06cc5cae79 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,4 +1,5 @@
-# Locally calculated
-sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
+# Locally calculated after vendoring
+sha256  40b95576b81916d167f7a44829401acb3b6cbbfe9840b5ed88c9535a86507d7b  orjson-3.6.8.tar.gz
+# Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 5de4b2c5fa..ccbaf37c6d 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.6.7
-PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
+PYTHON_ORJSON_VERSION = 3.6.8
+PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/14/8e/7e745d867466bdafb12ab7b0179d40f23f55639f7cd14bd375acfa74aca2
+PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
-PYTHON_ORJSON_CARGO_ENV = \
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
+PYTHON_ORJSON_ENV = \
+	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
 
-# orjson uses "maturin" to generate distribution packages - rather than teach
-# buildroot how to understand this, we reach in and install directly.
-define PYTHON_ORJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
-endef
-
-$(eval $(cargo-package))
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
