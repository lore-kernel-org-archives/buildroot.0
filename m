Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D2DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 15:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CC17410D2;
	Thu, 31 Mar 2022 15:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhRQ6mT-oh-O; Thu, 31 Mar 2022 15:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC6B410D1;
	Thu, 31 Mar 2022 15:50:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D88761C113E
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5E8183396
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxIhw__IWwB6 for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25ABA83339
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C667C860B0; Thu, 31 Mar 2022 15:40:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 17:46:45 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3b6347fca9dc103d272d28792f00d214e1452996
X-Git-Newrev: 6ab6120d694c63f2b422d11c25ed0b4d14c7a377
X-Patchwork-Hint: ignore
Message-Id: <20220331154028.C667C860B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5/qt5base:
 update comment pointing to patches fixing CVE-2021-38593
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ab6120d694c63f2b422d11c25ed0b4d14c7a377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The patches aren't in Buildroot anymore but in the qt5base sources
directly, so let's give the commit hash of the fixes instead.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit be3f9cde29f1727e264d6a2a023588273410c800)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 17c32c86b5..14b58ba384 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -12,7 +12,9 @@ QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
+# From commits:
+# 4ce7053a59 "Avoid processing-intensive painting of high number of tiny dashes"
+# e7ea2ed27c "Improve fix for avoiding huge number of tiny dashes"
 QT5BASE_IGNORE_CVES += CVE-2021-38593
 # From commit 2766b2cba6ca4b1c430304df5437e2a6c874b107 "QProcess/Unix: ensure we don't accidentally execute something from CWD"
 QT5BASE_IGNORE_CVES += CVE-2022-25255
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
