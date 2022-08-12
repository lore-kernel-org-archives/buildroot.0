Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D59C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 23:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB8D8328E;
	Fri, 12 Aug 2022 23:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB8D8328E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX732NjDhr96; Fri, 12 Aug 2022 23:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CA68302F;
	Fri, 12 Aug 2022 23:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CA68302F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0803D1BF27C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 23:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D238C41908
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 23:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D238C41908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsL8yxs0fMdI for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 23:06:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A60418FB
Received: from smtpdh17-su.aruba.it (smtpdh17-su.aruba.it [62.149.155.128])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71A60418FB
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 23:06:49 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MdjpohTEuZPAlMdjpoz7CV; Sat, 13 Aug 2022 01:06:46 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 01:06:43 +0200
Message-Id: <20220812230643.95772-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJdmo9dLBwSjJZkMtCKfZ4/BY5E+2uuz5LdO/8iQrouZgydmJ2ig5I64VldluycadJA8cJWARK3BtD+7HY8rTw+yT8yQHc9kYtyIz9nMvaDBp3oDuCOd
 R5mjWPaC3H90wUycV7hn4x/hEfqX5Cu0GMK4y5sLBYIYO+/+Ep/f0nRf2iqaOWDZrjc1xmjC+H/e/GEiz4JfMNu71iQMRW6ON7OjyCEoF/bXMwsom8/ntfsN
 9iNxmlSNRAPPc70OQGvylitezSSjkxWBokfKjhwL1VY42txbGERVXFegcsGqR1iI+MmbqWn7HgcLPIMefBFyXQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660345606; bh=4ItGFkct74GPTRYF0ylgYshzAOIvV1s26iaH/fnWuSs=;
 h=From:To:Subject:Date:MIME-Version;
 b=Pg5Gwhy8lgFmzePC1hzVMRef/cepFY8cPIGOQZi5cF5FkG43VGxT+z4dbrwpPAHoP
 /bPcQ0d1BHsG7Jb1m6GTw431G1RAc/gs9e72tDwbVf2wP5N3e8+b4goXIoGJj9OL5d
 mI504uE2BTUIWM4qfqk9K59VDmFahhrxzVzllL9LKiU8q78z3lxf6nDiWdd2djwcUM
 t7l8vNoS7YkhsFO4RhZ4iQ3gt1ZRF8Vp+yB7oy4+JJCedqWG0o7CfacXr9IW1nTyek
 dMM4+Xh+gKoj6ZORdReFZmNMf5pv/Pqc1JqJcz8lSP92uCmEhxwJ9m7JWWcR9UMI/N
 EZtSKU+qdomTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Pg5Gwhy8
Subject: [Buildroot] [PATCH] package/mali-driver: bump version
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

This version fixes build failure with Linux version >= 5.15.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 9f28090417..d18db55fe0 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  76464e5ed55e9d21062cf154733ce61217211172629ec8742af902607f14d41a  mali-driver-a742530232d1de41b57465744a1259fa6c35049e.tar.gz
+sha256  512ca30916fd9b9abec70073fced1c2d33757cddbcb3d0f1d1c4b8c6c318f207  mali-driver-3d697de9bce8bc68bf9408d5407873ce32d0f4fc.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index b12bfec69d..2d5febe192 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = a742530232d1de41b57465744a1259fa6c35049e
+MALI_DRIVER_VERSION = 3d697de9bce8bc68bf9408d5407873ce32d0f4fc
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
