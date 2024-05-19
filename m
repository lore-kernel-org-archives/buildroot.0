Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0FFC25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 07:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB5EF400D8;
	Sun, 19 May 2024 07:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdUYo7y2wD1V; Sun, 19 May 2024 07:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE37040118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE37040118;
	Sun, 19 May 2024 07:25:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6491C3B46
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 07:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7759640118
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 07:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtTAsZsTFaXg for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 07:25:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA6DE400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6DE400D8
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA6DE400D8
 for <buildroot@buildroot.org>; Sun, 19 May 2024 07:25:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59e4136010so650869366b.3
 for <buildroot@buildroot.org>; Sun, 19 May 2024 00:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716103510; x=1716708310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vUgnQH8L0WDBxjygMpzDDvyAV2nU2KACV9HY4GrmpKU=;
 b=KSjNg7yNReN5tLmxriZIuc5BpcmQR7oemyBt0IlmI9HtDVkAFkr/gS8Oj+ccFnuWHW
 haZ/SIbYsRhhXqa5LAKA2LHTUMshduhYYk8EC4Q1newRwYaN4qz20FC0SQGkTY9ZYr2A
 TW47bM6CUGHVz9xzImX7z+widx19VH/qdVXuQmNwFbhwDQU8tk3QGWE2s9e7fTFLEJb1
 8JGEzuLCE4RHRvUUeJHf1tOfwOYe2JUoAc04T/UTDoh1es3Me69UDnVWK2HDZVp4MWkG
 59j/DDIYbScciAnjS85L4U7NXVipZRgQz1gH0tDwsXOVDI6pBD7ZaoNaeKy1EzXDiT6o
 Q11w==
X-Gm-Message-State: AOJu0YyjGDtz5U6eT7MrKi+Hr6AL3U31QSSa2VIJSHACQQAAm0slWJH3
 jRswhqXWTDA+sAKkJV7t8OAESJVEzUK9s23B/Lpal813j5/DLf54LoWJkf3gr7ljYKxeTv72fjI
 8hlg=
X-Google-Smtp-Source: AGHT+IE1htebwXRAbtUrivojhMzHz8PAxDez0OiiscW9r0UREpjg++5+1+8V2+B9uQXbUdM0T6SKXg==
X-Received: by 2002:a17:907:1b0d:b0:a59:cbb5:e09f with SMTP id
 a640c23a62f3a-a5a2d65f230mr1950400666b.53.1716103510301; 
 Sun, 19 May 2024 00:25:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17f2csm1300299366b.197.2024.05.19.00.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 00:25:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 09:25:02 +0200
Message-ID: <20240519072502.1142825-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716103510; x=1716708310;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vUgnQH8L0WDBxjygMpzDDvyAV2nU2KACV9HY4GrmpKU=;
 b=fBPsugcP3A4GeimDfExCbPm25SZXiAepa5gZYdQ6CyVW/vCLFBa4kXUQe7/oR1DZeV
 1n+q8oYdG+6DEan8+4+fx3KBqGLoQQ4b1O4/9MNd/cxgiqE0fvqKvBVGYDAYfE5BdoMX
 TbZ962aTw+WQXMCte3dROV2iaowxwXXQmhOYo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fBPsugcP
Subject: [Buildroot] [PATCH v3] package/zxing-cpp: add options for enabling
 readers and/or writers
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch allows you to choose whether to build encoding (BUILD_WRITERS),
decoding (BUILD_READERS) or both. At least one of the two options must
be enabled. This way, it's possible to keep the library size at minimum.
By default, to ensure backward compatibility, both are compiled.

Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
Changes v2 -> v3:
- Add 'select BR2_PACKAGE_ZXING_CPP_READERS if !BR2_PACKAGE_ZXING_CPP_WRITERS'
  and drop comment.
- Add Co-Developed-by tags

Changes v1 -> v2:
- Drop BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS selection

 package/zxing-cpp/Config.in    | 17 +++++++++++++++++
 package/zxing-cpp/zxing-cpp.mk | 14 ++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index b72a00ec35f9..e5b8cfcdd8aa 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_ZXING_CPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_STB
 	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_ZXING_CPP_READERS if !BR2_PACKAGE_ZXING_CPP_WRITERS
 	help
 	  ZXing-cpp (pronounced "zebra crossing") is an open-source,
 	  multi-format 1D/2D barcode image processing library
@@ -17,3 +18,19 @@ config BR2_PACKAGE_ZXING_CPP
 	  compiles the C++ port.
 
 	  https://github.com/zxing-cpp/zxing-cpp
+
+if BR2_PACKAGE_ZXING_CPP
+
+config BR2_PACKAGE_ZXING_CPP_READERS
+	bool "readers support"
+	default y
+	help
+	  Build with readers (decoders) support
+
+config BR2_PACKAGE_ZXING_CPP_WRITERS
+	bool "writers support"
+	default y
+	help
+	  Build with writers (encoders) support
+
+endif # BR2_PACKAGE_ZXING_CPP
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 86a1ef96806d..077d7e75d3dd 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -12,8 +12,6 @@ ZXING_CPP_INSTALL_STAGING = YES
 ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
 ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
-	-DBUILD_READERS=ON \
-	-DBUILD_WRITERS=ON \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_DEPENDENCIES=LOCAL
@@ -28,4 +26,16 @@ else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZXING_CPP_WRITERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
