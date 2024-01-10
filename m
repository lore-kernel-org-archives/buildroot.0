Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D81C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DECD400C1;
	Wed, 10 Jan 2024 21:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DECD400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0ZWx3EuNqVP; Wed, 10 Jan 2024 21:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1122740143;
	Wed, 10 Jan 2024 21:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1122740143
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B87A1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34BD083AA8
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34BD083AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YK_fZvpVDOuj for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:56:59 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4823583A52
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4823583A52
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e5a5b0fb5so6584285e9.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 13:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704923816; x=1705528616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aUGymvnJSgsm0O+Wgz2eEg5js0eCQjGlSEQ1G/iKd3g=;
 b=VPItr+cCrGCa8O6MLEq3tpjdSO3kHRqIPPmqNWssq2KOs8MUtpflNO8zaDqBR4r1e5
 teBO21q1R8LMzS155HEG6WpZ0QuMQVwmMKdMkU+ApA0+n3vpwM+U+m9lrdUyZcSR5+0H
 kj2RyYvqMUzLPNxoz1XjVc7XQ84L7U3XuIE31LEBwkU/Z5ORhjFTUX/YMblKXalfOQPB
 bNtuAdlodajkpylHU+SdDBkK3fEgYnsfDYmVnbsxnbSfDxeTHUA6TNkwIGXcQgAZrVAI
 8je4x7IFvgmrUFSj6XJB64e9hQ+rJ7gQ6Yb2quOGe8zm6ENCL8E2YWtYflq7vRMK6S3V
 /9Nw==
X-Gm-Message-State: AOJu0YwG7vaDvqry0LUv/50CcMwX/N8bFWE0C+GXH0EscOi1oVZrnuwX
 NMYTDyAVq8MMEaCiV2t4nXFcB6ziAbE=
X-Google-Smtp-Source: AGHT+IHCvTklOubxv61qbI9ABQstPNE4eAmlM32Ygg8kb2HWgm4bXW/XU7wgc+pMpaeqK2V7lscwWg==
X-Received: by 2002:a05:600c:4f01:b0:40c:6b55:d9c0 with SMTP id
 l1-20020a05600c4f0100b0040c6b55d9c0mr43372wmq.167.1704923816500; 
 Wed, 10 Jan 2024 13:56:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b0040d6d755c90sm3519992wmq.42.2024.01.10.13.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 13:56:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:56:54 +0100
Message-ID: <20240110215654.1264973-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704923816; x=1705528616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aUGymvnJSgsm0O+Wgz2eEg5js0eCQjGlSEQ1G/iKd3g=;
 b=D6WbWuKbMqCfKoKrJzmzHEMEe33j5/b2XTtv0iEcnUDgJYpXuLliLW7H9Go9uy3+EC
 KMxijs13gQieReLpg4WPz9sAbYehT/73TGSD3CZuUgEtWSv4r+7BNkGvwPrs9TMabfSr
 bIgSzfRdlQLd2IhBZfY16K4fi1ELixIR5f2SXVO3kDahYEc4GrnUkYAn8YFiK+XeLpWI
 msEzkLwnQLmT3CEcv6IwFl3EcZFPu0uPxssWNFxEGhgnRrJgCLbbAx0+w5aoii3Vb5wE
 hbT+Ve/a2MgVmi0YQurSUj4V5Y2Pffrfr5cVg3kwptRRWxFf/iITMPFOmmiX5eKOh+/j
 oEuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D6WbWuKb
Subject: [Buildroot] [PATCH 1/1] package/kvazaar: bump to version 2.2.0
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE (new line added with
https://github.com/ultravideo/kvazaar/commit/7856583ee05f627bbab153bedb68d586ccb3750d)

https://github.com/ultravideo/kvazaar/releases/tag/v2.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kvazaar/kvazaar.hash | 8 ++++----
 package/kvazaar/kvazaar.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
index 20b8e5918e..4956fc7091 100644
--- a/package/kvazaar/kvazaar.hash
+++ b/package/kvazaar/kvazaar.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a76998462924ab8409cf8de4947ba5a5023daa33207676e9c4eefc2bbd46c834  kvazaar-2.1.0.tar.xz
-sha256  4caf7852236f62bfd77aac10a7b9a42372b00aa461ad8912780cd865a39062ff  LICENSE
-sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.greatest
-sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.x264asm
+sha256  f8fb72184f10b2fac295452bd0d5936d4449ed849754d5d1f3e7035998983573  kvazaar-2.2.0.tar.xz
+sha256  3c1dc3d7f8a3d08c14f4fbe9942f45764d8a21a3296e8d83446f33fd65f21c38  LICENSE
+sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.EXT.greatest
+sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.EXT.x264asm
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 17e2ea8caf..6bcc6066a4 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KVAZAAR_VERSION = 2.1.0
+KVAZAAR_VERSION = 2.2.0
 KVAZAAR_SOURCE = kvazaar-$(KVAZAAR_VERSION).tar.xz
 KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAAR_VERSION)
 KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
-KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
+KVAZAAR_LICENSE_FILES = LICENSE LICENSE.EXT.greatest LICENSE.EXT.x264asm
 KVAZAAR_INSTALL_STAGING = YES
 KVAZAAR_DEPENDENCIES = host-pkgconf
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
