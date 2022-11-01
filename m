Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3300C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 16:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA4B415CB;
	Tue,  1 Nov 2022 16:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA4B415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbgTFGlT_oPO; Tue,  1 Nov 2022 16:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2163415DD;
	Tue,  1 Nov 2022 16:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2163415DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC81C1BF859
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 16:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4FD181429
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 16:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FD181429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_2crO30rV3S for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 16:57:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1B280ACD
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D1B280ACD
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 16:57:17 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 46348440774;
 Tue,  1 Nov 2022 18:54:54 +0200 (IST)
To: buildroot@busybox.net
Date: Tue,  1 Nov 2022 18:57:06 +0200
Message-Id: <5c28d160a68a33114f598450fed73bb1d774d9dc.1667321825.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667321694;
 bh=kgEHMFshiT9u7cZwDk+I0rXcc37JREaIChtDs6dUdh0=;
 h=From:To:Cc:Subject:Date:From;
 b=uvy6P6N9/l9Tpjzx28SSRP2KaRSO1oaqtMM+vge9taUAwRVbHBlWLuXMS4hx4vbzN
 gWT6At7EeUvPBm/IobeRfUguxFpgW+5beVqhPJDzdyf+Od4OwSvPc3ex4+COschFxk
 6IsaffW49XMHX1qGraz3wHiXAeTgqxhaIJjP/IrMlWTHG36Kfc/WcP92XkXNzlZTcA
 Z2KPFjiTB5IidMrdZZA1/wtWMtn8HJN7MoYPYW/O1fdpWxfYprD5tzZRcthkLwgviu
 ClQit1idPKSsQHH4siLqkW2NMhz0fJhrRq3LTPauvLlYHKV2OR0q7ofgOBA/op6j4h
 LpcVsqxDnSlEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=uvy6P6N9
Subject: [Buildroot] [PATCH] package/strace: bump to version 6.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index cadcb20f4781..1743a369b4af 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.19/strace-5.19.tar.xz.asc
-sha256  aa3dc1c8e60e4f6ff3d396514aa247f3c7bf719d8a8dc4dd4fa793be786beca3  strace-5.19.tar.xz
+# https://strace.io/files/6.0/strace-6.0.tar.xz.asc
+sha256  92d720a666855e9f1c6a11512fd6e99674a82bbfe1442557815f2ce8e1293338  strace-6.0.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 7bdf36a47e6a..09e620530e6e 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.19
+STRACE_VERSION = 6.0
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
