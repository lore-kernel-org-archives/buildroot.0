Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1EAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 00:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E0961135;
	Sun, 29 May 2022 00:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2wkBM8wmjOL; Sun, 29 May 2022 00:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 536C961127;
	Sun, 29 May 2022 00:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE571BF5AD
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 00:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B8AD61137
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 00:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9CAMxqOke8g for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 00:23:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89926111D
 for <buildroot@buildroot.org>; Sun, 29 May 2022 00:23:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v6iqnOvevGIp6v6irnB9Wf; Sun, 29 May 2022 02:23:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653783837; bh=k7O/3+kgChlFV1mApmLRebitdG3A26TG5w+LdTCF3aU=;
 h=From:To:Subject:Date:MIME-Version;
 b=m3fOi0lukjVgVFOxdclaFioJP1773eaOee67GvuFm1vh65Y+0LeeNASxD2/RLxgqk
 SHWW9qynNol4BAyWBsLMg91WqlW+AokXIBgIELbAQgrGqnOXjPJnEwgoJJ2UHYubwj
 JZlzIM9vaoUsJyv3xK7wVxp48sihf6Y5dgWUlFBmJ4WaVBmLgWsonfz0qYeS/o1Eh1
 KBiBmC5opktI1hGOhpIp37waB6jJRVRUVX+aT1FysaLBK7Vv+pRnG8woS43xS7XCYu
 9d9HB2bNZtFKV8vic0Xt+Lb6bZd28nmEt9mBoc/VNiYQPsE7uNLuvUbhQxv6uhcHZH
 3l1RU3v/lEyrg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 02:23:56 +0200
Message-Id: <20220529002356.1275791-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIe11rd+82EbKHLnyif7WJCEfql5yauxwrzlI1QUmLn/SZLbOy0qfrQWAW6LokG0/Ae5j95C47bziQqriCjIzVm3lOPIO78QQRIfCMovwZ2G8cmstl9k
 cfj9PmimmA3Ud50VkE/c53NsQs/lsFl6NHugD9GrMO4oqUGRfBnIer5l9oM5ifANtc0K9WyIEgrx4kuHbk3Oj5/NbotuS0fZk+X+xphgfd+E7fHosM9ik27I
 SEvmNP9eo9Dc2OYggIVvegsNKpXbxNEknvU832EgnezifIpRBI29gCmBU91qDeEg
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.34
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

Unfortunately local patch is still pending upstream. I've just pinged
them:
https://bugzilla.mozilla.org/show_bug.cgi?id=1765100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 0064a9b279..4795b52aaf 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.33/src/SHA256SUMS
-sha256  b23ee315be0e50c2fb1aa374d17f2d2d9146a835b1a79c1918ea15d075a693d7  nspr-4.33.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.34/src/SHA256SUMS
+sha256  beef011cd15d8f40794984d17014366513cec5719bf1a78f5e8a3e3a1cebf99c  nspr-4.34.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 7491d18884..5d64d110ef 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.33
+LIBNSPR_VERSION = 4.34
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
