Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45191C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 10:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEFB361341;
	Thu, 13 Jul 2023 10:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEFB361341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpIj21k6rg5B; Thu, 13 Jul 2023 10:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CF16131B;
	Thu, 13 Jul 2023 10:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2CF16131B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0A7C1BF392
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A79D6130E
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 10:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A79D6130E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mvk8CTPiUnOw for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 10:30:31 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C20386131B
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C20386131B
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 10:30:30 +0000 (UTC)
Received: from localhost.localdomain ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JtTlqrYxIpLivJtTlqvenf; Thu, 13 Jul 2023 12:23:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 12:23:20 +0200
Message-Id: <20230713102320.124607-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDcJ3UGrL21VHvI0jX8Yluq4BvLcdlYzNsg+X9GAGSMgFjRa0GOV1eNWe7QzjXMsX0vJOp21m9gOSiSRpAfhJAXj3xPw+gc9o5GT8ZDZVERoVGKDbBnF
 3OXVm+KgkLLTr2NBQoPWotCOYjjX+P++AfNLbbxU3iCNIP3WmbvpOCgi8KGRO8e9/AaRAn5Nsfkx9DogbEMdw5V1vIemdsqQD+QNHJl4/z+e/uErF7F1MSJF
 /Qm3Fwkhfti1z/a32dy9Ok0PIFTSsIVulQfpah54eo5X1ekTGpUhKGYC+Gejulnv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689243801; bh=7Y05IX8UqsDf3UvjRWaC92yYVZkBtefvau5+G5S6deY=;
 h=From:To:Subject:Date:MIME-Version;
 b=UDz+OwS1yity9gCmlSc21E9Pw+Gm2necC9P6Cpd86FSGO3zec24JQ5+ONyN4wyQu0
 yMnwl3zD/fpyZqgz4583qdOyvlxp4VMUc1etfkm2aV5tRq9n91TiOHMU877o4wAANg
 kZnt0KS5dPsfPHtH9nX3pnyFcx3SLgaiPshgBhLbzaqTMWLwRsRZtZbLRl8rAyvfAU
 /SBIAVorgZPwbYIUFuQGnyuXKxIY6RLkMHyJKMTtszq8qVWNKkHanMnbQKgcDFjGAT
 6OmIdO6ZmKfUt4jTIsA6RT4Sx8JpsFNouXgrh29f1oljWE049q34eelx/OeP0sy5ZS
 W3aVyCB6V0h8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UDz+OwS1
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2023-07-13
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

With this patch Linux 6.3 is supported.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index fd874f1f0a..be27a85970 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b66f20272c63ce8ea769bf1c95f9923ed6facabe0c14a8c7644b302b9f23b58  sunxi-mali-utgard-driver-73a80d550f2f181b5fc7fc2d859e15d077d845e4.tar.gz
+sha256  f2e5e671575d9488fd19b821d70e59952b6dbbb5b2036ea5462f811eec819370  sunxi-mali-utgard-driver-c4bc3e229c0e5f30c24c20ff1fb8db0e4a450c0f.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 15d660e49d..72fade58ed 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = 73a80d550f2f181b5fc7fc2d859e15d077d845e4
+SUNXI_MALI_UTGARD_DRIVER_VERSION = c4bc3e229c0e5f30c24c20ff1fb8db0e4a450c0f
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
