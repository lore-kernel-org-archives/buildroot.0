Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C358C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F63B416AC;
	Sun, 27 Mar 2022 20:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdeOwAJQCeMJ; Sun, 27 Mar 2022 20:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457C8416B4;
	Sun, 27 Mar 2022 20:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01F291BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6166416A5
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56Rfv_tkYiHD for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:29:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 396CD41626
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6EE4385EA2; Sun, 27 Mar 2022 20:20:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 22:22:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2366533fd1be0bea767ef68fe2d8d45e676a4f5f
X-Git-Newrev: d87883dc8d39bc597171e6f82bf0011b842876c6
X-Patchwork-Hint: ignore
Message-Id: <20220327202020.6EE4385EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5/qt5base: fix
 CVE comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=d87883dc8d39bc597171e6f82bf0011b842876c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e forgot to update CVE
comments

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8b2adbff1585b2581c76c9abcc8d5529134be60c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ef38d03253..b20bdea7f6 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -12,8 +12,7 @@ QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
-# 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
+# 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
 QT5BASE_IGNORE_CVES += CVE-2021-38593
 
 # A few comments:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
