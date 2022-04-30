Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF78DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 23:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41563400F1;
	Sat, 30 Apr 2022 23:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xq4_QjQkR2hN; Sat, 30 Apr 2022 23:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 638F3404D3;
	Sat, 30 Apr 2022 23:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAE8D1BF2FB
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 23:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8B6F40119
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 23:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0Xj3k5INr7y for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 23:43:36 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC013400F1
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 23:43:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.34.210])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kwdanluZbKhxTkwdanw5m3; Sun, 01 May 2022 01:36:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1651361790; bh=WkdD5FoYLLwG9WxWn3qmsRp38/PQuBm05cNCG335yqo=;
 h=From:To:Subject:Date:MIME-Version;
 b=g4F7bg4CVda5WBBythnKZpWkq4gI89PxAdTtQ2ui7KmPZsk+SyUx90fpM48NIFiyk
 10Gau5qXxnCkq7UHNLgqAn6hRhleUbAdC1cTA7iZAjaUYCOQZjObqV2g6GcxCATuFl
 zKf6zJiqdEp0xJGrQuox+DqOrdrDwRNrkJp4Bbrta7uFbqBb/PfNB5ocSeI04AtjnX
 hbkrCdW2ha2H8JUk7LGpr36mqgzTHAVErk3YuyxAjpLhjLMPeExZtv0VV5tbXHWlmK
 /FPlMEvSkz4203mtnB0zpfANooBL2hK3LeEeJEw0k7GybqXBJN6/8DD7LNgcw9ida8
 L4op7yBeVpXMQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 01:36:29 +0200
Message-Id: <20220430233629.1376415-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA1zUxv3uPIy8rMtvrHJDbzYFoansPCkKdGllksBVbJptB7lo/jPFXWTGqXudwxvn9cmnN7pA8gQU7XSuwVzUFzPfETftqcp15BCUA9iMdicaOKjTVMV
 Wlx0ZJi5dj8RTYZ7iig+2LrO7isgQhZUWIW04sWEXq42CPWHpWXXNskKVPmNtQzWWnb8V5WNnopF5AaNFDGzMqFsZGv0QYa7Bf23mqCXH6m6/JenYjg6Sk/R
 WKMp9GXX63nfSa+os5R9BDIgvo3jdYQf+3zyor2At2c30Y/3ejluQZcAEFtlQ04y8d+Yj682nyG+RbVul//eHsRSuRKI3mDvV12HA6bhnmw=
Subject: [Buildroot] [PATCH] package/rockchip-mali: fix build failure due to
 missing URL
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Github rockchip-linux doesn't provide libmali repository anymore and the
only up-to-date and maintained repository I've found is JeffyCN/mirrors
branch libmali that provide the identical situtation we were at with
previous repository, so let's switch to JeffyCN repository. This fixes
a build failure while trying to install rockchip-mali.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rockchip-mali/rockchip-mali.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
index 6200191a73..848682229d 100644
--- a/package/rockchip-mali/rockchip-mali.mk
+++ b/package/rockchip-mali/rockchip-mali.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ROCKCHIP_MALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
-ROCKCHIP_MALI_SITE = $(call github,rockchip-linux,libmali,$(ROCKCHIP_MALI_VERSION))
+ROCKCHIP_MALI_SITE = $(call github,JeffyCN,mirrors,$(ROCKCHIP_MALI_VERSION))
 ROCKCHIP_MALI_LICENSE = Proprietary
 ROCKCHIP_MALI_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
 ROCKCHIP_MALI_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
