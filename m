Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77749C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 22:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062D041862;
	Wed, 14 Dec 2022 22:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062D041862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqlFCIn1neED; Wed, 14 Dec 2022 22:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8CA4185B;
	Wed, 14 Dec 2022 22:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE8CA4185B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1781BF425
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35B0740BD9
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B0740BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGrc33IZ3jIN for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 22:31:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D321A40BD6
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id D321A40BD6
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 22:31:02 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5aHFpYkQAJLs75aHFplQpg; Wed, 14 Dec 2022 23:31:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 23:31:00 +0100
Message-Id: <20221214223100.684982-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN7aK0qGi1sAnthhVLl7kPZ7xbaKoSZK8YoMbw/9/y7NAGfJ8epEXjxkktLrVazEM3Hpg0qo4ONUwfjBlkjbOAhe2WE4qucs4j9jJfuTxDO8yGimhI+h
 8q5qGAk0kBAftgSTJ4HB7U9CcHWKe9boMHkozAX3tsXbB8DHRsnac69Td1nY7g4CKyzmYMWWuP9jT1knvwvPLbJCBbTmJPajWCFKGzn2zTLLpGnddmgdIb6z
 L+52bLHoIX7ZjR41Z51OTjzHbeINnopm/OTQw6m8kAKQouM2wSQ89ypDWcFSRXqaT0SuuwDJdUC2P45y4foCew==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671057061; bh=pNX/Oc0OooqZ3zZUN9TLS19QHiRfwaiekzd9PBpHsYM=;
 h=From:To:Subject:Date:MIME-Version;
 b=J+GSlpq4ARbQVn5QaOHQV16XRD5HokZYXEv1W27vHU6MGXgktkO4gM+fwo9xu5Vgh
 A9LG0iqHIbWdRTrqaaD5qQuagIAIrUt90ED7gRDYx8vjU21HgxEbmgtwmwhMRtPj8V
 KlzuJ2zgY1gIBwC6wuWWDLUGGaH9oedNJlJGnO+517AeWEzlWx20qRFmA7k4SQXaxf
 JBz9LwelZzYSfQ+HYf1jZ7eoBmqtRFKP4QvfbtDW+JWknt3zymjQY/vMS8J+cXjgpi
 xCG6nym3woEz589hDWVSaOmU577W6Ayhr3nRMWteHcYtbOft2ZzMyZOniuQGA6KpdE
 EyzKpmdZDlQAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=J+GSlpq4
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.86
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
index e3c27170e5..50c5e583af 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_85_RTM/src/SHA256SUMS
-sha256  afd9d64510b1154debbd6cab3571e9ff64a3373898e03483e4c85cdada13d297  nss-3.85.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_86_RTM/src/SHA256SUMS
+sha256  3f385fc686476bbba811035fa6821b542475d55747b18c20c221d4d66573b975  nss-3.86.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0f7daae0ed..f8fe076fe9 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.85
+LIBNSS_VERSION = 3.86
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
