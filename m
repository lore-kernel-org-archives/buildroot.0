Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6F8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CA5D827BA;
	Mon, 24 Jan 2022 07:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sULsAHXtRapz; Mon, 24 Jan 2022 07:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABFA4827A1;
	Mon, 24 Jan 2022 07:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48C731BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37A4040916
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxqeX3s5SgGB for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0927402E8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:37:14 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id g2so14609455pgo.9
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xiu3tqKjaHMpUE0oQJHbZNGzCe3DFXNNofrKzieCbEM=;
 b=4pVMGz0pyV4Meq0bT30malRBFoC9/53bwgjeLGAqJwacuvkFJ2L4nbkZNQi3M+7MlS
 XLpfSQ13cf3yvIEgUjdSkOl2VVUFLIwz4gCQowcJ0HI8dd9Zud+ZHBBzGM4N4ToSkReu
 fI/Zcbdtbl6VlZSUvn0Lyk6lxbBKcaW8q/n2pPYhgr+V8ypA4lKWBh6JCRYu4Wd+9sJq
 HH0umNaM+dl18TDKmgr4GrR88obVjcLPdEpVhUOICEmKcrFpRr78YxcLGKn+EVJhDjFY
 44JxYU0+OM/maA0AY249qvkZWaOtqwDLrzt6hrBEmhgqvWM6XumEo64etHVra+iz3eO9
 O9fA==
X-Gm-Message-State: AOAM533nqdnPCeDJwDdiZxwcMczASpP9QiNuKVYI1W8Mp8D9JiRD8b/u
 aizXXz+3ikyYPtWhZH8FjVrRGfQLIupFQA==
X-Google-Smtp-Source: ABdhPJxPdThdZedPiDsZcQcw4Usfd4s/QWYN2vtxOSDGG4lr7c/kT0clUgu3ggLQO5pv5iTjrT2VIQ==
X-Received: by 2002:a05:6a00:cc5:b0:4c3:832a:1180 with SMTP id
 b5-20020a056a000cc500b004c3832a1180mr13276865pfv.10.1643009834025; 
 Sun, 23 Jan 2022 23:37:14 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 j11sm15745239pfj.13.2022.01.23.23.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:37:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:37:10 -0800
Message-Id: <20220124073711.44684-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump to version
 20.10.12
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d1323f507d..ec3a242629 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6fa7835bf7c17c293621967bd5096642fa1e3e1b597fbc7d7bd35f455d886495  docker-engine-20.10.11.tar.gz
+sha256  a8ee80d31c7b74f687a837cd2a8570578f118179fba0844c5ee88f90fe180155  docker-engine-20.10.12.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 45fa7fa53e..2a1239b676 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.11
+DOCKER_ENGINE_VERSION = 20.10.12
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
