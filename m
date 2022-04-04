Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C195409EA;
	Mon,  4 Apr 2022 21:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voRG4N2ueWZY; Mon,  4 Apr 2022 21:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4A040934;
	Mon,  4 Apr 2022 21:47:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 242A81BF23C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 125F0607C1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDAMunP9bzhg for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 21:47:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5678D607BC
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 21:47:24 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w21so9397998pgm.7
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 14:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0uGivkKLZWySw2wHrYYpFQT2lTC0JfmIbPCmWcvZnJY=;
 b=RFY3A2UzmyK7+Ek4x1LX6PJ1WJbbtfhRSG+Qjfs98927Z5m/mP0x42Q8sFomyY5TRM
 Ouf5ZpQrLhFCdsLspLTxLfYdf1R2D8yw8pSw8/Y8pcFJEAIFt9XE24KEhGMZsKPWw46+
 IuSIUb28lW1nNRxTKpwI4sduLdpUpQJEB+6DiVEKDI9GO22Qa+CgtJ3j3tK6LtgRM5tk
 zDOUDyNMav0j7my+jWPdO6sVWm43IAqI9JOIXjvuMFrKrGfrH90LxYKRghREaSYRqfo7
 6bDcsFPqc9RYGCYMMEGv73mszi3BMml+mzCnAhY2ntb0gcJ73+9KYHdVrLRdAo5ijsus
 SNGA==
X-Gm-Message-State: AOAM532xTAE459DSwzK338TxXpARLB4POCpM8ZIu8j2UlEUbWytKRcyv
 +04aarCXqMBDN7cDBX0dOO5mt1rJIYqgZw==
X-Google-Smtp-Source: ABdhPJwxFunsyWeFNB76kCDjGBUiCS+NIpFbIemTYtCWVOsiQotwK5gSysn4iJLhrsqGUA/MrBIXrQ==
X-Received: by 2002:a05:6a00:1496:b0:4fb:34a7:dcce with SMTP id
 v22-20020a056a00149600b004fb34a7dccemr191582pfu.70.1649108843565; 
 Mon, 04 Apr 2022 14:47:23 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 om16-20020a17090b3a9000b001c7bc91a89bsm93270pjb.52.2022.04.04.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 14:47:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 14:47:17 -0700
Message-Id: <20220404214717.587193-2-christian@paral.in>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404214717.587193-1-christian@paral.in>
References: <20220404214717.587193-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: bump to version
 v20.10.14
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

https://github.com/moby/moby/releases/tag/v20.10.14

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index ec3a242629..d4fe83a806 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a8ee80d31c7b74f687a837cd2a8570578f118179fba0844c5ee88f90fe180155  docker-engine-20.10.12.tar.gz
+sha256  dbe1ae342351108b7b30232c4bce0559c81ad9fb6c978d7c8425d6aa53e476c1  docker-engine-20.10.14.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2a1239b676..3aef31599f 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.12
+DOCKER_ENGINE_VERSION = 20.10.14
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
