Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7419C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A511A81B14;
	Mon, 28 Mar 2022 19:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAL92LlgLD4j; Mon, 28 Mar 2022 19:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6683819F6;
	Mon, 28 Mar 2022 19:58:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3865F1BF9AC
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26CEA40178
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPHza7u5Blmo for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8715B4015C
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8A4EE85F3E; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 21:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cae2aa844f5ad0962ec073f6cac103c0dc6af1f
X-Git-Newrev: be3f9cde29f1727e264d6a2a023588273410c800
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.8A4EE85F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: update comment
 pointing to patches fixing CVE-2021-38593
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

commit: https://git.buildroot.net/buildroot/commit/?id=be3f9cde29f1727e264d6a2a023588273410c800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patches aren't in Buildroot anymore but in the qt5base sources
directly, so let's give the commit hash of the fixes instead.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/qt5base.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 5f158bd6f2..972d217ef1 100644
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
