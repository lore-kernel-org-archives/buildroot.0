Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25583C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A09084181D;
	Sat, 23 Jul 2022 16:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A09084181D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lmw_b05Y13oS; Sat, 23 Jul 2022 16:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43401417E2;
	Sat, 23 Jul 2022 16:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43401417E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDAB71BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04A7402B1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C04A7402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJFwuAlDys_G for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE98D4018E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE98D4018E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AE102846D0; Sat, 23 Jul 2022 16:05:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:17:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1bcb2a45c4ba42d8dea3ba7c3413cb1d0fcab93
X-Git-Newrev: 92f0ef5eaa74af28b2b7b7abbe021bce2aba4875
X-Patchwork-Hint: ignore
Message-Id: <20220723160527.AE102846D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettle: switch _SITE to ftp.gnu.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92f0ef5eaa74af28b2b7b7abbe021bce2aba4875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The former _SITE is not longer accessible without authentication.

The homepage is also unavailable, so use the one from the FSF directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr: also change the homepage]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nettle/Config.in | 2 +-
 package/nettle/nettle.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nettle/Config.in b/package/nettle/Config.in
index cf4803c7bb..92a0e0b59b 100644
--- a/package/nettle/Config.in
+++ b/package/nettle/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_NETTLE
 	  object-oriented languages, in applications like LSH or
 	  GNUPG, or even in kernel space
 
-	  https://www.lysator.liu.se/~nisse/nettle/
+	  https://directory.fsf.org/wiki/Nettle
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index c3d5fcec64..05b8b0bea5 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETTLE_VERSION = 3.8
-NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
+NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
