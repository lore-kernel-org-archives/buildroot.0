Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AE2C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5378C41516;
	Mon, 31 Jul 2023 14:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5378C41516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oxqC4lZfzbQ; Mon, 31 Jul 2023 14:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48536410BB;
	Mon, 31 Jul 2023 14:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48536410BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5AC61BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A717C60A7A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A717C60A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kl1bsLwtSeB for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:11:36 +0000 (UTC)
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0B3A60736
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B3A60736
Received: from localhost.localdomain ([146.241.23.166])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QTcSqeZyKXKevQTcSqLQia; Mon, 31 Jul 2023 16:11:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 16:11:31 +0200
Message-Id: <20230731141131.2666639-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMRul25c1gQWpHd/VcC+50q4QvfgW7R+M5kFUBMLAv5LN69EskrRXWVorSh4d4C6dp48ajM6p+EOtHtZTKtnQQ4TqSBJnmV9uJMEYF0V5F/pjuivrAVo
 f5509hyXqJ9W9zU216NxJ7TXfEcJP2+vOZxRVuFWE6XZjuM6pl7bZOEEpgEhPvAUtYuBUSMft9PoYexgP17IDlFJ2racmvwcaH2NwpqAdxJyj+2VNVf2Qh0L
 gEzl+Smkrn3AOHn0uFdG5gYs0TYS+srXhVGqqTytaLoCZsVS7KFg8VKz0Iq9hmlXhReQoMsuqpyw7o90oJqFmw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690812692; bh=LM5j6jgBq5qRTnA9f2YOHGl8zTzctiJ5+6UemXRj1gE=;
 h=From:To:Subject:Date:MIME-Version;
 b=mSSJa1wqpv5Y+h43wGxUWUw3lIEVYaNGia+9VmRhRs5R3E+XxHpse7N1hz4kfWL4Q
 exm46gP3r1stJaRoFSiS6KBzmKZUHviuJwc/zAA0EQsQOk5NQTJ3tDIeuTlXEUmrAr
 rPO50rKx9/yzRMq8mCaysRFFJ8HmogbS1L4s/JiiAc6E9TiyycyBv4dTb6JQL9MZNS
 RYB9I/VzIapj2f5WMrWhcJETQhHOnWzkqUyrDAu2Un86OkHyHbpBTMd3qyCP9JaidU
 Blp+A4jFplxLTjdqtep2aTU+izLPyzkSebNAee5kd7S3dgDfp0B7nZVnqH/tYSAFPE
 BV1QQo1JWshGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mSSJa1wq
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.92
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
index 5a4fde42b6..b95c0448b0 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_91_RTM/src/SHA256SUMS
-sha256  84bd46376df17118c55f6d73d30fd93a0af21296c66e7690471547e5898fc4b3  nss-3.91.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_92_RTM/src/SHA256SUMS
+sha256  3db192d6e882039af02ae7eaf3217ed114bb7ad83414c646772ab8021e24a254  nss-3.92.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 09ac971d35..64463d1f10 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.91
+LIBNSS_VERSION = 3.92
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
