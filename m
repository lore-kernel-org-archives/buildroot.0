Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75213C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 22:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD6BE408B3;
	Mon,  9 May 2022 22:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqRSTo3_ZmXQ; Mon,  9 May 2022 22:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99456408AE;
	Mon,  9 May 2022 22:11:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B353C1BF36B
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 22:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B1F40484
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 22:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IONiqalxcBz8 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 22:11:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C8124000B
 for <buildroot@buildroot.org>; Mon,  9 May 2022 22:11:16 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id y63so16695783oia.7
 for <buildroot@buildroot.org>; Mon, 09 May 2022 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lT2oA45RwnAnrvsNDutKut8xw7f309vh2qAAKp6Sqg=;
 b=YkudZLsrU9T8DrF2IBrZgk9e/gjQduKAVdQHK05KWFkTy1NHKhmrJHpcUOmTZM3kBN
 LuSCKSEgFcvzssO26X/TXM6WCjCK5pC/lw4ur+prM3Eovp31kozRpsR+sJBNGRbGV3xn
 WDPCfm+CuKEDjJi0TG5pFJnIqjk1cesR48CVH/8AyvP8cJdyK+egsmxa/mg6XaHdMbMQ
 y3LVcvQxME7ttRMlPqd+cPxfjuVrWFJwx5PXw3SWCjd3PtNjB9rS3IVIo/4qfoO16Zx2
 yoKfCa2zaMFDBkERk1d4knrLcR4PMwNJTsN8i14+YuAZ3zgK3sdDAiTJctqUxMGQtqyV
 lvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lT2oA45RwnAnrvsNDutKut8xw7f309vh2qAAKp6Sqg=;
 b=gW82pDAA8n8cHLau6sLxVPCoS2pSJDJ2Awc6EF4wbvmZt4B++dCTUZqDwsEMEUGxGB
 quX25FgONYP6uoUou7nfoGHLdLL5hTVkDTGEbHwDrFyAKDdjEsoROgKPidcVwyfJYV03
 UMFNdeFuQNbmyqJCftWZohUMlaDpeQ7sIjgKWs9n3DV0UGAc2M74Lvo/xCcAqNhROWOD
 vthJeEbLatb/iZyOu2I39VkCWH1FKfUWkjOa/tPzpfR38PPvAQtMuvGLG/FcdzavjHzr
 zZdJ4u9ghkSoyui2jKhTHpQJ5KOqE2xsVZW45SFhP4ek4Yh2gJ3YmeOGVRlgl6a6RK/G
 MuEw==
X-Gm-Message-State: AOAM531q4oLsBQbOYGFQ+SqHCDJwSkEn227Td7KC7Ag498yN1yn7Nm/L
 ALgH83K3SZUz4yjdTuHCz4weVY3O9Zs=
X-Google-Smtp-Source: ABdhPJxaa4R2TWGw0FSoiMcfrY9y1jjo1VKeZ0ZeNw1LZOVd1RTKOTbgMMhaYLf0kN+XAXU41/o81g==
X-Received: by 2002:aca:62c5:0:b0:326:b067:ac89 with SMTP id
 w188-20020aca62c5000000b00326b067ac89mr5624021oib.281.1652134275403; 
 Mon, 09 May 2022 15:11:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-126-237.hlrn.qwest.net.
 [71.218.126.237]) by smtp.gmail.com with ESMTPSA id
 c22-20020a544e96000000b00325cda1ff96sm4812077oiy.21.2022.05.09.15.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:11:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 16:10:55 -0600
Message-Id: <20220509221055.335263-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509221055.335263-1-james.hilliard1@gmail.com>
References: <20220509221055.335263-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-orjson: bump to version 3.6.8
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
