Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4619C64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 18:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01BA3408EC;
	Sat,  4 Mar 2023 18:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01BA3408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2LyC5I1yEN4; Sat,  4 Mar 2023 18:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED153410E8;
	Sat,  4 Mar 2023 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED153410E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5671BF5F5
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 18:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF8940517
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 18:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF8940517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nYYVx00exzt for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 18:53:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E993400BF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E993400BF
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 18:53:53 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.164.108])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D345E780306;
 Sat,  4 Mar 2023 19:53:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 19:53:41 +0100
Message-Id: <20230304185341.127963-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677956030;
 bh=HD4RVwAaGvbBE4Aa4fxqj26yu3XT8FrThWxJunqcbmM=;
 h=From:To:Cc:Subject:Date:From;
 b=ms/YE7ek/rrDTs1C/eEc8EHO8JgrYTI2t9VLd/2i5fxt4bJ3CxwB+X3kB47xlwKjy
 58SF1k4pVRpXkHjuWPyDiJfi6TWJ2uInb0qefKrxI5JZdehUtcoZFxG7A4gcCFTDkZ
 LSQO+FJLUJK4leSRu2suTUGBigEH6wfKLLliWRJ+Pl0cm8Z1M/t38MvlTApHw7NhUY
 fQ7j41aB+RAICuwaY2Sm1LqNvGxJVPF31EHkG0T9hOdzJ15m8zP7feVaGUSgDCLUaT
 +JBdlT/bv3Ov9wGejQPSb5EBwIrkUFp3HdqvDPSgDClQ/QJpB9QCPj1tjCQ+fIYGcP
 J0SI1O17B78xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ms/YE7ek
Subject: [Buildroot] [PATCH next 1/1] package/mtools: bump to version 4.0.42
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

Release announce:
https://lists.gnu.org/archive/html/info-mtools/2022-10/msg00000.html

For change log since 4.0.38, see:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.42/NEWS?view=markup

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p mtools
    ...
    45 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index a162bfdc95..b81830a7d2 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7086821b399a39b8a3c5a372d064de4860f3c195b4911dd4e8b76219fcabe75c  mtools-4.0.38.tar.lz
+sha256  40a98fd9bcc865997866015013c3c64a304d98c2892fe4ab892ffd6ac3dd9bae  mtools-4.0.42.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index c875814bc7..407ac1a2c6 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.38
+MTOOLS_VERSION = 4.0.42
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
