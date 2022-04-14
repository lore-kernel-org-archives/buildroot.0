Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C456C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF75B4169E;
	Thu, 14 Apr 2022 19:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECXZAhpi05d4; Thu, 14 Apr 2022 19:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B697741603;
	Thu, 14 Apr 2022 19:36:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9001BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC5860F8D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iw_yM_xv-tsD for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6953160F57
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:36:03 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso6606655pjf.5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tp3pDbNaTqrxuiJdUvgd4bQCKbj7Wdw9AlJvpb3S9zA=;
 b=yyS1AjPaBBb6Y8xmr3eNBfxjdq6oCfIxlW5vO+YgEQiP/dYR8NmbQvfzv9AXl28xMu
 Fht9P05tsi3Rk4fJXlWdD8R9dAkk65iaK+O89Lgd0xv3gN1ENNBa9H9+hrbbetTX2Rk6
 A0KDZ3jUw7LwcjeXmiPF34AjmUT4KiQPdF3qpE6cZDUoy/5NDabzNZ3HJhZOLKdqhRxt
 YveoBKuBzx1i0AJntFnOaykbkZRbwKumrRcigxbZNIyck0xX4+tkGN2EW/cAKZV+p5r6
 kT/AQm7NyltExNpuJQ1C32A5NLKfgvlh+K7InedHseCi9xoBL3ctZIw4/z/RA2diAsY8
 EnMg==
X-Gm-Message-State: AOAM532SREjO817opIht+w/DE0OZWtrEcsLRlIDUrDsjYnRKP8moL+lo
 wj/z3jhmP9cKb9HnGxuTh8cQ6Da4SH60sA==
X-Google-Smtp-Source: ABdhPJzpNRsTpqP4NCT2kjGOD7nIL/ch/4QzgP12k7+OTc0iunR33V+ysXlFb/zvNOMS8eaKY3KFSg==
X-Received: by 2002:a17:90b:1806:b0:1c7:852d:e853 with SMTP id
 lw6-20020a17090b180600b001c7852de853mr178795pjb.106.1649964962559; 
 Thu, 14 Apr 2022 12:36:02 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 e13-20020aa798cd000000b005060757f625sm650042pfm.96.2022.04.14.12.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 12:36:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 12:35:59 -0700
Message-Id: <20220414193559.421041-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/docker-proxy: bump to 20220404
 version 339b97
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

docker-proxy (libnetwork) has not added a release tag for a long time. Use the
latest master commit hash from 04 Apr 2022 instead.

339b97

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-proxy/docker-proxy.hash | 4 ++--
 package/docker-proxy/docker-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 58de697929..84bfa5518e 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	866c8d196b9396a383b437b0d775476459ed7c11f527c4f6bbf1fd08524b461d	docker-proxy-55685ba49593e67f5e1c8180539379b16736c25e.tar.gz
-sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14	LICENSE
+sha256  335851e924078a8e274f0c27cb80aaba32d0c1059068740496f1eb31b55a6ec4  docker-proxy-339b972b464ee3d401b5788b2af9e31d09d6b7da.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 6600b24ed9..022aa1f949 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 55685ba49593e67f5e1c8180539379b16736c25e
+DOCKER_PROXY_VERSION = 339b972b464ee3d401b5788b2af9e31d09d6b7da
 DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
