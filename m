Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BFC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 11:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09471408B4;
	Tue, 26 Dec 2023 11:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09471408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgRSAypKUtkW; Tue, 26 Dec 2023 11:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5780D40894;
	Tue, 26 Dec 2023 11:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5780D40894
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4031BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B2FD408D5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B2FD408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2qs9bvYkpjC for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 11:34:36 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD806408C8
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 11:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD806408C8
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d4ebcc207so30334875e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 03:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703590473; x=1704195273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4uKHVqPdFpinYwVJkAarKiGHUzmZg3jX5DrWrSLcqg=;
 b=TLLBswCf5OHEbVYZY2S4IVJu9Z/ISK9nIZPr5L6bew7jTh0ft0EmJli9/yuupdC3Td
 6xjeyLgHfR79Zv2/PKoT7GLFaz2YHWTuttXrgOIkXyTd5WJILM+d7wGz4EjkBT2xQ5xZ
 O93qda4ntYetAtwkGMpSfIbREAFdXfu541frU2s7hte+R24Eqze1/mknDdyhTmRXgVGP
 iv5qbP4Giwad2dmUntO8cmP+IDxJ9ZQYdFHk/opcvp8V2rNM/n0LcIC+NNN51dV3Rcxo
 oTLu8yZD1T8r0GaYAUQNdl6PYzYittUEEvAbgmMP/ezK7h2ooMqBHdz3LeL8s9wkJK5D
 gFyg==
X-Gm-Message-State: AOJu0YwkczwTZLp1g+fIpYB8wDE6x1j1c8EI5xqWa6ddqmXruXsPxai7
 YO+ivhF3wzAn62zV0x2NULQ0wDIRaK8=
X-Google-Smtp-Source: AGHT+IEHdq5yd/ah455LjxWlYEwSx5ZtaG4ePB8mOiJgtqIIbEcE+jO5qkaa4EPL2kMp/QFZkLYKzA==
X-Received: by 2002:a05:600c:b50:b0:40d:5c4c:a394 with SMTP id
 k16-20020a05600c0b5000b0040d5c4ca394mr37206wmr.158.1703590472925; 
 Tue, 26 Dec 2023 03:34:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b004094d4292aesm20369846wmq.18.2023.12.26.03.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 03:34:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 12:34:28 +0100
Message-ID: <20231226113428.32609-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703590473; x=1704195273; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f4uKHVqPdFpinYwVJkAarKiGHUzmZg3jX5DrWrSLcqg=;
 b=EfRs9WAurGIZZuzgiBNyXoA14JGaH45We+IQOmx5Fd6h/S+E2rX/PHj78d2D6+TlAW
 +t+ZEmvhPihecl0BTkwXG3dmqw4ziERw2DRDxBkm99UsYprNCO+VglgsumUwZIlL3ZMg
 oh1grvAGwFaDMUKxeCOF6zhQpydMiG2OZUuosqxQZtYM98b/Yd9k+S+2X4hYZQJe+xvF
 A2K/ydesJGO6pp3/u6K89u3Cn3ZM7rIfy55ohL7nS5ghxjhSRui73TU7YBtzd7kr74YG
 gxeDTprzxZYTYXGOhvPTtWlg7XF31dUH79WBBmdLZ4g7+IeLokiHt2TAn/QH4+/nbUXX
 HFLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EfRs9WAu
Subject: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix null reference in cJSON_SetValuestring (CVE-2023-50472)
- Fix null reference in cJSON_InsertItemInArray (CVE-2023-50471)

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 74844d6aa6..305dc0d7b8 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  451131a92c55efc5457276807fc0c4c2c2707c9ee96ef90c47d68852d5384c6c  cjson-1.7.16.tar.gz
+sha256  c91d1eeb7175c50d49f6ba2a25e69b46bd05cffb798382c19bfb202e467ec51c  cjson-1.7.17.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 7ed732ac90..f699c160ef 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.16
+CJSON_VERSION = 1.7.17
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
