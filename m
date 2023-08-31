Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FB8C83F2F
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A56983267;
	Thu, 31 Aug 2023 18:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A56983267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYBKBEVZhCt7; Thu, 31 Aug 2023 18:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAA7C81F6D;
	Thu, 31 Aug 2023 18:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAA7C81F6D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEA9B1BF23B
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 18:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 957E940452
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 18:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 957E940452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jvasTwMPRJb for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 18:12:18 +0000 (UTC)
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F09B640443
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 18:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F09B640443
Received: from localhost.localdomain ([146.241.105.17])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bm9PqhstR7c04bm9PquAEq; Thu, 31 Aug 2023 20:12:15 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 20:12:14 +0200
Message-Id: <20230831181214.2547009-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLentqCa13CMTcoRFF12dDcg/EQQhJe7e3UEegR2TGNADWC2BqUoZkouf4l39uaRvvZUr35Btnu5Fwk3pi4lQNOtqT/2XhHUEDu1cFlp7nsZEYGTVuUX
 zdTx3iCtYzmaWZI/gYbzth1c36h4D3Yg9u6FhyYhgNB770BY6WA5l1YfV43Fg8bCsQ+0ZKJRbvk4wrvRpDkaXHy7HSC+Hlq+3SRCpAFX/5uam/i+GTN2mOb5
 CxCvzWkubRGGViH584ncl0jpRGWQRWt6mHo3dVwYuqytG7xXUjE2JtL5ejSDdnj3+cdhHw2+nyR5OdLte42WGA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1693505535; bh=mI66cVyNsqD3DltIsEPwoM+23weZ0O52cUkVaTyCuXc=;
 h=From:To:Subject:Date:MIME-Version;
 b=aMtyHdP9rzOyAhfzhV4cyzERrjM6qeFT/+u+dRWRTEPrG0hgStUFpakzDHbHUOnGj
 gnZc2Xyrh4bNlvFLhS8HzinRwcDw4H/iOC5sx7eDsCDBZh6C2tZAZVL/qt9junRY9n
 qo5Hm2UGrb2UV8M1tZ1kccdYkjUcl1PzVttcgVpvDQ+LSuhXKTrwkZpCmDEEI4WhHE
 asCBe9sVdShUpOGfoZuqnM4p+Xn32I52hJ9bU9oUwopz3tSERiCwiyzyNe8QgA6/bj
 Xi+dQzEsI9qhSM8hy9VISTJkHIW3kDJP3lKlJ4AN71Ff/5yHP7RxKh7jPzu+yk7kBa
 Mzfyv8KiCnbqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aMtyHdP9
Subject: [Buildroot] [for-next] package/libnss: bump version to 3.93
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
index b95c0448b0..a3b98b0f8c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_92_RTM/src/SHA256SUMS
-sha256  3db192d6e882039af02ae7eaf3217ed114bb7ad83414c646772ab8021e24a254  nss-3.92.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_93_RTM/src/SHA256SUMS
+sha256  15f54bb72048eb105f8c0e936a04b899e74c3db9a19bbc1e00acee2af9476a8a  nss-3.93.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 64463d1f10..abdce32efb 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.92
+LIBNSS_VERSION = 3.93
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
