Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D6C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 22:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACE060B3B;
	Sat,  6 Jan 2024 22:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ACE060B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uDPCiSsx3-m; Sat,  6 Jan 2024 22:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA4B60AD2;
	Sat,  6 Jan 2024 22:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA4B60AD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3201BF3C6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 22:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C51660AD2
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 22:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C51660AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7eRD6YpzVTg for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 22:42:39 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69F7760A9F
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 22:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F7760A9F
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5d8a6730so8248515e9.1
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 14:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704580957; x=1705185757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zw2yk6VXHMtPCEaILoQYPW9S8jIW4mS37nmVYx1phao=;
 b=ftsHqMl43BXiV+09lA/rqZIdYGQvFFuUQsoBjmhGurFL3ErhSVk1K5+O1fuZxK+OWQ
 JWkZYbYAQ/zeuxYwRpZgG8ShPvpTKgtVXDH32WZtRGcEw1ESOFBwdn91+W5ujGToSsdY
 jgoTvMZthBfYrokuA2ILmTrOCT/KnDpmKxKMyxbx0tUZbCxZv9mnXlD6qpAFy4gdrTI9
 VthDkuoCjANEPMNxaN/NX8BMSMmu9fy1OkkQ9vM8VZZtFdPUxKHXQArf8p/dPflX6+E8
 qkN87M+eA3KaUO6fi/lGFxBdsqb2LppypfI1lsMHhdUElp719kvH4z8BAcbxbtIEFFPs
 n8vQ==
X-Gm-Message-State: AOJu0YxdH0eEzcKyS1drcn2cCTemouZZKds7WPE1c9WTqXM/wIzXeEOO
 ZYZYpO0b2Lzka4Y4BuWqJodqvqqSwbM=
X-Google-Smtp-Source: AGHT+IFJDBj0ViOrio3Rbs72mNH22xHYGfLPgNzsaF/hiVum4TJh4V9GCZIVi6W1T7GRCynRaaNJdw==
X-Received: by 2002:a05:600c:4fc5:b0:40d:609d:d66a with SMTP id
 o5-20020a05600c4fc500b0040d609dd66amr785447wmq.84.1704580956377; 
 Sat, 06 Jan 2024 14:42:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa8-20020a05600c518800b0040e404796f3sm2605383wmb.18.2024.01.06.14.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 14:42:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 23:42:33 +0100
Message-ID: <20240106224233.3637602-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704580957; x=1705185757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zw2yk6VXHMtPCEaILoQYPW9S8jIW4mS37nmVYx1phao=;
 b=a0yagOiap8a+J7QomKYIZPXMG/AV0wyK7hLpdIethXx5na2fesfwrbeJccYWBl5NDy
 tn1tXUeKjfs+aHY8INyLdGk1pP4gUyO4ajrI2Xe9appa3h09JGoCMYHFvR66RIGbJanp
 y75EcDgjhurOHLb1N8NnXCb1IZiYRz5qwhD6ZsDRRkNO9A23CwfWFHb29kUsyzK2hwJn
 Of07GhrijS3ZncrHDEAaEqqx/DSnah52phN/CNP5PMpX1mMjwSk0JNi6fpbtXjchYTSV
 AO7ijTRTK9iXU4LpKFPBlUvxPm7aJwFu7/OLEfgRMSf8ehuFIoeqA04K7opIHIu13l6l
 G6mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a0yagOia
Subject: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: fix aarch64 build
 with BR2_OPTIMIZE_0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with aarch64 and BR2_OPTIMIZE_0 raised
since commit 0512910e4901edcb78bb1daa4eb3be9bdc4dc8a9:

src/convert-neon-body-bayer8.inc.h: In function 'bayer2rgb_convert_neon':
src/convert-neon.c:233:17: error: third argument to '__builtin_prefetch' must be a constant
  233 |                 __builtin_prefetch(((void const *)(_addr)) + 64, 0, (_lvl)); \
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
src/convert-neon-body-bayer8.inc.h:8:9: note: in expansion of macro 'do_prefetch'
    8 |         do_prefetch(&in[+1*stride - 1], (rows_per_loop) < 3 ? 3 : 0);
      |         ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/307c1c448becd99dfba3a17b3ef816db0bb5cad6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bayer2rgb-neon/bayer2rgb-neon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
index 212fe76766..b0b9882def 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -19,6 +19,10 @@ ifeq ($(BR2_arm),y)
 BAYER2RGB_NEON_CFLAGS += -mfpu=neon
 endif
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+BAYER2RGB_NEON_CFLAGS += -O1
+endif
+
 BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(BAYER2RGB_NEON_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
