Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A24C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A2C841B9E;
	Sat, 23 Apr 2022 15:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KISJEaJpeNes; Sat, 23 Apr 2022 15:14:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BDC41B84;
	Sat, 23 Apr 2022 15:14:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D299A1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC40041B43
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hC4dkZiSGjS4 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F6741A47
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AE71583FD4; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:43:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dac5873314581786630466741074c1e3af61b2b4
X-Git-Newrev: 5bc935665bc08d4e144f6aea0786df5aaade248a
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.AE71583FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: drop host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bc935665bc08d4e144f6aea0786df5aaade248a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop host-pkgconf dependency which has been wrongly added by commit
732d94d25fd10fff65a378b03c3fca9bde403e95. Indeed, expat doesn't use
pkgconf to retrieve dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/expat/expat.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 92a3bfda8e..a42c77e0fb 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -8,8 +8,6 @@ EXPAT_VERSION = 2.4.7
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-EXPAT_DEPENDENCIES = host-pkgconf
-HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
