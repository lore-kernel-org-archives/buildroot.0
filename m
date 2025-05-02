Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBD3C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 790E283668;
	Fri,  2 May 2025 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhbN0vm2nN9x; Fri,  2 May 2025 22:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F593835ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F593835ED;
	Fri,  2 May 2025 22:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62ED41A4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5442741552
 for <buildroot@buildroot.org>; Fri,  2 May 2025 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzNhIXytcynn for <buildroot@buildroot.org>;
 Fri,  2 May 2025 22:03:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BA9F4152A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA9F4152A
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BA9F4152A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 22:03:30 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id AyTfuDlNx1ugbAyTfuRkzR; Sat, 03 May 2025 00:03:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  3 May 2025 00:03:26 +0200
Message-Id: <20250502220326.3200749-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP5TQNhtSO+8e2jSSW+nZJ4UAcyDyzrKjSPMkg2b5O8ud6Uj+5em4i6xwOFF0cRkvzN6u6O6H+/yWfkhPLZF0g08e4KT69aw7YWScSM9jq8MZkWvIFHx
 DMmjYRtRVX/XSUUCz7d1gyArkJJeLrlHUzrD8VbmFmSZnocoeCjwun3tTqXpfdR3SisvbKFjDYP2rs1JgMHD0FDsoWRwXYRNbwNwNiMenNGcXxeJABCT8y4Z
 ngZdBC8GiSfxEx1JBRLGMgYBbcCZ1QdGAvrhvCPpFsI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1746223407; bh=SykKLTil35K50jW+Y8Xbtp0lCshL3D26I9q3n7oYJD0=;
 h=From:To:Subject:Date:MIME-Version;
 b=NpGVKxWQEsyyUqSByOGeje4W84aXRZ90Vhp+QNdKg8L9VSGUzxDUVaIQi1Yy+4AyN
 lqGMYFXXMXLjBSJObs/2/tcqQnckbQBLEcFqascQ+x5Lo+UNOB3eZGK0b1bdTgJaAr
 8VUS+zGWIWAGl1jy5j2YjBLp2lffYcgHvcgx/HDWWNTDstZqi/FGrGY0BZNINlfVW7
 NjYwgQ75kMf1+UGWOMMLNADpq6MhA0qu4KerkID77blANr5L7eYU1I1oNLpYbgDWCr
 7QsW1DpUrB1qoWvuxAn9Z1aHGV3hse26c2PIo6oyKesPUy8Tp2jPfRY0KrkLZNZ1dd
 /vWSwExqM0xng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NpGVKxWQ
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2025-05-02
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

It builds up to Linux 6.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index 5f3e001325..b8f96ae1b3 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  151a56eb6a47efee19369a1c08b7aec506e48f983683a3cd05c5494cedf0fb69  sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58.tar.gz
+sha256  ce73be1fb5f5d24f0e66516623db0b51c45adb30d845bfa8cb78aed9b6d8913f  sunxi-mali-utgard-driver-9926236a20904ecfca68f3365657c11f92695546.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index ba7c50718d..9c68285256 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = ad7e98bc1e81c7ac9c897f854c1a429d33e45d58
+SUNXI_MALI_UTGARD_DRIVER_VERSION = 9926236a20904ecfca68f3365657c11f92695546
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
