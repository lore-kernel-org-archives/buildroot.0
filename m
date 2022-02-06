Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7829C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 22:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F0B460B75;
	Sun,  6 Feb 2022 22:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yv2ugiv8sNAO; Sun,  6 Feb 2022 22:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7423F60B41;
	Sun,  6 Feb 2022 22:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6E51BF341
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47A49402A0
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwnqF74WwJpc for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 22:45:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BE84029F
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 22:45:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GqHbnfXpqks1JGqHbnX8pK; Sun, 06 Feb 2022 23:45:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644187523; bh=jmEpt9ewkBeesugsOf7YqK4wmGwSCz9VZxgx8c3ZlyA=;
 h=From:To:Subject:Date:MIME-Version;
 b=EZmq7qEXnSiJmYx+lq/I/YC2AUgnkNpOlecKsuqi3+0v71hMndXiGJbSuO72IqTvL
 IgIjFbeuEUyLrH7jgZ2d4yvppKegBWnQYenFytPxwNrWG7+0nrnnP8ayj6rvjJn6iH
 /qPrAHs1/qa6bwEce2Y8EHGMxdllZlajl7evfHqIgNt4OlpdDCOtGjaWhGZVZW0V0n
 NEAckWnB8ezWwuo9V0hn+60ehdjp/gcfiyxCvoOOv6HOECK5UbEt6Jy3exjcjAnD2t
 VBYBuC3+39008LBq4VXfQsXo/Nfr+Aljy7N7cn35rsAtouROoHp7H7cP6JMk+lKtsX
 unP7C6dTXNmnQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 23:45:21 +0100
Message-Id: <20220206224521.3204040-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfO6Rvl44COWei8ZmCMJbRT31yYr8a95/m9RVsh0TexFhSoUvSi4+nL7AJvY9X62eJnpBT/tzYB8dEJN0peFP0sPlik7TYFY3N4u7uYWvoucwMCVcz4fF
 wDOVH367nA+SU4pdwRfF7GymS97Zv2wH7nZjf979+0Szklc3DHihX+oDOyZLeCViyg7zNFZR+jDFAuItV8h4nOc47+fT+Fdz8VncL2ODYTTiC9i7Mmq9OmbI
 QKGYU4eoPbAfiPxCvNZj2ZagTRdsd4Bxsr2NKKd87Ah3Gu4+vpj3Kd3bkIoMDQnU/eb52kSK8NLkKKgK+mXx5w==
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.75
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
index 819c272a30..07fb340c33 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_74_RTM/src/SHA256SUMS
-sha256  88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056  nss-3.74.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_75_RTM/src/SHA256SUMS
+sha256  fd571507827284644f4dd522a032acda2286835f6683ed22a1c2d3878cc58582  nss-3.75.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 537f6dd9b6..a9549e48dd 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.74
+LIBNSS_VERSION = 3.75
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
