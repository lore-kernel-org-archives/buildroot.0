Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B45EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15FF7405A6;
	Sat,  8 Jan 2022 17:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ng_KD-9fU4wJ; Sat,  8 Jan 2022 17:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62129408B6;
	Sat,  8 Jan 2022 17:37:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C63C01BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B929B4011F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziGt4jUCfIiC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:37:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 939BC400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:37:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so17795664wra.6
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KsRNilDpj3GRxpbyqkc+L1NFMeHtVLGyL/967oRq2R4=;
 b=KRBUuhzaDd5k2bx0H0+ijI0dPNcTNS5b2zgJpcv1DRFi30v3cR4cQ9D7X/SFVffHTT
 FquYPSfKEG/IXTfgG58+vfb3VS3e1Oa3u5tNL8CPgr0HgHfkPfBRCkhMf4y0cjzCo6tK
 L3w4VV5koq5G0CUEfA0J3P1FC9WiPfTGRIpgkL/Ijgib51iaq5zRcPmQG0oW5ywzZ6As
 kXPaFjEMKoh5OQ6rB0pJIXcJkGTD3wmmHIJx0idi7Ba8t5L5qi2YUsOnJ9YCCATgkak2
 Wy8dAjBCer61DbyNL0MTXBG/tc0A6RlZ16TvRRcjpGNSwSCdJ+isUWOFG0YVilizNmQU
 Ovxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KsRNilDpj3GRxpbyqkc+L1NFMeHtVLGyL/967oRq2R4=;
 b=ZzCnG7q6ChiC5ZX48dmu3whNnig/p7fHuGa+cj3CKWUVM04u+Vu82DmT81dJ1MBMjP
 qPuVibD06jsIIiGUt0cYSeETwcBQ0LbPwMz5rapXoBg+n4yILOA7pWkjc82h58n3FVfB
 vb5TvxfWUCGP8Upj1OUODpWSZjrwB/3XPrCxb2KTboL9iooM7fibZfEOtyRwjJOYCyFM
 cIvUmF5/VOWIXXjV+JJSYqaFP77jUF2LxUUyQ0hQfxVND1X4xPpJ4DcBUmuXJbuESFKU
 HGoXLxSuxx8Wy4yS8p+pRnSH0K/j4yeACDj6UiikHTW3srUzdBRdyiZSZlEs+iXtya4v
 HThA==
X-Gm-Message-State: AOAM533Ch5gY8fy5DKRaw2OeoDANHK2ODB+tilWTHpNlHU2nBV+8ca0L
 ye6DB8dr2Mcbj++41hiqmC7uSgy3cC4=
X-Google-Smtp-Source: ABdhPJzjOJVr3ggMfXQPTz8amGX8LTodQSm4n6QtEu2GTXP7wjQ1uEhePQXCv932DLF0KRjkTkCJ9g==
X-Received: by 2002:adf:e706:: with SMTP id c6mr9705713wrm.116.1641663439713; 
 Sat, 08 Jan 2022 09:37:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n12sm2021731wmq.30.2022.01.08.09.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:37:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:36:13 +0100
Message-Id: <20220108173613.2820050-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump to version 0.13.1
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/urcu/userspace-rcu/blob/v0.13.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburcu/liburcu.hash | 4 ++--
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 8ff11623d0..1968c3784e 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.13.0.tar.bz2.sha256
-sha256  cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20  userspace-rcu-0.13.0.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.13.1.tar.bz2.sha256
+sha256  3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083  userspace-rcu-0.13.1.tar.bz2
 
 # Hash for license files
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index e29784abe4..895dd6bb66 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.13.0
+LIBURCU_VERSION = 0.13.1
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
