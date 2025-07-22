Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E83C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 22:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27EB415D5;
	Tue, 22 Jul 2025 22:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bFzKEoN1q2n; Tue, 22 Jul 2025 22:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CF5415C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CF5415C8;
	Tue, 22 Jul 2025 22:08:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C644CE0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB22C403F6
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8U2PekAkVQKj for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 22:08:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53E1140142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E1140142
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53E1140142
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:08:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id eL9yuYLxgD5sdeL9yuqBeA; Wed, 23 Jul 2025 00:08:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 23 Jul 2025 00:08:29 +0200
Message-Id: <20250722220829.3428015-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250722220829.3428015-1-giulio.benetti@benettiengineering.com>
References: <20250722220829.3428015-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAPkQrjeOok0iiBpCFJa9//tFtruE4JlrS8NJC91+U4in+gtFmNGybTfbtGUWo2DnJbHAnBFpengD6u6CM7zGigvNpMh/uexDMQg035jLpUqUhoUl1PF
 p/RsciyhLypw+XDXeomrV+CQ0K6TgA164AwowhLChT7dcWSR80XEvtArpxARb5Uej7gWP8sMM9MtPtNy1s0xO/BtPJebK0gbs/Z2POuzjyCG0V+FrW55sVtx
 WbJM3fzAuHaEYt+jiqJlK0Ld6LQehBs9M8iJfKOgRVgk/w/j31RZymHMgxLymyNpkrRIP6U9qtn3o23jFKgnuw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753222110; bh=z4Bq4EqzQHD2hJMBG7Ni4sorpxrpmkjKa/r4/Ig8YTk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Y9d/MxTccxh7WY0zF0KyMCwO+jothJfoFnR2/f0Xr3xC30/6b1n9MKemIN1zVDv+0
 A0gk6W/uoTvznfol/IwMUJgo9Hhnsl7ScJwwt8/CeyaLOPtiMdffgDqJM0x495PztB
 lfU/CVC8BRe8jQDiXPt2ZT6LWoweqCJyKbmD1DOsrQPXHtQcytzcPGzP05z8svMPlC
 s0ste1lcdLvmtmGNdgQHdak3KMz0W/aWbdblFWXup/M4qv17mTaf91s220AR3pPGPa
 Z2+70U52u8JQT2WPm8ym+gSl7K6b2qinPs5J+n3lWRvSMC9DYp5ojFTugQ9RFpFKZG
 t/5wo8VWN6mKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Y9d/MxTc
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.114
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_114_RTM/doc/rst/releases/nss_3_114.rst

NOTE: starting from version 3.114 NSS requires NSPR >= 4.37

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index e0bbc82413..764bf1d179 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_1_RTM/src/SHA256SUMS
-sha256  b8c586cc0ac60b76477f62483f664f119c26000a8189dd9ef417df7dbd33a2cc  nss-3.113.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_114_RTM/src/SHA256SUMS
+sha256  cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1  nss-3.114.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index d6a9e9e2b1..1925cc3157 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.113.1
+LIBNSS_VERSION = 3.114
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
