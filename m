Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8432C4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 08:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512A960D91;
	Sat, 19 Nov 2022 08:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 512A960D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jn-uAyBLTWu; Sat, 19 Nov 2022 08:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FAAB60D54;
	Sat, 19 Nov 2022 08:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FAAB60D54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13CBA1BF35C
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 08:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC877821F9
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 08:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC877821F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcPERqQ3Q4lZ for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 08:41:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E37821F4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87E37821F4
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 08:41:39 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.233.114])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 78B9D5FFC7;
 Sat, 19 Nov 2022 09:41:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 09:41:26 +0100
Message-Id: <20221119084126.14859-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668847296;
 bh=lnws8wjBA3Nr47Pxf/SiT0cg8JxR1PC2eKLWSLo1fLo=;
 h=From:To:Cc:Subject:Date:From;
 b=Z5uJvaMQQRJDBEqtHi0DY4rNj4aJJuPjfwIcNT6K2oLGgH1mqspFIvjCZYaqdpzeI
 yFBc9gGdsyYceFD+gwMHQuHmhYQcCocoqIub8+mxHG0grTKTefo/M0pAtC0HXtDf73
 kl0J/F5wJA3cxanuT8xMei+Ow68HE5QqwiEC9J5e8kyzfqAKuy6H2NOlO1BQw8ajGS
 PpX8zLH+YvVVmDSUBXWuOYUbFjiZCtKVDBn65UgWKnMwy4LoeT8pOKN5GikCfwif6D
 95qB9lEF59g7TD4PDHsXIuqpL3iJfi/BdXP04m9DIXyk+wPv/GhZkSaErdGGZT+tJD
 sQ9+iHoUGfqzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z5uJvaMQ
Subject: [Buildroot] [PATCH next 1/1] package/gnuradio: remove patch
 numbering
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
Cc: Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit e37c110 ("package/gnuradio: bump version to 3.10.4.0")
included two numbered patches. Those are generating
"make check-package" warnings.

Fixes:
    make check-package
    package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch:4: generate your patches with 'git format-patch -N'
    package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...01-blocks-Including-missing-vector-in-blockinterleaver.patch | 2 +-
 ...2-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
index f805e300af..39b8c0b51e 100644
--- a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
+++ b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
@@ -1,7 +1,7 @@
 From 45fe4ac55ad88b6793d225e676205c30388ec138 Mon Sep 17 00:00:00 2001
 From: Ryan Volz <ryan.volz@gmail.com>
 Date: Fri, 16 Sep 2022 21:05:51 -0400
-Subject: [PATCH 1/2] blocks: Including missing <vector> in blockinterleaver.
+Subject: [PATCH] blocks: Including missing <vector> in blockinterleaver.
 
 Signed-off-by: Ryan Volz <ryan.volz@gmail.com>
 [Retrieved (and backported) from:
diff --git a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
index d551793be5..f1ad77580f 100644
--- a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
+++ b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
@@ -1,7 +1,7 @@
 From 901c2ad1ac88908a2e6db5615d5af39a218d826d Mon Sep 17 00:00:00 2001
 From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 Date: Fri, 23 Sep 2022 08:41:26 +0200
-Subject: [PATCH 2/2] blocks/blockinterleaving.h: add missing cstddef header
+Subject: [PATCH] blocks/blockinterleaving.h: add missing cstddef header
  (required for size_t)
 
 Fix build failure like:
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
