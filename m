Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3961F40497;
	Tue, 24 May 2022 15:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dx9E-Ou4rFg6; Tue, 24 May 2022 15:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F0C640585;
	Tue, 24 May 2022 15:08:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E991A1BF989
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D865A415CD
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjWdFMrzeOO4 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1600D415C8
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6F09A86490; Tue, 24 May 2022 14:56:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 17:05:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2e8f172124bc5296b5338c6b6a26951024250fd2
X-Git-Newrev: 85e0bbd7860a349d57349fca9fbbfc4705d0acd9
X-Patchwork-Hint: ignore
Message-Id: <20220524145615.6F09A86490@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/expat: drop
 host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=85e0bbd7860a349d57349fca9fbbfc4705d0acd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop host-pkgconf dependency which has been wrongly added by commit
732d94d25fd10fff65a378b03c3fca9bde403e95. Indeed, expat doesn't use
pkgconf to retrieve dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5bc935665bc08d4e144f6aea0786df5aaade248a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
