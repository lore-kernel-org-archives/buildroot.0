Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 22:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0518F60BF1;
	Mon,  4 Apr 2022 22:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFRxFaYQd4M9; Mon,  4 Apr 2022 22:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62BFC60FF0;
	Mon,  4 Apr 2022 22:14:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEFF1BF21A
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 22:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B36460BAF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 22:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yc0qpxIUEK9t for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 22:14:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B87B60BAD
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 22:14:54 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id b15so10293148pfm.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 15:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=My+c8DRBiZc599na+59V9muJr5dBgl0Krf7luKnA7dk=;
 b=lysGqc8Xv7R9Iq7F9gmbriFhvgNN1qJbNvGYbx1g5I8Uww02SsD2/bjkHyLXFN0V58
 8Nulw2wkNW5JzDuy8qSjNDj8TrlmEboUHHkyXjB0Qij1WJBJsT6+nLB4HlmsLQnlykx4
 Eob6Mf3aRdAazgpB/WHF1dz7EgEL7wGkcsD2/bCU/TwpIbfGig7g4X1oMo4rh68w3dyX
 pYgP+Y7MMVSiukzb8JpSf7cfNk1d30FYVAbW0CyzCOwKzmqwD3hj8Xv+mcGB5u7GHbu+
 UOY9hzcoFqYDfiktjkOrVwEBu1q9pvZqYnu2uPElfX1T/pHQ6dlDoJIjH+f+NfrxmC9F
 eTgg==
X-Gm-Message-State: AOAM532mXfVhp7wY8kbxAuOh7DU72xP/9Cu165h+DpSSvxjwcMCMbZ8C
 2AyRMDkxx6HAE6a3z1+CIVlR+wWgcWh3tQ==
X-Google-Smtp-Source: ABdhPJyGlUAg2eAkQgrX2ZtEKqRfMMfxjbTnkRTrf87m5ruxCsqzPfkizJ+JqNcjn1x1jYehH8N7dw==
X-Received: by 2002:a63:3d4b:0:b0:386:322:ff8c with SMTP id
 k72-20020a633d4b000000b003860322ff8cmr249706pga.385.1649110494302; 
 Mon, 04 Apr 2022 15:14:54 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a056a00178b00b004fb1997b775sm14002107pfg.10.2022.04.04.15.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 15:14:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 15:14:51 -0700
Message-Id: <20220404221451.610628-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: bump to version v1.6.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note: this version adds compatibility for Go 1.18.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index d5aafe2e70..eb9f2894a9 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  40c9767af3e87f2c36adf2f563f0a8374e80b30bd2b7aa80058c85912406cef4  containerd-1.5.9.tar.gz
+sha256  4ea21a6b4649512366e7c31ae547ad89c6a69c6586a6d8565cff07898de344b0  containerd-1.6.2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 8976e12f1a..36f2db4125 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.9
+CONTAINERD_VERSION = 1.6.2
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
