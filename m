Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD58CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21C4141980;
	Fri, 15 Sep 2023 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C4141980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNdn18d-5mEw; Fri, 15 Sep 2023 21:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5709F419C3;
	Fri, 15 Sep 2023 21:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5709F419C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 667831BF3D2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D04480C4B
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D04480C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eW6ZCfocILCG for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:44:27 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67989802CB
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67989802CB
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-402cc6b8bedso30076565e9.1
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694814265; x=1695419065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9rGcGylg43Q1JcdZ0JK83BrfPEra3mAfOU5a/JGI3I=;
 b=tN6j0eYSX4d1pTxP3U9OQpWvI+d1v+2NmaVEK8BhuUmodyVj3Qz/0ajIS0B9x2f+C1
 fai36EhOlvSX1Sb1tmCkw/k+amHD+MemGT/viFdLfgep9luF+baIomr9V4UxQdz/yJcJ
 YDcxMd99qLFBtj6bBQhYPa49gf72sMisGuQSzQ4V9JLj1DwPzNj6uwkzlu8qKTKBwmTK
 EiIlb+9I+aZTGDecANF5Ven1YkGtFKCqV/N+Q41eihtNecDLA2CFTW/lIJKYx45ilx/d
 YF3m0ggshXAXKtMLKgNxX+N19tS9x+jkDBbW+KyA9smtwcLL9QI7ztF/gH5aznLUrS+q
 XK9Q==
X-Gm-Message-State: AOJu0Yyk//XCfoNoOxzGTNq6x1dey/Z1Y8m2qZEVAVvT4ZqYaAihm8QA
 +4HvWtrVDv5b02dYmv4J8tB1VFBRDrg=
X-Google-Smtp-Source: AGHT+IF2HczUsrLP8N3cq0GmoGmgALngo5ZthpWKZAaV1qYJUYVLd64B4nAAGZflztBBIkAOzN/tDw==
X-Received: by 2002:a05:600c:21d8:b0:404:74e3:27a4 with SMTP id
 x24-20020a05600c21d800b0040474e327a4mr2386342wmj.40.1694814264967; 
 Fri, 15 Sep 2023 14:44:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c13-20020a5d4ccd000000b0030fd03e3d25sm5362448wrt.75.2023.09.15.14.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 14:44:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 23:44:15 +0200
Message-Id: <20230915214415.30461-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694814265; x=1695419065; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K9rGcGylg43Q1JcdZ0JK83BrfPEra3mAfOU5a/JGI3I=;
 b=N2+dXb0NJ7ZrvZbJ267uGC3LajMTcDJBVHN1wEwtgIaIR2CA92icXk5Q7dAn14U/cF
 A/GIyycUe4ubgWdCNO7rJDRMK7n135sO797HH2Odd97r5lm+gkpP2QBDhNqK/4SBjkF7
 JlZFD5c0Ffck3bxyVvYFLxkN2hdwVXLrXAmC/PVkwemOLEt5eitWCgb8GL7rHH7S+DLV
 WogZ5j0+FC9QGA7WQRRPKKfIbOxsrMQiuxDN/iugfWn0uPSKs2swmwhCSEO7qlz4JGHH
 jRhkjUdTd6QN7Tk2dyuoZ6lcewilurESnC3wRzPKYdCYgRn4suG7HpNBjLRk+nnzNiVs
 mA9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N2+dXb0N
Subject: [Buildroot] [PATCH 1/1] package/webp: security bump to version 1.3.2
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- security fixes for lossless encoder (#603, chromium: #1420107,
  #1455619, CVE-2023-1999)
- security fix for lossless decoder (chromium: #1479274,
  CVE-2023-4863)

https://github.com/webmproject/libwebp/blob/v1.3.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 969e4cd3d7..adc543059b 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df  libwebp-1.2.4.tar.gz
+sha256  2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4  libwebp-1.3.2.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 38a1564a63..33cb4bd507 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.2.4
+WEBP_VERSION = 1.3.2
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
