Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E329C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 07:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9CF410E7;
	Wed, 20 Apr 2022 07:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmKn8-oA9tW3; Wed, 20 Apr 2022 07:26:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07601410E4;
	Wed, 20 Apr 2022 07:26:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F1F1BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47777840CE
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CemfaCNlGcbw for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 07:26:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D7882ADD
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 07:26:36 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e21so951932wrc.8
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoBxQledB46XRkEO/mRIBv04i7l3ZNaeIM3MBMgqlSQ=;
 b=jwXd9ol66nv2VedkmkqjUuxOKZUjj9D42+El1Mpt8J2UlfOmnmRmM/Lw6haDQtZ7Z0
 xv04XDavaGMyp+4EU8xysECW8ArtXwb9QpvjpUbmBPYUGuyfNH7fWM7BHqWkJRYGGVR7
 sQgignHI5bB+tX8owf6T1e+y5va9BByoSG+63kV7fcywWVwm+g0EpanTW/Ao0c4ldrOp
 2FBLh/l4WxBrZO9oTkpXu9l7SBnsxyLIgmG58YKicJ5fqYDVDcbWPaf1zo/uLBTWyN0g
 EHRnspc8iT3GsiSdaRR5soMxR22mszYbbB188KGhXHEFXzM8JeunfyTuKN15AYVUz+5g
 rw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoBxQledB46XRkEO/mRIBv04i7l3ZNaeIM3MBMgqlSQ=;
 b=CzD22XLtrcJ+yLr7iUnGwfST5gAlVDCy0tp1TOhQiyB3/F0suvr6o82/TMLmm6Be2x
 vyNqSeSjsOjnjHOU+oi+LZSwNs4aK4PFMeq28suoIeWuc/8SBxUWxl0GHYz9QKbONnsy
 oGP++bxGC1h6bA2JVTO3QhVWpFz8NBCWTd+3Y8OFwxgiKowuVE73tTjwe6u23tCq4M3R
 68dFDdgOpaVHYb3HdvVb759tGSJ73eWM9PBqubOthfyP35B+7UOvmkWJ49O5f1CgDijN
 0a3T9oNmCQBOHOXkqPPUsI/C9WblzgfRBw63mm7NYfwAx1D3SjKMQklzpOUe678lX7tQ
 +ASQ==
X-Gm-Message-State: AOAM531b859g9r+E/EZ1ydixlytIQie1tKNNv3feYwqVsUv97+DHJNl9
 Xi3zBXs4Hw2IbL10w5ydsqo7gt6ZITY=
X-Google-Smtp-Source: ABdhPJwZT55tcT1QZLr1cmvrjpJiIBB8mFc8NGc4AHpXK3TqqkGPgAzg2MeZOzxCT8y2JPs/bz2kGQ==
X-Received: by 2002:a5d:5144:0:b0:207:9a13:ca73 with SMTP id
 u4-20020a5d5144000000b002079a13ca73mr14577340wrt.268.1650439594892; 
 Wed, 20 Apr 2022 00:26:34 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d6c6e000000b0020a9f757708sm5904766wrz.33.2022.04.20.00.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:26:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 20 Apr 2022 09:26:24 +0200
Message-Id: <20220420072624.3422282-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 f2b37f51f69ba7e9f8defd05e5aca648121f0fe6
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

diff COPYRIGHT:
-Copyright (C) 2005-2021 Mike Pall. All rights reserved.
+Copyright (C) 2005-2022 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 4 ++--
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index d92eefb39..cfc00e852 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7ea92e2414b6405c7fb3974ab092707c400a5496e8d4936174b5bd3aa6e94477  luajit-a91d0d9d3bba1a936669cfac3244509a0f2ac0e3.tar.gz
+sha256  e3f9c04e82d5c776335dfb4e53ec1532914ab010b60bffbb0176a8390f100666  luajit-f2b37f51f69ba7e9f8defd05e5aca648121f0fe6.tar.gz
 
 # Locally calculated
-sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
+sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index cca806309..6155cbba8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
+LUAJIT_VERSION = f2b37f51f69ba7e9f8defd05e5aca648121f0fe6
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
