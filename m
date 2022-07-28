Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8719BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 16:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F68D60F83;
	Thu, 28 Jul 2022 16:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F68D60F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLb-SWApVGKm; Thu, 28 Jul 2022 16:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C92D60A73;
	Thu, 28 Jul 2022 16:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C92D60A73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7681BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FEA4192C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FEA4192C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81mzeqXHDTrQ for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 16:40:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1FB4192B
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F1FB4192B
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 16:40:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe7fd002317;
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26SGe7hd039468
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Jul 2022 11:40:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Jul 2022 11:40:06 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe66N038992;
 Thu, 28 Jul 2022 11:40:06 -0500
To: <buildroot@buildroot.org>
Date: Thu, 28 Jul 2022 11:40:03 -0500
Message-ID: <20220728164006.16652-2-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220728164006.16652-1-x-shi@ti.com>
References: <20220728164006.16652-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659026407;
 bh=ySaXoBSOkZomQsfC4iWl6Uo7302igk8K/tAJpOgvgFE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GexEiUf5fmG9cD3SeGiuc6g2Dy11F2q00jlkEM+bCJbw3XFyFYf7415SyySJomaVP
 OnMgm2YO8OCq+VC0+WzmpvTui0E6SSWUe11iC9+zH9WFen8GTZiPCBdDOoF5tBdZTV
 ASW29nwEC0HUfXH9xmvrtuGcnQFyQ5rU8lSQcido=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=GexEiUf5
Subject: [Buildroot] [PATCH v2 1/4] package/arm-gnu-toolchain: revert to
 version 10
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Anand Gadiyar <gadiyar@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Revert the toolchain to version 10.x because of bug in 11.x:
when the pre-packaged GCC was built, it could be targeting
a newer x86_64 architecture than the processor being used.
Confirmed fix will be implemented in the next release:

https://bugs.linaro.org/show_bug.cgi?id=5825#c19
Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 2 +-
 package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
index 48b1b55c73..168d99cd45 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326  gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
+sha256 97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3  gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
index 3bfd516751..87e12874ea 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ARM_GNU_TOOLCHAIN_VERSION = 11.2-2022.02
-ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel/
-ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_TOOLCHAIN_VERSION = 10.3-2021.10
+ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_TOOLCHAIN_VERSION)
+ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2
 ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
 
 HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
