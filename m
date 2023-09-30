Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F3FE748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D70C83CC2;
	Sat, 30 Sep 2023 22:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D70C83CC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1xy-WqCYo5y; Sat, 30 Sep 2023 22:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17AB883CBD;
	Sat, 30 Sep 2023 22:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17AB883CBD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB2AB1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 802534168D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 802534168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIRiI8dtfIsU for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:38 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3461C4015F
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3461C4015F
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so15179317f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112256; x=1696717056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0sm5javS5N8tXpUiAC+G0weZxljWFkvTSc4tXNjv9c=;
 b=MqCfkAYhAu3ZH9+DrT9WKXM0OHanaoHyfYr6ARLXfq7y3zv2wyET2ezaSV6PE1ZYMW
 jho4+84GZ7qKYGztwRdx4MG9VLWer+KEbAha6LXB+vo1f/Eho4ohV2e95nYsTonJNyyO
 y5orLlYDxVZ+p/qoebCEkpBlLT1p9J/34UILLWNYn9oGIn4QitK78vQleQBkfjM0qoFN
 JuwB87WstAbMgjWHhoGZ4Yus4C/Iz/ZTNXATTTqkDuQQRuk1NFzzhlDOkU/p0OU9SqWK
 i1Dk0B7+Nt0/xQlusVc1yYV8nt9KfHXbtI7uzMiro07rtgT4w3WlhGDtYf5yTOAynGUj
 fFzw==
X-Gm-Message-State: AOJu0YzA0RcnBlbdhYYtZ8R/7H/DQpnNI2/1AEV+OdniITPvLu6jGi6t
 KkFiqUbQr1HCF+rva34e5+ZzyJYmj86kTTFqpQUx3Q==
X-Google-Smtp-Source: AGHT+IH3APoPmNXfZbvBi1EJQ38eXZmioTIKj5c3wEt6lnWyzFyrlMhRR7bEKvVWpwb223VEIui65g==
X-Received: by 2002:adf:f083:0:b0:31d:3669:1c55 with SMTP id
 n3-20020adff083000000b0031d36691c55mr6463257wro.65.1696112256203; 
 Sat, 30 Sep 2023 15:17:36 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:27 +0200
Message-ID: <20230930221727.1458825-4-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112256; x=1696717056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0sm5javS5N8tXpUiAC+G0weZxljWFkvTSc4tXNjv9c=;
 b=eJmBB/s7WrZEe5KTUQJ1hmG5XHtq5qrapsF96ymRhyiP89/Ht1mVMoqITJTaFiEgrk
 GKip4YJjad1IBPWFBBUPFaL5eBUoaIMnLt9utKTTejJTaBEzoQsQeLMyjWnxlWH75mtV
 /4T3wlPqZcMmOcUKi8UhYMngEt6ItCo0zJwzEODMJyksNFAgfpgqD8mpLjpDTX1h4B/U
 vLkRTqDP8dzvWk6rbNXH8WE1fZoXUZKMd/0tbCEXXX7LQayvD8XzFMx6g6TTsQrqkT3x
 R1Yd1uxUjevzh4IhWZmXbLcHIp6VV9713mCMh59qyqdfDLXIsENu2ZlGy9ldG/D4KDek
 n8FA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eJmBB/s7
Subject: [Buildroot] [PATCH 03/10] package/pkg-python.mk: split the commands
 in a target and host section
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Only define the _CMDS variables that are relevant for the target resp.
host variant. Duplicate the _BUILD_CMDS. This will allow us to
differentiate part of the _BUILD_CMDS definition in a follow-up patch.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 47 ++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index eacf75c165..c1640d71bb 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -324,6 +324,7 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
 endif # SETUP_TYPE
 
+ifeq ($(4),target)
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -338,20 +339,6 @@ define $(2)_BUILD_CMDS
 endef
 endif
 
-#
-# Host installation step. Only define it if not already defined by the
-# package .mk file.
-#
-ifndef $(2)_INSTALL_CMDS
-define $(2)_INSTALL_CMDS
-	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_CMD) \
-		$$($$(PKG)_INSTALL_OPTS))
-endef
-endif
-
 #
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
@@ -380,6 +367,38 @@ define $(2)_INSTALL_STAGING_CMDS
 endef
 endif
 
+else # host
+
+#
+# Host build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_DIR)/bin/python3 \
+		$$($$(PKG)_BASE_BUILD_CMD) \
+		$$($$(PKG)_BUILD_OPTS))
+endef
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_DIR)/bin/python3 \
+		$$($$(PKG)_BASE_INSTALL_CMD) \
+		$$($$(PKG)_INSTALL_OPTS))
+endef
+endif
+
+endif # host / target
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
