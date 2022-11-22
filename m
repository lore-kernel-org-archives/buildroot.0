Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0412EC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 16:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92BE440B13;
	Tue, 22 Nov 2022 16:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92BE440B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lH1CHkmqXS2z; Tue, 22 Nov 2022 16:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C2C40B48;
	Tue, 22 Nov 2022 16:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C2C40B48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF0B1BF841
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 16:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 142D84022F
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 16:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142D84022F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ocl9ZNkvkL0 for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 16:18:30 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B496401C1
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B496401C1
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 16:18:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xVrmoDiUW9hDoxVrnoDR1l; Tue, 22 Nov 2022 17:11:23 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 17:11:22 +0100
Message-Id: <20221122161122.568208-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN6FN6O9Lhq0RUMJjmJQ0JfggL/OyWp8WtdkBCPVG5EjKD6dhIUsExyYFZ6vHQKLd9yHFwr2MdZ3mFqG3ub3MNQnf7ybenRZq1jsudJ2t2fSjmGmqYVz
 0Lr9bvbYCVy9lzXX1R4hDtHA/WKnj3Kx+1cDX9DFkwhQuSnFgyv1V3WtKan73ZVmerOitt3/oHrIWJ+y9CfHojkpILpSgblng6V7E2iZ8IHOA7Cm0WnfHzJ7
 02r7gtb5f8SczY9m6X82iMoH2TobyPK0yyDR7uN1jVn9U+R1hLIj3Vgta8mIRLDoSeNXdKae2BCBYm2rlIN6VQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669133483; bh=9ycAyWIvpbzbbNUP4kX7WwMg2NSDBLQEBzacfTMjCSA=;
 h=From:To:Subject:Date:MIME-Version;
 b=EKL6hFVkWbWR/ozcx3aklLrjCdKXrOrHT3E/vVhRkv3mXjPZzf6tz1kx2haoa25Av
 yE0ebkh/C3liIlI7ridyBfOyTPNvW7YWv91Pk6hBU4CSFWVtHvjUMZNF6LIqmw8T5E
 xWGluSqct6QpWLSEHi0jL071bhLy599c/3CSQBrSeXbRe4XMlV28nvvdwD5+QL5CnC
 KmQDxbKgb/RrWgxSbytpLuFyMaJ1X5yZZbT3EK3ikkSKC7Ved5nka4l5ShN4qpOsXD
 IQa68W3TtIWYf+dMEOsgsMRMMns41YKanaNK7lK0BtRNo6O6dwcOqL1W94GQdmHi/3
 UainiOqRI0qSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EKL6hFVk
Subject: [Buildroot] [for-next] package/libnss: bump version to 3.85
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
index 2b34cc1a77..e3c27170e5 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_84_RTM/src/SHA256SUMS
-sha256  9a387ffe350ff14f001d943f96cc0c064891551d71e1a97a5ddbffe7f1207a25  nss-3.84.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_85_RTM/src/SHA256SUMS
+sha256  afd9d64510b1154debbd6cab3571e9ff64a3373898e03483e4c85cdada13d297  nss-3.85.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 041b2cfc56..0f7daae0ed 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.84
+LIBNSS_VERSION = 3.85
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
