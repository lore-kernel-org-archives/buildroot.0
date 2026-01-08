Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A1DD148BF
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 07:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E196A827AF;
	Thu,  8 Jan 2026 07:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iMdA5s5DWB2; Thu,  8 Jan 2026 07:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7FD82733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767858788;
	bh=sQ9BTz45Ll22tuQdRfIGv6ccZIUPOiGBTHvwNt7UKiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NswzoXltSVZlWwr61PVx6xnzGrfZ2X7FPyiq4AA8bQjvsRf/BSaUN3g9IADgVVVMR
	 /rJ8gUym8+NNqKDagAydWrA1hx7a9xobr/NGISUWPfCPcME8LpIsa/pcBtEoPwvuOS
	 rGC+qiROEsIdEaMma1xDxSAnDjSQZp0gFouVUS4WOuWEgTfSKgVyzaby4r190p7bCQ
	 rB3yt50pz+dJ0gPZnIx7ZaVda1BatkOg7CKMRhxUsGlQp7Ev89KwsMU1RWkwSinweQ
	 IhoiZa1UJT5DMl5CWjeJlycmBpwn8wRDTO+7s3eHUuj+ml2vT96sCYFS4fAhEC0JBJ
	 f+Qpl6wk9kgYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C7FD82733;
	Thu,  8 Jan 2026 07:53:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 335BD237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 07:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E8F060D66
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 07:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_tNjvb1v160 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 07:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034AA6078D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 034AA6078D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 07:53:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E66028832A; Thu,  8 Jan 2026 07:53:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 08:52:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e985152990110c3fc21c6de205abcee1039c077f
X-Git-Newrev: f510a02f93be1971610b8ae910c6a74266da824d
X-Patchwork-Hint: ignore
Message-Id: <20260108075305.E66028832A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libconfuse: add
 CVE trailer in patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f510a02f93be1971610b8ae910c6a74266da824d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ba51d53019bbc6f862b87389a90695a3dbe0670c)
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                                   | 1 -
 .../0001-Fix-163-unterminated-username-used-with-getpwnam.patch       | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d089609208..3bd245cd57 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -531,7 +531,6 @@ package/libb64/0002-Initialize-C++-objects.patch lib_patch.Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
-package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch lib_patch.Upstream
 package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch lib_patch.Upstream
 package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
index 9ff3f5ec1c..44e15468ac 100644
--- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
@@ -5,8 +5,8 @@ Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
 
 Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
 
-[Retrieved (and backported) from:
-https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+CVE: CVE-2022-40320
+Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/confuse.c | 10 ++++++----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
