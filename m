Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A24AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B09A41DFE;
	Tue, 11 Jul 2023 22:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B09A41DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSfBnMT_LKQ5; Tue, 11 Jul 2023 22:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F28D3418F8;
	Tue, 11 Jul 2023 22:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F28D3418F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5B7A1BF420
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD92940910
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD92940910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_KdQB4yk1Hc for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:43:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA05C408B6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA05C408B6
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:43:35 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b9cdef8619so21503045ad.0
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689115415; x=1691707415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gXVWjGkLUMYGCbCCw9W9ivNT/MeYQOs4VEexmClE8Q=;
 b=P0MKe/Vg276AJvfYtMrqSMxuSHd61XwHUvs4256fNADLIAv7Y0jPjmvtWdQei8PHFt
 OghV5nTHog6ywma6KcsFpaLyTIO20+wmn43dlTWUSqjt4nMwWLObXpeREVc0achpKgdU
 NEMcdJUwQAcrwr272aQI/jzbrQZr9u36tADRVOU9Z5KdPXJq/OmmdVnfZaegI8y4WOpW
 dEyMiZZPgqh4y2L88aupG8SSXj1dU4TTKBKwjKWAI1Stp0nMVU+ubb4XI9t0ER+Sjn5Y
 L8eJDIY+TWn6dGseF0U2Or0wvhV9ILt+4yX3LeuVaq1de3aOphTnlQ33Sycb9N12YXrP
 WJvg==
X-Gm-Message-State: ABy/qLbQQOjFSRp0Rsmis5B214WagxkylDbyVK15C6TjohhLgi0zlvwI
 PNYF+sGYMzp/BmFNTh3m4/bL12IW8gfoyCBagw4+0ZcOC1c=
X-Google-Smtp-Source: APBJJlGKGoqoXNtDzvfdMH1BB/NGO/agL5e6C4cQOhJ21GM6+2mDxseaHxf70ramfwNnyPH6A4ozFQ==
X-Received: by 2002:a17:902:e811:b0:1b3:d4aa:461 with SMTP id
 u17-20020a170902e81100b001b3d4aa0461mr14782038plg.44.1689115415001; 
 Tue, 11 Jul 2023 15:43:35 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jd10-20020a170903260a00b001b850c9af71sm2441204plb.285.2023.07.11.15.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:43:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:43:31 -0700
Message-ID: <20230711224332.1799239-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689115415; x=1691707415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gXVWjGkLUMYGCbCCw9W9ivNT/MeYQOs4VEexmClE8Q=;
 b=CSWUNeTFbZ8mYBTh7VI3E0OGaJJhtU941ONoE7gUe3tYIlQffuI64+UPGR/Au7A51G
 QMS9ZyzmBEieR9nKyzKSKmbGMhPX+nuvR+w7kkS/FsSoBsdaQGwltDJtRcae9Q5zfJMi
 7sdB4mXsywukQC16kDF3PL92iZPVfw3XMFiVXZ/6AHsWNxNUKZKSfhuaV5kIPTZXSBHK
 dQ+UTjRqoH7wEthM+KqHkK32PMLli7f+otoDvzIQqSteFqZuFQ5TDjvJyeMCtxzfyrt4
 no35PO5Rock37zUbBvMFJ6XNpQE+K65xqoqEj3XXoWyu12rGjbQTleEhItAMiUYqeXsj
 UBhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=CSWUNeTF
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 v24.0.4
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v24.0.4

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index b6729ab660..3f1b9bd459 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f4bc7d7cc2ee3671371ae80fd624e61f0598e614b5c235012581f8ec1d593aa0  docker-engine-24.0.2.tar.gz
+sha256  84f6196fc58ae263376a4ce25b5136d567a93aa82e723504a29f0415bd1fa4f4  docker-engine-24.0.4.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8127689e9e..7c19e0dc52 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 24.0.2
+DOCKER_ENGINE_VERSION = 24.0.4
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
