Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DE1C7619A
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 21:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD46822DB;
	Tue, 11 Apr 2023 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD46822DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZ4Fmc0kavvY; Tue, 11 Apr 2023 21:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3096A822B8;
	Tue, 11 Apr 2023 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3096A822B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2382F1C3C0B
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03C0A822B8
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C0A822B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-Lg9D0GLhUU for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 21:24:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8FD0822B7
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8FD0822B7
 for <buildroot@busybox.net>; Tue, 11 Apr 2023 21:24:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v29so8937956wra.13
 for <buildroot@busybox.net>; Tue, 11 Apr 2023 14:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681248246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6iimkxkHZI96/EpKSSa/XRkAF89GBcRPjQEKaVxLW0=;
 b=rP5tCLAss1E2ABnXzgNxE2gctTiFNHhiMF1ny2iQ33HDvlvnkTro8nGrvSgmbr20C+
 HB+ZZle4Fj8AAXC8nf4Gwy8XRP4341juDc6ntkKXVlZ7mKhyRJXTGTLtms7EWRw07tf7
 hdtohGmvfcfuvfXOeSXbagKRLw+fINgiHhGH0KPRysc45XF1nFtrJvLKkyQRMEOccTL/
 IWTSmw7tJw0Ro+YX30p/89EKxp/RedJQF/rriYlZdlSmhd70fAEnHfRfYR/X4hXbE0f7
 DWVs1R1svJAPAcTyCGhBEmWXtD7LxDdH1xLuR/H8iLkBVX88Gh4PPKFh1To3GUgLHAzd
 4oIg==
X-Gm-Message-State: AAQBX9d5slbCh+jMHDx7xkS/V0T2N2QfjsX4wn9h20REXRhq0Kfpt5qq
 Qzmsz1kcVZGtMEMAPECZq5VY3A9iiL4=
X-Google-Smtp-Source: AKy350Ye5ADgTT3N/6bz4KLuT/3rxrB9Iu6yixGOGnXXJ7RQPQJgLbpNyIu3TQ/faFEmP0SckGe+YA==
X-Received: by 2002:a5d:40c7:0:b0:2ef:a7d:54fd with SMTP id
 b7-20020a5d40c7000000b002ef0a7d54fdmr332654wrq.32.1681248246219; 
 Tue, 11 Apr 2023 14:24:06 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfce85000000b002c54c9bd71fsm15425678wrn.93.2023.04.11.14.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 14:24:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 11 Apr 2023 23:23:54 +0200
Message-Id: <20230411212354.258843-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681248246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j6iimkxkHZI96/EpKSSa/XRkAF89GBcRPjQEKaVxLW0=;
 b=dw2JdbT5CTSRDEMwBEnC1NCBuXa+5APYbb5gsOYl0k5mF8xYMe6qvaHhdzsduJ+1ua
 uUTxIfVpdVlI3bipvWZo7Fp3kKoSkubuCm92PvlLgUTrdYa1xKFg3STUz3t/d7LBV8iB
 l7zDkIu4DVJKeG86MfqFpDZUMexgGUQ/t9Mz9Nub1IhvoyMgIwpSzI79UFwqyEiMf1ec
 05UgEdv9zjs7x4Wj7slZMFSIzT97fjzHUOJ5rEEjo9UeQNEzXNsV8r8wngIWHkO7tc62
 ebnneRXep0kSg0/nRKcb7KJsVuIIJEUTc/sNxB1spR9x5iMUORgUrPVRECeMG7TljLm2
 SDVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dw2JdbT5
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.7.2
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
index 907b9cdd0..03ec1e10c 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  4be80fff073746cf50b4a8e5babe2795acae98c6b132a9e02519b445dfbfd033  libressl-3.6.2.tar.gz
+sha256  b06aa538fefc9c6b33c4db4931a09a5f52d9d2357219afcbff7d93fe12ebf6f7  libressl-3.7.2.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index b5fae7e26..ae3a24996 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.6.2
+LIBRESSL_VERSION = 3.7.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
