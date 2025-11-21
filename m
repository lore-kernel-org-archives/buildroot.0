Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0428CFA77F
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 11:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FEF541EC0;
	Fri, 21 Nov 2025 11:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gM7QXv3w2Ply; Fri, 21 Nov 2025 11:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704E4428D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704E4428D3;
	Fri, 21 Nov 2025 11:22:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 568F7117
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 11:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7EB41EBD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8ztg0v4NwXc for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 11:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5530E41EC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5530E41EC0
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5530E41EC0
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 11:22:22 +0000 (UTC)
Received: from localhost.localdomain ([79.7.167.199])
 by Aruba SMTP with ESMTPSA
 id MPDXv75PI3pJ0MPDXvBAAN; Fri, 21 Nov 2025 12:22:19 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 21 Nov 2025 12:22:14 +0100
Message-ID: <20251121112214.640511-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251121112214.640511-1-giulio.benetti@benettiengineering.com>
References: <20251121112214.640511-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK4XRXgsv/eUmvYS+7RvVZXhuAf9WBczAEPQraLiSdISlQQ4+VXrPP5HXU+MhydaNLa91NmZg3uW50KoSv5cUJ2J3o6gTP5gF/ZxaJ5yNGFlFc7e4Nfy
 +b1KuZB/HL7pLJU3XU43ZDgkayFic8PDJL4vk1jNSWg8s7BVuJK0N4nX7SE4PU8hAWggAvoYJ1b3X7LayzagsqiHlOLChk43lJEBAyndSbHGwWjFr14QSube
 dNdtjKYqE2S8o2QrWpTq5LajmlQ5I5bZ7I/5pUpN129NdHsPdsZTcS85k2IjVhP6w1RHIzLTTjrbjSYt5Fb+Vg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1763724139; bh=SaKKYODCkZSFF9xQPoIjfrxz2uLyN54luVDlqgtDq4w=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zar23890XN4gJr9UqxBJDUHBfNg2/WKe8ZY1ApLP5tWa72zP1k76S+PjHBmDoU0Xq
 cSpgEf4BvgiEF1Y7wF2keOg8VTyo/nvLkjJlRC6KRzoQTacUkViesh25irgiDmvfzP
 pw1lGQsp2tx9NBqJLKwPQA+4HPgjZ4XrRFHKRNR2qZqYX5akxUOzgS4gtoy9TlFOBz
 YF45SUZKDmiXJ/4P5dV8lq8kUVYeeZlkV03sTHmxIC20NoC8k1Rsmz8mRcD+uzKGh4
 K7cdsgYubROZ5zGnnN0ZaPfM8Kpd5BxTYJi9C94NtRKTyhQ2dpCsBxvSV2/92SlCis
 rSzOGWDVcmnSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Zar23890
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.118.1
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
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_118_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index cf339697ea..d4824bc81d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
-sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_118_1_RTM/src/SHA256SUMS
+sha256  8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3  nss-3.118.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9b85e86ac6..b075be7715 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.117
+LIBNSS_VERSION = 3.118.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
