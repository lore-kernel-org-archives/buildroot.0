Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA0AC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25AE941DDD;
	Thu,  4 May 2023 07:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25AE941DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngJa3L4Q3bPN; Thu,  4 May 2023 07:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD2841DD1;
	Thu,  4 May 2023 07:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD2841DD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9FDB1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFE3460E77
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE3460E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkjUpvqRGObE for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B8760C1C
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0B8760C1C
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:30:26 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a50cb65c92so738765ad.0
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683185426; x=1685777426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4WJqKombhh9S3BEJ63UfSkIioerj76rSGKiPMij/TVc=;
 b=da2mbaXTQSjJnDFHsu8pBbJ7wCTWQD7eNNW54QNgcFpbOkSJgBBmMYMmkbIF3RAIAP
 5l852hUAx/ljR1mu/GuKFfDGogN1k/ZZxnB9uShQkCEvVPSQh6epYwqdLtiEYULSD4lH
 wz/XKYEDuGDL14tEV9m26RiHKLGyZSM+79PeWFDS7N4YSXlz4m4lFBcgkrKFO0Kcchmv
 zgGQRt28LWEdYuNME2kcbQVJqp0gz+un0vJxsiIWF6xv9ELig+gxiEoqdQJkRKdT21G+
 7LXW9Y9H9np7U62hd7Dn8irDj8zXTHP4HMxFA/Hcbn/Om4NJFymnHXW1s17e0/0A7PgS
 IPyg==
X-Gm-Message-State: AC+VfDxF59y68yphw17JGOblOxvqnCa9EmIk/7nAFai13IsIol68HPz7
 2HbLjqoZd0AQOAu8GI5KPrRlbyMikKtWEU21uLk7M8XiCn0=
X-Google-Smtp-Source: ACHHUZ5e5TIIW3vlwQotwjX8C/vJuUQbUazprF3dtdSMQ32ia3RXGIlmJwXi/W45c7cHxYPi5byrsw==
X-Received: by 2002:a17:902:e547:b0:1ac:2cb0:4334 with SMTP id
 n7-20020a170902e54700b001ac2cb04334mr1255513plf.33.1683185426156; 
 Thu, 04 May 2023 00:30:26 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a1709028e8c00b001a9567dc731sm20156683plb.24.2023.05.04.00.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:30:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 00:30:21 -0700
Message-Id: <20230504073021.3450679-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683185426; x=1685777426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4WJqKombhh9S3BEJ63UfSkIioerj76rSGKiPMij/TVc=;
 b=HnfIKYPL/PG6djNGJOiC5zB39zu8hwifFddVyuGhwN30wmcaufz98po4gwebPnAAR/
 D8hMg6W5DLm7G1x+S3ZP2pZ1n/DEhavnNtM4JNO1jYdKhh4DXwRsWEzV7KH90+iZF91I
 g2ncjmWLkRa+EgEXU//oPYjUoYH2duYhjUoPFqW/5dEvRmgLlxrgt4zQX3GXXow7iIdK
 CHXttwz41ZNhJgpz+QvNKQcrZeYTr0L3dYDDT0SxVjf47odUGtUo4J6zEs4A7TdecT1H
 g5+L4dmB0qT76Wx9dEdWoM9WaMdvcL6zoIDUJU3FIgzIuwpy3x/fi0t5Ehwwi7lwUwmw
 c3lA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=HnfIKYPL
Subject: [Buildroot] [PATCH v1 1/1] package/mbpfan: bump version to v2.4.0
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

 - Add support for alternate SMC path used with newer MacBooks
 - Improved systemd integration
 - Removed developer tests which confused users

https://github.com/linux-on-mac/mbpfan/releases/tag/v2.4.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/mbpfan/mbpfan.hash | 2 +-
 package/mbpfan/mbpfan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbpfan/mbpfan.hash b/package/mbpfan/mbpfan.hash
index 9195692d52..5b67744a00 100644
--- a/package/mbpfan/mbpfan.hash
+++ b/package/mbpfan/mbpfan.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f690e9302da4cf97e582606614d91e1ee4ac495a4939aec7c0b3468c8988eb67  mbpfan-2.3.0.tar.gz
+sha256  e1cdcffaba52be215ae40a8568949190866d500d6ae2a1e96b71ab5372f3580b  mbpfan-2.4.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  COPYING
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
index 52d823cbdc..0ac161b327 100644
--- a/package/mbpfan/mbpfan.mk
+++ b/package/mbpfan/mbpfan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBPFAN_VERSION = 2.3.0
+MBPFAN_VERSION = 2.4.0
 MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
 MBPFAN_LICENSE = GPL-3.0+
 MBPFAN_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
