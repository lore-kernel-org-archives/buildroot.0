Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CA084C19;
	Fri, 28 Jan 2022 11:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxkgn-_NGTLb; Fri, 28 Jan 2022 11:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D92F84D2F;
	Fri, 28 Jan 2022 11:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34BDC1BF338
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 301FC401CC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTcv5_skYdzl for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 11:05:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0252A40167
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:05:49 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DP4anjjgTc6LXDP4cnuiMS; Fri, 28 Jan 2022 12:05:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643367947; bh=D4DSzYDuUPpeSQvQN45/1AyeT46RoASHr3Tg/6j5XCw=;
 h=From:To:Subject:Date:MIME-Version;
 b=JsUDqsZCIM5RjK9fA+8i9xwxxdvgU+/DOjCwVUzhkalHACp5ZOqB+PnmaK4DdDy6W
 IxaDlir+/BovqvPqOCuKbinpvGnqy/yaSBfaGck+3gOMCqh98jSeuFof3il6LGNCAQ
 LyUut6cOE0rJq8pgV3V6OGaSz7dDk90QrH1NjXphHP1Bsji7Djh71ww3tT5iXH97PR
 Uj6BgFNxJNTDHqg0LmOUDuqPoYzNSW96Ie9qw8MClqQI+j1+g66w9Z8bdPJ3Q/2ff4
 EPnyu5uqHLWoN/8MVaOmeuslcqoqCFNJaWLuswlV+FRnqnPan/bkpI3qIRSFNl1EJP
 VfYlV7heqX+GA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 12:05:42 +0100
Message-Id: <20220128110542.1101197-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
References: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOa1+YS1WKKHtZl0UL1VSFYXs4YR9REIvPD7tRiyRtNNIuRs/aYBstjw06szJNsJx5sW4eKYUa+kpFRDeX20tlwBqt7w6HqUkz0EkpWoR9e1CqlnKDf7
 5zthBJ2UxIbsH797epwPlwKgJJooiUPtkoSFrrnh7/4fqhtrqQqnAd4RUzhlaGciWJeTnmh99vsolrmsuihWuXoe9zpEbNRIGDqEucQmuv+BEBuzeZJafSKm
 1Zp3nO9Vp+BMlW/Rj1Kj0r1/CfuGyqcgRAK9PYm+P8+QscNlyrZEucGRg8HJdp9iwiGWA1w4u+AqMVsA2/ezjOx9zjm39ujPtE7UTIalu7GkVF7k5/0Ah8aZ
 CBB87rr8
Subject: [Buildroot] [PATCH] package/pistache: disable package if affected
 by BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package pistache is affected by binutils bug 27597(Nios II), so let's
disable it when BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y. Let'a also indent
the comment dependencies.

Fixes:
http://autobuild.buildroot.net/results/0e7b74c5a07ced2bbae1a0a8c7d7ba26dfa04031/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/pistache/Config.in | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 64d6340827..96aed5210a 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
 	  for C++. It is entirely written in pure C++14 and provides
@@ -12,9 +13,10 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar"
+comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-	BR2_TOOLCHAIN_USES_UCLIBC || \
-	!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-	!BR2_TOOLCHAIN_HAS_THREADS || \
-	!BR2_USE_WCHAR
+		   BR2_TOOLCHAIN_USES_UCLIBC || \
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		   !BR2_TOOLCHAIN_HAS_THREADS || \
+		   !BR2_USE_WCHAR || \
+		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
