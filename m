Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 14:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3517341912;
	Sun,  5 Nov 2023 14:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3517341912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVKrOCULT2lB; Sun,  5 Nov 2023 14:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54ECA4190F;
	Sun,  5 Nov 2023 14:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54ECA4190F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C90F1BF342
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7153261003
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7153261003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSX0vK-z44GN for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 14:22:00 +0000 (UTC)
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8C4660A5E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 14:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C4660A5E
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ze0iqa3nENmNJze0iq1pvW; Sun, 05 Nov 2023 15:21:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 15:21:55 +0100
Message-Id: <20231105142155.71448-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOKsREwzW+vMlpp6Am6mkWi//luRNTddPohYSAbTawj/MgNNhmxX2XNplqRU4xPzcQuFVlCIe91NRSZYqKeWrt6c7YgU4NnZaAIuL6UqVAfQ0ef01b1K
 803wf/J7myWYZeo8rI4y4iTpCHC6XBhyoOZWV/qV1QTGtsp7K31M9r+lzCAw2kuHLDlYrKwYx+xmRoMkt6t01kPaGBNV/S18wV5DRLiqGlnbrQCA66ot1vgf
 WHd4yo9YycKYmS4F/kvHLNoix8E+EEWM19m722dwBtw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699194116; bh=kOYxIFRvGYi37/gfMZAXEHcRZ1GUIMW1uje+pgC+o/c=;
 h=From:To:Subject:Date:MIME-Version;
 b=FNjN2mPdgFgmva4dR9olAZKLpHdcT3C6xRkQKzDjKXtIVk1qRSpUPltw05sQsppm5
 e8T73NKtulfyyXCdIjQtepw+oYRIAT8mAq3bI7CKbU4sIXxS5Le7css/Vp6RRJwj4J
 wBGCfhhO9xOZW6DVTEnLDCBXAWZfJgjSCNJUD6mQkJO2cXifAe8NwkANTWV3F+S9T+
 fU6SfqweEbvPna87N9n+dCBfk2VQ6uWQlwfcyxnlAV7KhY9z5pWZQIPgVPVLkwQqhR
 xB0GIhylFbThxC2IuzyvEC/DNpEkeYQyaJ3l24dndjC1qzN1BwtuX9cn44qrnJ7I+A
 3LmpVlPu+JXJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FNjN2mPd
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2023-11-03 on branch v5.6.4.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds support up to Linux version 6.6.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index bd6c87d56e..414ea98b08 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78926af85bd1630ff599d0ec174d7c4c130141cb210a187946ea48ac1015809b  rtl8812au-aircrack-ng-04f600ee54a414b871aea509fcd4709838c8c522.tar.gz
+sha256  969fa96c90e16fcaf8f6b30d4576a8446c7041932bea34bbfea7e9c91038bfe5  rtl8812au-aircrack-ng-4a983e47dafc048019412350d36270864f6b5f2d.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 99d63432a4..df3b03998e 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 04f600ee54a414b871aea509fcd4709838c8c522
+RTL8812AU_AIRCRACK_NG_VERSION = 4a983e47dafc048019412350d36270864f6b5f2d
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
