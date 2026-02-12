Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB314EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9AEE616B9;
	Fri, 13 Feb 2026 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JefNgwMkT2dj; Fri, 13 Feb 2026 19:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA0261425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011542;
	bh=EBZ77Zx2I3CUwG1cXqNd/Bs/YmjqPjDHnjyM/BNYPeA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gzqK4DeuX+iRmcfrSbNUKZr2bWVHNFSmV636UMuSvsau5t11z28KavhoDRtNFylT3
	 C+pvtIJugEkOYNzn9KmQaFZu4AFTaeth09UnLT6WlXQBPBR/zE58Zh+AXyDhXInK5p
	 M0eHdphQSnmot8fLBbevku/rsgfkgjX+6zIrCMpbwm7fN3djJNzeF/gXsImgwAv5cW
	 DyedZMc7hF8LJR+80QNuPj5jLKp5HAcpLGg5NBnXJWxteabpDSBhSRFRd8/kuz59Rz
	 xLggdCPXCkOgRyP15OLmK+xbRtOHAtob/vFqEJmT/qXdbko2VQli9410UgoWRZ9Rom
	 2yj9wxH7kb1ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA0261425;
	Fri, 13 Feb 2026 19:39:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E23F2EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC3014134F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEdQYpwySE5c for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25D741324
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D25D741324
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7CAE85DA7; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:01:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 40d083cf24d6de952380d306066e147dc073778f
X-Git-Newrev: b5812f25dbe8a992c5783770f12c35830dcdd6eb
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.C7CAE85DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/efl: fix
 check-package error
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5812f25dbe8a992c5783770f12c35830dcdd6eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Commit [1] added the "Upstream:" package patch tag, but forgot to
remove the corresponding .checkpackageignore entry.

This commit fixes that.

Fixes:

    package/efl/0001-ecore_fb-fix-build-with-tslib.patch:0: lib_patch.Upstream was expected to fail, did you fix the file and forget to update .checkpackageignore?

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/bac34296bfed5282df07496c845d74924beb5da6

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d30457efd045f011458766095eb7bd0c329a202b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bf416b616a..a4079853aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -336,7 +336,6 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
 package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
 package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
-package/efl/0001-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
