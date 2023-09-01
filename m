Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811BCA0FE8
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 20:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1247F4058B;
	Fri,  1 Sep 2023 20:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1247F4058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEpTmBWYj5GG; Fri,  1 Sep 2023 20:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C5EA40414;
	Fri,  1 Sep 2023 20:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C5EA40414
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4631BF3FC
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 20:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43082420E0
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 20:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43082420E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7H_OLAOsKDH for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 20:50:26 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97A8B420A9
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A8B420A9
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EEF8E13F89A;
 Fri,  1 Sep 2023 22:50:20 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 22:50:14 +0200
Message-ID: <20230901205014.10692-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693601422;
 bh=0cxQr+DWmNrHqjYZ8exLWVQ+i1s+cedi7vJczxcZHpg=;
 h=From:To:Cc:Subject:Date:From;
 b=NzhzSmxZbRVpjMyDemhWoSVTGcOPwnlDebb+wpC4+RlftCeRW21cDu9KFghIZDwOT
 KgoRNBXaD1Q/4I0mLZdS8w3l/g6itHEuSExRyMhCClWuKFhzqeHUg2zcZCZGDdVnxu
 XMhcIhfc7ReAH3NxXhR4IXqzTFiQAI1UVZ7ABfBag8D0xt5qI6LUaJg3HJVEsQP5aX
 DXKEBNDd6s+WgsVy1TksnyMe4g9a7csB8532yRh4L6K+VVBm/S27PeFSHifEUD+W0y
 Pgugig7VDgG55tPPqpInZ/qIQGZ81YYhvxRnpq2zMNivAoyg14rEwNu9XZAwFOVyRW
 xG6acjMgiblXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NzhzSmxZ
Subject: [Buildroot] [PATCH next 1/1] package/less: bump to version 643
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
https://www.greenwoodsoftware.com/less/news.643.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 8018c9fab1..c44e246773 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-633.sig
-sha256  2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f  less-633.tar.gz
+# https://www.greenwoodsoftware.com/less/less-643.sig
+sha256  2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8  less-643.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index f7211ef112..7431d80cc4 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 633
+LESS_VERSION = 643
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
