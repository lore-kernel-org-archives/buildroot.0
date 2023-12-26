Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2812EC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C5A60E44;
	Tue, 26 Dec 2023 16:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C5A60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuEb4f2_eGqJ; Tue, 26 Dec 2023 16:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B16760D5F;
	Tue, 26 Dec 2023 16:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B16760D5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1749C1BF3B0
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E456660D5F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E456660D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Zv9sGMohr4l for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:36:18 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC1C660C15
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC1C660C15
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d4103aed7so55097735e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703608575; x=1704213375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//m7puaCSgMCNV7+22pZy6wSvXxHsjz3c+rtfxfIeFQ=;
 b=Aw9V0/3PwEhrTy1mVI71vK0S07GBbk+8aNP4v/L7ZYe6wdeQ6X2d8jS/ocv8eP3tMd
 CeRM3kiw9Me3jQi9fAeJoRQR66sdxXo2G5+hKL7X0J826OfQRnfF0B2q3+uXEEiTUIMm
 w/xE+VgtZQmJFJ8YrCQUlVr48tG1BefZY+/71PAdBQ4jz8/znEomUDYUWaucqYlBV97g
 9ekcvt7Hf+9sx2UBpBY6oIGKfYAupKrMwir+O+JUAkE2q4j5ksu7BCQIDslnD55+bmAC
 ZV2IloDUvsgLE3ShEk5dDe70yGxlBKlZ9OrU/NiguOblIPZHzp+CqIvw/qQxKzq5GP2E
 B+dA==
X-Gm-Message-State: AOJu0YykJEulIdX1VPG7cpy18vBx4o25aA/hZCgSQZLHqA7QKQxm6mBn
 vZoL7tNfpE02i/t9lWLsGq0a767Iq5s=
X-Google-Smtp-Source: AGHT+IHiPRHMVW12M4zA4wdNItWeSN3aljZlHeSLrBRPuG15+0hGn24d/7FBQL65oh+qMHDvP9cf1A==
X-Received: by 2002:a05:600c:4ec7:b0:40d:593c:b2c2 with SMTP id
 g7-20020a05600c4ec700b0040d593cb2c2mr1000050wmq.159.1703608574931; 
 Tue, 26 Dec 2023 08:36:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 jg7-20020a05600ca00700b0040c46719966sm28720440wmb.25.2023.12.26.08.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:36:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:36:11 +0100
Message-ID: <20231226163611.774727-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703608575; x=1704213375; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=//m7puaCSgMCNV7+22pZy6wSvXxHsjz3c+rtfxfIeFQ=;
 b=KQpcA0EmhdaDI7a9TomOkdZfT57BzjmDktbC8cBFmAVGB43qGlDIgwXyZrQZwESUwN
 /FlRBwKmdn7kaAQVYuVeXq2q74iQKRlX1W4vIm+47v5v7AjB+NRTm8oVmPYyvtMONC2c
 z3I7IDZfLL7doG5uxSLuU5tQWljyIXA8WogRcB/aMqa+/oCqiQwpe+0GSTwmTTHHPg4e
 pNzfICStObDytpQhEakaZ9t8wIPEqoQAyFlq6K8GhSMD3yQ3F9TiafGGhcenhViUNUJ1
 qBtoZqaIuu3VL7wG0KS7kcz7oVawZHAI89kN24b7X8QLFEYXiiBBjvfbJFgXxM0uDPDY
 zqVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KQpcA0Em
Subject: [Buildroot] [PATCH 1/1] package/liburing: bump to version 2.5
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

https://github.com/axboe/liburing/blob/liburing-2.5/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburing/liburing.hash | 2 +-
 package/liburing/liburing.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index eaee8fcfa1..30458c6b9f 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ca260e7a5820c2d0e737ec1e9b999f10776dbe84a169a02a0eff10c8eeaf3394  liburing-2.4.tar.bz2
+sha256  319ff9096a5655362a9741c5145b45494db810e38679a1de82e2f440c17181a6  liburing-2.5.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index c35fb39390..2c448d6a87 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.4
+LIBURING_VERSION = 2.5
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
