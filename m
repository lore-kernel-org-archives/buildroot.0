Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2644C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 09:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7BB40883;
	Mon, 14 Mar 2022 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8QucO9QBDDG; Mon, 14 Mar 2022 09:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31C240469;
	Mon, 14 Mar 2022 09:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54FE81BF3CA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 09:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4038540147
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 09:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJeaWwaZHeCR for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 09:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C8374011A
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 09:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF68583D28; Mon, 14 Mar 2022 09:01:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 10:09:16 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 77545c497e74ca68099969a86c1434d7aa695273
X-Git-Newrev: ae76fa4469a604b034082339150b986cde5687ec
X-Patchwork-Hint: ignore
Message-Id: <20220314090138.BF68583D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/samba4: security
 bump to version 4.14.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae76fa4469a604b034082339150b986cde5687ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Release notes: https://www.samba.org/samba/history/samba-4.14.12.html

Fixes CVE-2021-44142 & CVE-2022-0336.

Notice that upstream has decided that the fix for CVE-2021-44141 is too
complex to backport, so it is NOT fixed:

https://www.samba.org/samba/security/CVE-2021-44141.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 033d932732..0f18c76ebd 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.10.tar.asc
-sha256  107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af  samba-4.14.10.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.12.tar.asc
+sha256  155d9c2dfb06a18104422987590858bfe5e9783ebebe63882e7e7f07eaaa512d  samba-4.14.12.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index de019e7afc..c18d406704 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.10
+SAMBA4_VERSION = 4.14.12
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
