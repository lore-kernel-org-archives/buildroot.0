Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E984C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 12:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7D204029B;
	Tue, 15 Aug 2023 12:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D204029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcAXnU-kNf9B; Tue, 15 Aug 2023 12:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15ADC40C2C;
	Tue, 15 Aug 2023 12:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15ADC40C2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A18E71BF28B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 12:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AA3381E6D
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 12:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AA3381E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpvEB5FbAXjw for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 12:57:15 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 943B38141B
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 12:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943B38141B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07C5D13F8C1;
 Tue, 15 Aug 2023 14:57:09 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 14:56:52 +0200
Message-ID: <20230815125652.687317-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815125652.687317-1-ju.o@free.fr>
References: <20230815125652.687317-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692104233;
 bh=rXM3fn2Q6dvuMTUh0w7sw1nm0Vn2gWCwNQQbeeDD910=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RmpE0VjP2Lhs7x9V6fWrgWMAYDrxjQaDwF/kb8mvyVm3svlifvfXmoodKOGVIrcuS
 MI6YLdVaHqhO/sQyT4CqVT7okAohrxVv5ldtF6cY70E6LTyq0CovJ1nuo/2NEtvg5k
 jI95jN2emwB83G0+87BkptxYf541mS+mGPfSJ5lqZeNI2Ot4j36IzP33aZ9yFmJnid
 Mo5GAk4n3nODWshU4/xN+9xpn38/Tu4R4Uq5cjNnCaLR/A1gzbbH6swNAyr204Qzui
 r7J6+V/wwMC47HtWOA6vx8Pqp7TGBxei49XHZ8fMWTPxa36+8xPx9leBQcCeP5g2IJ
 xdn6Qi7SsAx6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RmpE0VjP
Subject: [Buildroot] [PATCH next 2/2] package/nftables: bump to version 1.0.8
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://netfilter.org/projects/nftables/files/changes-nftables-1.0.8.txt

This commit also adds comments in hash file:
- that pgp signature was verified with links
- that the license file hash was locally computed

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nftables/nftables.hash | 7 ++++++-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 7e1e856229..c5ede1130a 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,8 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  c12ac941fff9adaedf17367d5ce213789b98a0d314277bc22b3d71e10891f412  nftables-1.0.7.tar.xz
+# Checked pgp signature:
+# https://netfilter.org/projects/nftables/files/nftables-1.0.8.tar.xz.sig
+# with key:
+# https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
+sha256  9373740de41a82dbc98818e0a46a073faeb8a8d0689fa4fa1a74399c32bf3d50  nftables-1.0.8.tar.xz
+# Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b0a14bd429..acc72f4bf3 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.7
+NFTABLES_VERSION = 1.0.8
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
