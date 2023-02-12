Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46281C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 13:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C1840399;
	Sun, 12 Feb 2023 13:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4C1840399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIeDCFxEU13b; Sun, 12 Feb 2023 13:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DB11401B1;
	Sun, 12 Feb 2023 13:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB11401B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB4BA1BF593
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 13:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD5DE4099E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 13:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5DE4099E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9qdNXqNU8ij for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 13:00:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A4C40992
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6A4C40992
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 13:00:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RBy5puVbiWQwzRBy5p6TYU; Sun, 12 Feb 2023 14:00:33 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 14:00:32 +0100
Message-Id: <20230212130032.724850-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHwBKkDof5R9umyiInZ6IBh8z7CgkC5LusQNgh6V2JyRgkhgBeOkeM/c72/4z9b4ZU+7Pt/rc99ttwLm0sM7U72Vm10IO7650M/CI38NrVMSxlWr5IgE
 9kpM85ZxpC1Gh7oja0qqCtZmK6V7IgultAIulH+aV+ED4nxxbFhD8SvraD0jyAiMpy8+US3kuZGCx4PF/mmmo/XUlXG9SoPq2VIc1dtdD6FxpFR53Gr6nz49
 NjZu1UJJsOm4ZmpFFpUg2hSGlyz/X2TzSIF9S3Z/ylOatAQJwG7vFEa1sbBKr2ppiDnG+gMnM3QrLgC15n1jXQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676206833; bh=juCjt+GghFsAm6G4myUwUKSgSCi93wXxKWjTrtRC8jY=;
 h=From:To:Subject:Date:MIME-Version;
 b=eUHGFCMgLY9m0R4s5/V77ipWOrgvXpFIj7VMlhIJYKoIY4eyEnXPMB5Xm0/EglDxE
 exu2jrEtn0nup1liBEsJBgi36nIgDXhFViE5ALYwUf53DtSDjJwMp+MbYpxhv21VpF
 mxRSq1sMorG7Hh8hxd1bzFGb4HEgkZRjGR0D+3KKY5kVfBSnON1v6JOm0qidZr67nM
 ZmDE7dd5rH/gX4QXwhblExgHvfbsQY6H16Mwcqunr087oABtFD5sw+z+RFmDJ2GEMH
 D84km8rqM3NMnZaa8v6RSgbNlI8PV/NE6y+cXfxbx0hWT3cn5LNrw3QNrSSslI6dGM
 0nTDWEFgGF3FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eUHGFCMg
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.88.1
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
index f847ec4f77..ec3fe0d777 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_87_RTM/src/SHA256SUMS
-sha256  68a1894496d3d158babc75f8a5dda3f55b7c1560573936e3b101a10fa4ac152d  nss-3.87.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_88_1_RTM/src/SHA256SUMS
+sha256  27d243edf87d1cf1bb9c861f03d387e0e9230ce5017f4308c941f558b54b3496  nss-3.88.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a60e615f9a..3782d239a5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.87
+LIBNSS_VERSION = 3.88.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
