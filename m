Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1538E87838
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932D083B5B;
	Tue,  3 Feb 2026 14:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRTpdFrCQTZm; Tue,  3 Feb 2026 14:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C8883B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128332;
	bh=1xBJVmQ9Rc7VaQhsOBKPAyi3y/ubGdAj5iZhiD8Lsu8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pX153YCa7CoDowDV8Ah/jU2szbAGLaYn+VU3lp9akUD9G05wfZc+S6R7fdBB7r+76
	 QS7PEPYtvtUsr0U8+vRXZA24JmvoP6fWln0mUmf8AIdsYGspycmT3Ei+ncKfE+ITho
	 E1rBTG/eTa0mMCyW7LUm6JqseVQJnW7o8cWkxhjDjREa/ye9P607H0oGH1Y1v0zFqO
	 EB6EMNfgV0Tw40Mgv8/chHqDHXmXYfNwClTv/KbnVAHMzusPVHNZLnUq1BGMVuM0hB
	 A6PrCNBV2MpypnfDZNfhb5iQyx/qAebaEz7ttiaCQ42wWvXX9MzJf/2B0CXf3nshaI
	 jrczsp2JYA1+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C8883B5D;
	Tue,  3 Feb 2026 14:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA5BF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 001B060830
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sF7b4xBoMOlE for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1280660828
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1280660828
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:18:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFC76866B6; Tue,  3 Feb 2026 14:18:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 15:18:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 425abcd025374e6004d328b190ceb443fde568a8
X-Git-Newrev: d30457efd045f011458766095eb7bd0c329a202b
X-Patchwork-Hint: ignore
Message-Id: <20260203141849.EFC76866B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: fix check-package error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d30457efd045f011458766095eb7bd0c329a202b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] added the "Upstream:" package patch tag, but forgot to
remove the corresponding .checkpackageignore entry.

This commit fixes that.

Fixes:

    package/efl/0001-ecore_fb-fix-build-with-tslib.patch:0: lib_patch.Upstream was expected to fail, did you fix the file and forget to update .checkpackageignore?

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/bac34296bfed5282df07496c845d74924beb5da6

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0bf57b8ac2..16a0d5b511 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -326,7 +326,6 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
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
