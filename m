Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBB1CCA473
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 14:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 820846128B;
	Mon, 25 Jul 2022 14:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 820846128B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7of5fUJIqlsK; Mon, 25 Jul 2022 14:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB0061291;
	Mon, 25 Jul 2022 14:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DB0061291
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA181BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 14:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0768A61259
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 14:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0768A61259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otxbyMv-Wn-7 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 14:08:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7606076C
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C7606076C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 14:08:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fykvo0A3sJtD2Fykwodpuo; Mon, 25 Jul 2022 16:08:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 16:08:20 +0200
Message-Id: <20220725140820.195083-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKZwtBzWiZF1E4PICOKkpNv6zfAT75HNOcd3deam8i/Ukr76r2Y2BKopusZ3ooBd6Wllx+uSdPSmKCoEQQy+7S+ys5dp0L8hoBrTSbq/ypdy8gwDK7Tb
 qFrhLmhY6wdShIoVNQET7nUIPkjJyJ4IwLZMtkyvEpn6CDU2tm/I+KeRT8Y6tudsgv3vpuF90+PNFJIgyM4hrHHVG1jK4mtuZ2Uh9lG3WJN9K76pl61BvqHW
 8oaNKT/LuLhQowAi2N0pYk3zAwHOPqTybqziV3RKM5+x/Dag7+D5JBh0nL2QPZW9bNQV8Y3BXmcp7f+l8URBrg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658758104; bh=sO2i/AKBtdSgZcRM/YGxqr7KjkF9jsl2TbChcd6sNBU=;
 h=From:To:Subject:Date:MIME-Version;
 b=TqcMzQvPdi7yka0T2wpwJ95OQkjOG32J1Zqf0A/+1TCurSlbzKIk4HIPfrcqf8Ldl
 7vRJ//jUdTqkWfPaL8Oyc/nXwWHmOEOP1SDpPIc24QDJcYOpjMCVV5MTSYdN+qrRnw
 /Wnuh8hv9IRKzPWV9w4dVNrrr/JpoH1Dt8Z4edqs1VeVVGSrdrfvuzFLLHUzT6hzUT
 F6tE5Fc8jDZDSzzw9p7POV57aE0e8YL/MqXSPZsxlf21Ea++cghutdNL8EhNlqyjf1
 dsAPu59y/3tCjW/sctnu5kePVhSR3sd0EGHRQrCk7b9A0jxvtpO2/nrsH6TcoTEot2
 9W/bwE71/HKSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TqcMzQvP
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.81
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0f4c3cabe6..8330d255a7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_80_RTM/src/SHA256SUMS
-sha256  c0bf1fd2c7e29a6b02b309622baafc443eec90c8934bb155da4bb98988784b6a  nss-3.80.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_81_RTM/src/SHA256SUMS
+sha256  a8bf5f3bb617068d57e7b15f3d9d528f109af0d57df2eaab0519b6423edccca6  nss-3.81.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e7aa730435..4283ef520f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.80
+LIBNSS_VERSION = 3.81
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
