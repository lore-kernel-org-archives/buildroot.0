Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A799BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 21:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B2C3607A3;
	Fri,  4 Mar 2022 21:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9tyAuFKZwUt; Fri,  4 Mar 2022 21:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3C4600CD;
	Fri,  4 Mar 2022 21:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4DCA1BF2C5
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4B1A80BE7
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id By3pvqlTNWDf for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 21:38:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32A6980BD8
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 21:38:31 +0000 (UTC)
Received: from localhost.localdomain ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QFd7nd00CaOyAQFd7nYYil; Fri, 04 Mar 2022 22:38:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1646429909; bh=0GF5qo6i51R41OMJ1tPw2N1XQ5LHr3bWf5Cd3LSWqhY=;
 h=From:To:Subject:Date:MIME-Version;
 b=mZxL5AuzfXaTqfytNFpa9+bZcC3sFukTDgx3BoXYAB4azk4LRgvBfatMSX45/ZwEA
 7zvz/5snxEUl6sB3g//nB8utQoyddo6pl4onkjJ+CZs8x9h8Qea70TGgqpBUhSXhZa
 2qPDT4abbOfHbUCjPwcfEz0D02TrLW9rtPXuQNs0YnulB78pllBYlGFCmVCQFkA54w
 2KPNOkwdCSW8KSCfM5ZjQYRMeAQCBKeuvH7xFPM0bM4FYGFNx3OUdMFCmChFesscoD
 2FbkLCN7nFuwMC6OuQtIdSTA/bGZIrmgtukWIBOJsvHuEJxx5Yb1P9tkHerwouxJPQ
 E9PmM6DWLUXaw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  4 Mar 2022 22:38:28 +0100
Message-Id: <20220304213828.3870123-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMmnwjUk8kMQsBoQQqYdSOS4hRkVT8PGX+qkjQwVjsPDKp0o+/JjVMdm8dgSZsW1FOHZUNGW7pCRERgNknA7CJdyDpVbzBI4ZKou6BgSl0AOFMNOeblx
 0n+/w51tyUhH0Ez67/Ijt6dIxcdMVRoxw9T2HBnoUYeX+nfYgpRt5xlsBS+tUJIp1plUYg4c8LSoffml5qmXqPaVRyo/NLidIcNi3Z/xhg+Wqj6t5b8NB7C1
 3J9sm0kfcVKHPnQfLEJDDkOWtuSaDEOQt0jbXezA7g2ApoFCAa8GaTlPZZGaEpc1
Subject: [Buildroot] [PATCH/next] package/libnss: bump to version 3.76
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
index 07fb340c33..b4b8be11f6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_75_RTM/src/SHA256SUMS
-sha256  fd571507827284644f4dd522a032acda2286835f6683ed22a1c2d3878cc58582  nss-3.75.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_76_RTM/src/SHA256SUMS
+sha256  1b8e0310add364d2ade40620cde0f1c37f4f00a6999b2d3e7ea8dacda4aa1630  nss-3.76.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a9549e48dd..2f7a265136 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.75
+LIBNSS_VERSION = 3.76
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
