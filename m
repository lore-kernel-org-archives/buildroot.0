Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EF9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:51:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2256E6108B
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2256E6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37664017B;
	Sun, 31 Oct 2021 17:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spz0PF-5aZhi; Sun, 31 Oct 2021 17:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8864015B;
	Sun, 31 Oct 2021 17:51:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7C8B1BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3AA660591
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwoL-2xHYmkc for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:51:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D0026058F
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:51:52 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hEzmmoJFUVTMxhEzmmBcDj; Sun, 31 Oct 2021 18:51:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635702710; bh=YS0Wqi0uL2NLO7bevBMOnzAW1PgiKH59YV8up2BSOY0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Tr3mFBvzOC2ImCoX9jbeu+TS4WCT73f06AkumleEkAA290lPe5BXofW1QvN2oigOj
 EjliAJ1mTdfide/vAXnWev/BN8RmD4pixN+rnbEfnZ4NIyV+x9c+ShgglMolhKNQjq
 NsmvW9DcfK8A75dRQfMXWYIIMfzUkhfMjLzav4Q1QzAJpuOdhhyQC2E8Yf1k57JJTj
 s4pXWOhZkZZ2Ay5snXRD1aBkL0QDOJuT49hTAHvsN6PZexxR+UbJhyZBdDrS5JIqAL
 daTCBpAHWlakrO9FmIc204QQRKA8pcR64NIffej5HxGOHXEmxBImY6wX4CtVSRcCtG
 ubm/L8v2BqgAA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 18:51:49 +0100
Message-Id: <20211031175149.1055460-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCQQ5jzVY4VIENV6TNJONYT6NzCqJMdzJq/jDc5RUVD5P4RxQ20QxsBpZshvvgEl++iOJ1lIoplDCsT+zl/oFa7rJZ4OdMU4qoct23zq5A0vBQxQjpL/
 eEeCKjZOBejjvNJwTiCByTAfXytkKYSBBK/G6d0BjYJ0f3mUflMOxbmd8JiCUxVmLuWry+X8qgKPW4Ioria7afGj9NU53KJ+75htL4aLiY5/8GPUe9LOGhYw
 VhIzrHZikaYgT+7NDVwcJHv08R7CIw6SdvQC9u6/tseCs5wSp3wFHAPuEylWv4KmP1x0k82bMPi/0Vkqn56CRw==
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.72
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

Bump to version 3.72. This also fixes sporadic parallel build failures.

Fixes:
http://autobuild.buildroot.net/results/a5f/a5f8a126a42ab784c3b5ab375a8cd7cbf205d745/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f35e8f2e4a..3dc6cb185a 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_71_RTM/src/SHA256SUMS
-sha256  99acd315d9af35419cda4a6960f00a7d446bd231bd407174a7b07cb3dba0c253  nss-3.71.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_72_RTM/src/SHA256SUMS
+sha256  6ea60a9ff113e493ea2ab25f41ea75a9fbd10af7903f26f703dac8680732d02e  nss-3.72.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 83daf18e76..2d880d2336 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.71
+LIBNSS_VERSION = 3.72
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
