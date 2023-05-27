Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8409AC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7ED6613CF;
	Sat, 27 May 2023 19:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7ED6613CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3bMGkQJLvhT; Sat, 27 May 2023 19:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2950613B2;
	Sat, 27 May 2023 19:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2950613B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF121BF346
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 19:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E1F384386
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 19:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E1F384386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYX9ZSt4oapY for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 19:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 201D084248
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 201D084248
 for <buildroot@busybox.net>; Sat, 27 May 2023 19:57:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3095557dd99so1888022f8f.1
 for <buildroot@busybox.net>; Sat, 27 May 2023 12:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685217475; x=1687809475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9t6ZtrZiw9Dt0weLwDr2objsGtiGDuxh+sMXiFd7Krg=;
 b=ZVPfKoUGxAiXKN7JCsC+Tv6Hq+8CurnXgCBjUkiaUVBKUydA7dZCQPl3vOw5Rd7n25
 SN75nJPgEpp8EfawtVdTR+TbeE2VA3889wB6k7/2Oi0OewOFS2johf1wWzWr6aR5QfCd
 mkS0vroL8oFOger5nVIpl4Yl3rSq7MIhY2K+3+DVK7yeSQK02/xlZxZ759JOdcZW8x8C
 aBEzv7bn+C40FaF968fu/v/MA937T7Ha7v0Zi6kLZPnpMv/VMrEC25CECTmkcOE1mNS6
 dctWKH2ruFnKOwqyAiGOO6NgY1Aa+v5pkW2c80GAdlXHKjo+nRW/E8yLsSxAuy2iIl6Z
 Z9MA==
X-Gm-Message-State: AC+VfDx/X81CBlyhK0mV0z7qLIhlnghe2NEh7Ojh7EO31T1Pl+PPoYAq
 FjJfzpDCaOcDxmhoDD7JyF1cDyMxZ+I=
X-Google-Smtp-Source: ACHHUZ6gcnG8QkJLRByLjpkVi4DGE0Rfdj0aLPd9HKIallkyiR8GzsHgFqkbpWDRkCA0tlVrJVnM+g==
X-Received: by 2002:adf:df12:0:b0:2fe:851c:672f with SMTP id
 y18-20020adfdf12000000b002fe851c672fmr4237381wrl.8.1685217475068; 
 Sat, 27 May 2023 12:57:55 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d604d000000b00306344eaebfsm8903018wrt.28.2023.05.27.12.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 12:57:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 27 May 2023 21:57:42 +0200
Message-Id: <20230527195742.18368-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685217475; x=1687809475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9t6ZtrZiw9Dt0weLwDr2objsGtiGDuxh+sMXiFd7Krg=;
 b=d760RMgTP+IW46waS1sJYQnFf9lFQKWXAN6osR+XQ2PhAR84wqBcEKWmGq8p+ANO+2
 dShKhSM+b/U8aNfmOlvBpn+/DPQWWd3ULxXKLqd5XyGfIDtcZfjryuPtki1KHozWxwHn
 iyue7Y3Cr2xn2TeTZI9U3EZ0QtoI4lSgBMxWQw+ut4Nf6gGz038ye5kN3l6ODjvioN9P
 hXZ9ViQ96+zKMVHHT3LPKJxoseSQ8WRwvCiuP0NO7YkGGcI6l/6pQJKVa6c6FIeGIxoa
 rBxYrqCdHATM3jBuy0sX1xDI5JBYGotxTzAnAX8F5zXJSwG4lO0l+3cliS/iD6a4oC5b
 woBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d760RMgT
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.7.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 03ec1e10c1..76a5acad6c 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  b06aa538fefc9c6b33c4db4931a09a5f52d9d2357219afcbff7d93fe12ebf6f7  libressl-3.7.2.tar.gz
+sha256  7948c856a90c825bd7268b6f85674a8dcd254bae42e221781b24e3f8dc335db3  libressl-3.7.3.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ae3a249969..1a63a0f348 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.7.2
+LIBRESSL_VERSION = 3.7.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
