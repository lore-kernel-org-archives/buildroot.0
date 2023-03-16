Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1DFC7618A
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 21:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DF84085A;
	Thu, 16 Mar 2023 21:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DF84085A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2Bt7zUYsqvH; Thu, 16 Mar 2023 21:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F35B4086A;
	Thu, 16 Mar 2023 21:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F35B4086A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B81BE1BF31B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD7A60B33
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD7A60B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLgT5IzvHnTM for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 21:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23F160B1B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F23F160B1B
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 21:44:35 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.31.40])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 480C6B0051E;
 Thu, 16 Mar 2023 22:44:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 22:44:24 +0100
Message-Id: <20230316214424.150589-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1679003072;
 bh=aC/iLEH6zEXmpKQNCk7q8OYH4yfvEyeJpngNmq1rUKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qgt9kbnkJR+habOzEd0ffrCrWD3SxfjP7U6qGCrkeLxn851PGJOo1ihKnJBfS3X3p
 1UNx20k3EbAGR0+u5YqZqHnuQZTLV+rr7LEZsvvQPLl5bOm9HgQpxaLstjx0xbpEQl
 9g02F4zGBVH3NiJh6L98CQ16GOTAN6cEvqR9JVEEb8C54AVi13OqwyOwccsaE3IwNS
 lKqOdQPQ1FD/3WA5lIrndTIhybgnq6v3pYxYIrBprLKFynl6rGW7kVy8e4x9NwRmt3
 3Tu+tULyiCrVA0Mwp8NHuxVx/NABU7DuY7RZF6+9yTAtkNnZyRa5w9rp+lLAPdmCV3
 WREU6jnX3R3Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qgt9kbnk
Subject: [Buildroot] [PATCH 1/1] package/less: bump to version 608
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
https://www.greenwoodsoftware.com/less/news.608.html

Note 1: the package patch is kept, as it is included in version 609.
Note 2: the license file hash changed due to the year update.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit d305189, with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -p less
    ...
    6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/less/less.hash | 6 +++---
 package/less/less.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index eed8340ec1..19be26cae0 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# http://www.greenwoodsoftware.com/less/less-590.sig
-sha256  6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10  less-590.tar.gz
+# https://www.greenwoodsoftware.com/less/less-608.sig
+sha256  a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209  less-608.tar.gz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index f01f94d6c8..dfbd411863 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 590
+LESS_VERSION = 608
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
