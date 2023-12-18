Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58435C46CA2
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 06:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC0B94010C;
	Mon, 18 Dec 2023 06:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC0B94010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyruWZt4yYGe; Mon, 18 Dec 2023 06:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9244E40364;
	Mon, 18 Dec 2023 06:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9244E40364
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2ED1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 06:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7297D40364
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 06:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7297D40364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nmh0VHdTvSXq for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 06:54:50 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DBD64010C
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 06:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DBD64010C
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cc64629c16so14706021fa.3
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 22:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702882487; x=1703487287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t8iwvev+lgQEsfUseGTBmD/RzeLy3LNx6l/Skjk2o4o=;
 b=L5BLddp3rnRUSApLtL7h+bProquUhFpxGXWCmRUGpEgEyDkuhKD87HZSG8LBRuxTKP
 fPaFSLgzBSLovFAvfByReCBnGSnPrTQRVmpPaOksoT2pbeiY6fSupxDxAPDfbxzykLmU
 6JaB0fvsjC1JCNtR1kLtrXDZt6G+4hswvd0s9GKgbP0NRzgAgJ5ZgM9vHKRQdONUhNQ9
 VfD2sVnsmBqpIH0ZIQzF+AzunjYt8R6z8aRDJS0ny7qSIpcVEJ+yE3m7dIaisPdXRdYJ
 9EJjpW/6AvIwGuZ0nRCWVsXQgxcQSrjhAop1R0EgoBPGvtEuNhfqvqiU1Lgfrg66Wfu/
 d0NQ==
X-Gm-Message-State: AOJu0Yz7+SmtIY1x+h1bGRDIrnONDLaPlpKQYBH+jaeOs+3c2lD3nfBe
 M3C5GAUKxvbK2LnEUTGvDh6J+N3xi2E=
X-Google-Smtp-Source: AGHT+IFBqECevFAIrnk4co9clG+gKvV7Td74JarpvrWGNpoMVy3uJkr81UEuuFNsREiWPfbFLJ3nwg==
X-Received: by 2002:a2e:9ec4:0:b0:2c8:39fc:acf5 with SMTP id
 h4-20020a2e9ec4000000b002c839fcacf5mr6497557ljk.2.1702882487306; 
 Sun, 17 Dec 2023 22:54:47 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 bz8-20020a05651c0c8800b002cc72c38d8asm206227ljb.107.2023.12.17.22.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 22:54:46 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 07:59:16 +0100
Message-ID: <20231218065916.159076-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702882487; x=1703487287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t8iwvev+lgQEsfUseGTBmD/RzeLy3LNx6l/Skjk2o4o=;
 b=cijcrYPx2iOs0ZADaJ/f5SicoHJb6GZdfkMv7oqLzljx3J2X7vB4es1IKGftao6UL2
 1SrG3s8ozwn04CfAHXZvb/QrzzRR3lyjlwSvNc/0jpIEtD5T5MlcFiVSOUQcRDPxXEPC
 3WlKJ+nhwvmpQWotnS0jXy0X2jBWHkN0t71+inJa3BCzWKCZVjjqongIQ8UsuU2NdppI
 bbvW9gSTMszxLEJ3b2Sbg206XBjRcEtDEHrGh4y+PRcjbxD00qJfN5WRckKOAfaop9WP
 zuJS0tfM1X8OP5vmk5iZ1VAPxmUKO/37nPYcuLFn4a9HoWTiCWKKsyRRpQ5gKi1CqNI6
 VI6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cijcrYPx
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.8
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 2d8284a99f..d4645c593f 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19cda718705f7ac8c018c939c38b1bb8412deaaa04862da98cd9fe9243f073bf  libostree-2023.7.tar.xz
+sha256  b6fffc267188e40d60755e6d7f2be65831795baa53b0fd9dd6c6809c7e54796d  libostree-2023.8.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index c1bd5886bf..d13f484041 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.7
+LIBOSTREE_VERSION = 2023.8
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
