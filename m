Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A34EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3187340647;
	Sun, 16 Jul 2023 16:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3187340647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZez5yu4XOpp; Sun, 16 Jul 2023 16:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EFC4405ED;
	Sun, 16 Jul 2023 16:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EFC4405ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDAA1BF20B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E95A340888
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95A340888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biaU_RYhFlLS for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:59:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E81C4092C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E81C4092C
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:59:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5A61A4C066D
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 18:58:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39278)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL55F-0001q2-1C
 for buildroot@buildroot.org; Sun, 16 Jul 2023 18:58:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:58:57 +0200
Message-Id: <20230716165857.438323-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689526739;
 bh=z8kkiiyICjugZEMRtHq3ZXRr4BJ1bIacwwVlWkcrqPg=;
 h=From:To:Subject:Date:From;
 b=sfZcpv40dFF99ZNEs9m+p5zAZ+3y1+yOniU8Mh6Zl0K1a5Ektf3nnFlHdzkhBwe9t
 2eTipccz4G/FPpOpMQlbZGGTjUU7m5OVVrSGQnE+GaWJ1jhrZDXEd7HIWyVt5DRpF0
 qRWdjpE30HJVTWonTEx+r/WrcGPoUXIzNTQsYCgoEk4WRjTi3G+Y0kFF1SuIS6GGbo
 wsrE/iK1ce3ywvw5dF8T8BD0Q5HKSz4P07FDc5wvidP3ZU3Ud15rgNzeKeV3BjBOvq
 +IzM9o0mcoEcMmWWay//cFKin9QeXsLj4Acs1kZGJ9T5wsmgS9tDmE22z+zqoN7Oyf
 JbdwXXYiTx2cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sfZcpv40
Subject: [Buildroot] [PATCH 1/1] package/stellarium: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable unsupported options.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 4dc5692d79..709bd08ff4 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -18,8 +18,11 @@ STELLARIUM_DEPENDENCIES = \
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
+	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
+	-DENABLE_XLSX=OFF \
+	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
@@ -35,12 +38,10 @@ ifeq ($(BR2_PACKAGE_GPSD),y)
 STELLARIUM_DEPENDENCIES += gpsd
 endif
 STELLARIUM_CONF_OPTS += \
-	-DENABLE_GPS=ON \
-	-DUSE_PLUGIN_TELESCOPECONTROL=ON
+	-DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += \
-	-DENABLE_GPS=OFF \
-	-DUSE_PLUGIN_TELESCOPECONTROL=OFF
+	-DENABLE_GPS=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
