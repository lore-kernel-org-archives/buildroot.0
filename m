Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD49C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE08982893;
	Sun, 15 May 2022 09:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh3Ct0kOLPX1; Sun, 15 May 2022 09:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0482C827AA;
	Sun, 15 May 2022 09:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 206391BF588
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 09:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D22440A6A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-93SjgvdFtP for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 09:14:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08AEE40A42
 for <buildroot@buildroot.org>; Sun, 15 May 2022 09:14:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso6785696wms.2
 for <buildroot@buildroot.org>; Sun, 15 May 2022 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=woBPTNvNr1h1IcGg91qLxSNfWyc3pteB0YewH4+Bi6Y=;
 b=kzrOysVQ4YmB/G08ePTWFkrJRxCo6rNvq8mA1ZHM3rRJ6wv1lN3la7F1rEN2lqFO8r
 WymIo3JrxfVnJJBk9K1e9urazVEtx0qqcL4pZqWNlCH2rmridxzgClz34Tbmvg0OkdBC
 WcbJvimoTxiqTOCGWaW0oAXbN//xHbLZIiHn/qf3pORSv6SwJFnWcgMoR4P9xmnDNs2L
 cMEfMpXTERRnFDdXG8zjso686V5OvYv/SlF9LLQdjUG0+2H9obUYa1pYGsIJCvlGuuJN
 kCt8NCgHIHnR6u5FqHrTwZXO2sJIdDThDuYTR2zbHOIFnhp4MfG7UrJ72glLY9xH0qWY
 0hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=woBPTNvNr1h1IcGg91qLxSNfWyc3pteB0YewH4+Bi6Y=;
 b=16Txi6bjIOUMmMa8Wc9x6M33cUtXc/cq6x8xMSpw1bdMhF5TziQfY3lYwA87R23WRA
 8IHefuagjPqjonCrugvHa06MyqmAKmJ6qoM7l0iAzC69rGevZVlSfaM2Alz1QW+aFGul
 x6FszpexB3IefaItjUc1aa9xTrGmIOBhLB6uvmmbYn8WhOdbAf83o2aE4lVrYv5+OYFk
 hFvc75D/nFIWXuUWL0rs/9bNHKi0miO2mtF6g3vRDmMPBsefq1e5dYkm1h54lOYwHEfV
 /3opCIXDFjrMJ8AWNKERgKZ50ZsOf+d2iGO2RIRCLxUCZeLxWHPeCWikXNBlPK6W2DRH
 1nig==
X-Gm-Message-State: AOAM533pcKky7/FfS8HISGaf2etoaih7WW2e/LOODf6dWe3BiQpooWFn
 qHhhNYbE32cJh01ABVvZ459ii68xcjE=
X-Google-Smtp-Source: ABdhPJznqDofbYXKUtDaM9Zo/FQIRA2KR3r+fuPWqIXqKWSgeZNhMa6n1LiyGrnDUnZwZzXGFzsSeA==
X-Received: by 2002:a7b:ce8f:0:b0:394:46ae:549e with SMTP id
 q15-20020a7bce8f000000b0039446ae549emr12180439wmj.54.1652606072004; 
 Sun, 15 May 2022 02:14:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c65-20020a1c3544000000b003949dbc3790sm7083544wma.18.2022.05.15.02.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 02:14:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 11:04:57 +0200
Message-Id: <20220515090457.396038-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/git-crypt: fix build with libressl
 >= 3.5.0
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

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypto-openssl-10.cpp:78:18: error: field 'ctx' has incomplete type 'HMAC_CTX' {aka 'hmac_ctx_st'}
   78 |         HMAC_CTX ctx;
      |                  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/98747d470c2ad59280934e160d24bd3fdad1503c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-libressl-3.5.0.patch  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch

diff --git a/package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch b/package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..7daaf9c8fc
--- /dev/null
+++ b/package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,56 @@
+From c21cde9010175e2355df17d4e81fedd6020603f8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 May 2022 00:03:51 +0200
+Subject: [PATCH] fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+crypto-openssl-10.cpp:78:18: error: field 'ctx' has incomplete type 'HMAC_CTX' {aka 'hmac_ctx_st'}
+   78 |         HMAC_CTX ctx;
+      |                  ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/98747d470c2ad59280934e160d24bd3fdad1503c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/AGWA/git-crypt/pull/249]
+---
+ crypto-openssl-10.cpp | 4 +++-
+ crypto-openssl-11.cpp | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crypto-openssl-10.cpp b/crypto-openssl-10.cpp
+index f0f2c53..a7a5d52 100644
+--- a/crypto-openssl-10.cpp
++++ b/crypto-openssl-10.cpp
+@@ -29,8 +29,10 @@
+  */
+ 
+ #include <openssl/opensslconf.h>
++#include <openssl/opensslv.h>
+ 
+-#if !defined(OPENSSL_API_COMPAT)
++#if !defined(OPENSSL_API_COMPAT) && \
++	!(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
+ 
+ #include "crypto.hpp"
+ #include "key.hpp"
+diff --git a/crypto-openssl-11.cpp b/crypto-openssl-11.cpp
+index adf03bb..32c2483 100644
+--- a/crypto-openssl-11.cpp
++++ b/crypto-openssl-11.cpp
+@@ -29,8 +29,10 @@
+  */
+ 
+ #include <openssl/opensslconf.h>
++#include <openssl/opensslv.h>
+ 
+-#if defined(OPENSSL_API_COMPAT)
++#if defined(OPENSSL_API_COMPAT) || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
+ 
+ #include "crypto.hpp"
+ #include "key.hpp"
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
