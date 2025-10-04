Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13269CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 20:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA9240EF3;
	Sat,  4 Oct 2025 20:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvdTYsR44GFT; Sat,  4 Oct 2025 20:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4ABF40EFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4ABF40EFB;
	Sat,  4 Oct 2025 20:58:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79232226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 20:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7307F608D4
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 20:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTdWbKHHKjhO for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 20:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87E3B6087F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E3B6087F
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87E3B6087F
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 20:58:04 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 59KLvufERqmI759KLvSDif; Sat, 04 Oct 2025 22:58:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  4 Oct 2025 22:58:00 +0200
Message-ID: <20251004205800.582688-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF+YXOtdq3gmg5t1NM7vkFhyQys8/jmJ9hjScIhAksA2+5ZDawPjfa76PTbV6NwSq3YOhMOp76QOXMa2Gqb1Jdzk3XYZLdq1AI0WMg0P++XN0cFR+4Kz
 lk0/DP/YWbjTjcwvv4XH02j3ViqG/cqopBLUxgycPYpvZ1/Wq0YhvPjpBA2hfBe3BVFrbJqvpm/nuygn8u0lf/dL5LPciE2tbF4gfAi0mcX2CcRGClXA26Ip
 pj99HCVp2cgS1bi6nesVd7wD3Nr4dpS0HZdIae7sNaw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759611482; bh=ylx8/JXER/ob9GLmVzSQoRgtuD8QCTDUx1bes7MIPd0=;
 h=From:To:Subject:Date:MIME-Version;
 b=bh9ED8w9oZOFuiPfNYkKeY1C7TEbYzP5us2mh3fq7Aa4J8+RR2XkIBppd2PC/ZCHW
 DKd3VGGJOEhShK2upk0wJrmtf//cixdxhfp70kRrCKVbkzsOJ9GQxb69bC6A57IwPY
 eN+PYX5rBVC4UqWmctgwAnJY3MIBrEkV4qn/k7q7pgAnLt9RjinrkSF+rnyT1+9IUy
 HCItL7XNHrHlbdSXepqAb8jDKE4k+VOeX9M8ZGY1vQXkXrVLFURcXR3HgnoLZZfJUs
 88QLZELwnsoJVx6szNhTrH5kEfJU+GMWFqgGRIexCUC/DjdQ/1kyHk74BqSRWyPsaB
 yQbQcnEobqQBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bh9ED8w9
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2025-10-04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This version builds up to Linux version 6.17.

Fixes:
still not happened

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index bc406e270f..c6b027f1a3 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c1a9ad5dfa0d4b7978a1a6dd02d7eabd4bc65e7d6a06eda749cae720749a741c  mali-driver-4f5282b305cb0956fe2485c9e9dab0021d5538f6.tar.gz
+sha256  bbfd78d3342fe8bdef5e37659740f69818aa1b3be3a75e5bb085223d87a2a1d4  mali-driver-ef3da788030833289040e4396bff010edcc2289b.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index ccb56de81f..40ae03a1df 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 4f5282b305cb0956fe2485c9e9dab0021d5538f6
+MALI_DRIVER_VERSION = ef3da788030833289040e4396bff010edcc2289b
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
