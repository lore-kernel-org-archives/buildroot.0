Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C852C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:50:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D8A60FC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78D8A60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E1B640264;
	Fri,  3 Sep 2021 16:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEW1c9x8lEEr; Fri,  3 Sep 2021 16:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34DA440182;
	Fri,  3 Sep 2021 16:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFBB41BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F61340182
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFxiLyhDbLIq for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:49:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157F3400AE
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:49:56 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.145.143])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MCO1mdrEOXGunMCO2mYUTT; Fri, 03 Sep 2021 18:49:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630687794; bh=nt4R0OJYS8oDr4P7SAx+18994sWXHn3tD7p7G4XfiVk=;
 h=From:To:Subject:Date:MIME-Version;
 b=nwWVGJ7550j/yQjLvbJZeEKSllqKBneeA2O4phqYuQr5g/pJPQtlqLxZq5DeJ7T92
 Ohf528r9QKbmFoYg4mb82psoxZJGeoOYi6OWyUcEfRMHvzswEH6VaiN5WMsYYp5kLV
 N0QHotjqT0IEqD8NhwCjGYjzK2q05CIyJNnQ/hSC6URdQzpbQ/hbC8hnWcTV3taGZd
 vsg0IRowJFxKbCe9nDNO+wP7o5ocbW8ApV3ydZfvz75NHRm+0D0aRThds0mFaUlQDi
 lIH+MB2KXlj+GbBYjixnmcv81pUPvB/A5hWBE+LL9SegeduQj8Bl8kKXzYIlPh2RSS
 AB3MKp1dhQg+w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 18:49:52 +0200
Message-Id: <20210903164952.33144-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfF4sjN5myh7peyqzYScJx+4tWN+ksRPPa0FsrZJZssJYAkgbfXODViDrXAzm4tY2hqoiMo949ddx+CzENFOJAdVfC2peN7AUuzOzkJGQNboHzjx4SEZf
 ocI/gf940L6MYX9GjWiyqfkRn2jBvR3avtdTFXWcs+tm9GYKehWEiAJyUowvEn076IH/HTxcRPWTlAqc+ZyYlKytJH9yAd0hpgWzixtWElj/cihZKhgduPuO
 DG6ZxeDeV7l+rtpYbhKQX9ZLQamOxkjczFF932dVDEheZFZWIAcXu0b68tHX7eFk
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.69.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.69.1_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index a35b382050..8073913e7c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_69_RTM/src/SHA256SUMS
-sha256  c880205a365e0dd488ff29fdea82716ff9fcde9da6f3b703d636f8fc08008799  nss-3.69.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_69_1_RTM/src/SHA256SUMS
+sha256  bbdbd248c25e2faf498edbdd2ffd5896b54cfa35bd2e450813b491f805c754e0  nss-3.69.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 63364ccb27..83954cc124 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.69
+LIBNSS_VERSION = 3.69.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
