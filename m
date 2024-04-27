Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685F8C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 16:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F30AD4019D;
	Sat, 27 Apr 2024 16:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHMmCVPZ5iir; Sat, 27 Apr 2024 16:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052B5402B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 052B5402B1;
	Sat, 27 Apr 2024 16:18:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9391BF315
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 16:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AE0E605E0
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 16:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnCZ1dKILXHO for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 16:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF853605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF853605D4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF853605D4
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 16:18:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41c011bb920so566435e9.1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 09:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714234733; x=1714839533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jVUjMKq87o71Gbl+E+Fbs4H0bJKfuzZYlE5RIOIr3BE=;
 b=TFGoIRBTmVVNUWGnCbzdFTgSrOc98gePzvfYB2BHjVPtRvpIz5wUIjZSxhotKU4pjV
 9C0LqaqQ+X+KcKXal71cH8CKuHFgZoN0kdhvAdpoUrZ2G9kUnA6HoOyOJoTBFUpbGvpW
 tUtqnnUWl3h+SCq1e+5/VZ7fjhTYYuJ3tTfflDvK18e32LGONKe9Q+NeIyOJZlKs90cA
 rLyVViFR1cdlhHGM5kvhr1dI47940dZBtrvh9hgDIkxNobAJSOnaEd3aZXMdBlKmw/33
 5ABJsjaP+9f0+1vFrCCpM24Aus4dtF8Qc0BP086C+6+DjQTpINgrLyqKksO614zPIV++
 J+wA==
X-Gm-Message-State: AOJu0Yx1mEhfFliO0v6SLWvvnnbDkh6FQ2DrT3x7gJ2sKPrt3/axfXxT
 ZDQvuZrdTVh6x7ZYcntt4ki7quqMxe8M4erCecZOAuOgYGfkNcEkvBHeDA==
X-Google-Smtp-Source: AGHT+IEjl0kNX3J9UhX2SaYbPhlnRo/Htv1+foOMY5cdHskM0B+VdNRLxoipT0m3DojSWVlWWyI4gg==
X-Received: by 2002:a05:600c:1e01:b0:41b:f43b:e263 with SMTP id
 ay1-20020a05600c1e0100b0041bf43be263mr673887wmb.0.1714234732851; 
 Sat, 27 Apr 2024 09:18:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0041b083e16e2sm13119817wmq.2.2024.04.27.09.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 09:18:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 18:18:50 +0200
Message-ID: <20240427161850.158702-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714234733; x=1714839533; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jVUjMKq87o71Gbl+E+Fbs4H0bJKfuzZYlE5RIOIr3BE=;
 b=b+cPNNygiHd5mdQrOAL1AoBWiSYl4DflmVbh8cEd0SY7wJL2uENqCXHzE8Rp6duwq3
 arlQIR5AGBqoFGoNYKV4+49o0Xs+/FbD+pHBtOG3wDSO3IZ8fMz6v1VTTAa+vozvVTB+
 jMgEAfeLreOxJNB11rOY4SI1InKp8Y4gCSEHz83gEDtqhTz3TY7R3E9hmNMJ4q8IwIwH
 QhqJSTom/L8KGPBDSlyA/K+TaTYehVSWkHr9kZHJiWGrSufkaZuLJF7BXRNIJwzICRzp
 6lVa6kqRODIqvhhHf67EzFp23VPkzzbz7PXGWfvwUp1MH8RG3HwxeUiRawQPX6tROp1q
 7i5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b+cPNNyg
Subject: [Buildroot] [PATCH 1/1] package/libunistring: bump to version 1.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://savannah.gnu.org/news/?id=10599

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 8267d56327..256fb651d5 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
-sha256  827c1eb9cb6e7c738b171745dac0888aa58c5924df2e59239318383de0729b98  libunistring-1.1.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.2.tar.xz.sig
+sha256  632bd65ed74a881ca8a0309a1001c428bd1cbd5cd7ddbf8cedcd2e65f4dcdc44  libunistring-1.2.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 8d5b6f54ec..05bdec71b5 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.1
+LIBUNISTRING_VERSION = 1.2
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
