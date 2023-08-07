Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD937EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5274080BA2;
	Mon,  7 Aug 2023 08:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5274080BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzsXRbdqI-QD; Mon,  7 Aug 2023 08:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7A180BFB;
	Mon,  7 Aug 2023 08:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC7A180BFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1C91BF868
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C0F60DFC
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C0F60DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbAvWyRtoBcV for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:13:45 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 927A460E6A
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927A460E6A
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe5ab64a26so4268460e87.2
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 01:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691396023; x=1692000823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ZzGLwqCHj1GLReM/II1mPvAKjAnUttoDmUJgAW4I5o=;
 b=L5chxxhlYX4cxrsisllvYKKE02YiqGEl7XRw60IxYQrwOduOL6f0J8J+gWArjMGYNd
 FqlSUYiXFuNhvgewR57TaUJcqNqBpfrA2IZalM8MkBEjFzUp1KNi9f+s5DrFx1kF3aBV
 Xr2fcbU+UI2GlQ2BRUrt9rCeT2DjXmO93wXPSWKVHx4s1UliCf8H3ygvaR+HvVHA6w4j
 mnni9UNxkNrhzhPBeeiBrXLXo7a9hIip2CXWYk0YEZTBVGiZ7dCurjK0fIt6GYV5CCdP
 AZv2ZB+1QNfiuKrPWQMuFruDkqFB2AyN/fJftLNZvriZZSAwWs1hEbknDvSiZTG4/vNB
 xdsA==
X-Gm-Message-State: AOJu0YzK3z3LTNzJUiA30RCZFsroo15w7yJ7gG5AzoHS1FprWAKolHFE
 r0TJm/5zKI4JhcN3ytYzn6Hd8Uri48kLtk40
X-Google-Smtp-Source: AGHT+IEBNZiMg1r3in9nV6k+mUdL/W/QW5hfrG7lwFlr/QOkOcbb6k5EbPIFTu41sjHs2jxfQs3WOQ==
X-Received: by 2002:ac2:4f0b:0:b0:4fd:fafd:1ed4 with SMTP id
 k11-20020ac24f0b000000b004fdfafd1ed4mr6864741lfr.2.1691396022507; 
 Mon, 07 Aug 2023 01:13:42 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 p10-20020ac246ca000000b004fde7ef2435sm1418987lfo.102.2023.08.07.01.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 01:13:41 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 10:15:36 +0200
Message-Id: <20230807081536.4167754-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691396023; x=1692000823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZzGLwqCHj1GLReM/II1mPvAKjAnUttoDmUJgAW4I5o=;
 b=C3bt57UDVfEdU3RIPvVkiXSRCJJdd8ExTQcZUEkU0QXbk8/Jxyg2mYAONoqtEVH+PH
 YPGNEQNdCFdBrohrvVKiDUSkf4nQmCpe1XtZBQ0SmU0WlRzVssEj3clMjWkAate5z9Sa
 6tqgz3GVfcz4syQAmXK/98G6bwSvQsTnzNXNIkqGFO9PuS9th9ypU6Mbe2zchgCgjedH
 tFU3RPLNE8jTv1yNvYH3krRystApPxhFJMBMqh28w/QvJ0kKUFev0XUIvSqKNECCe290
 TIc26g0s9gcibiNLfR0KO/zT1dui5MhgxIyh1n5/vFzex4IVAccJYplde2oCPSZT9U5+
 4qsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=C3bt57UD
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.5
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
index 088650a86f..3b88b8200f 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f333b1  libostree-2023.3.tar.xz
+sha256  bc593afb31fe1ac3d50419f917fafe321a0a3561d7bb2ba498a83740fe3adb14  libostree-2023.5.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 5c39090654..c61c1d1508 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.3
+LIBOSTREE_VERSION = 2023.5
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
