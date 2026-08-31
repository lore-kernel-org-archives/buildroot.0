Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE215C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1463B80AA9;
	Mon, 31 Aug 2026 19:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMZgG5z653ci; Mon, 31 Aug 2026 19:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788203411;
	bh=jR2Jhzms++w3OMPwo9n+LWnXYrAYuqiF+D3Y+IZCw90=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fwn6mBXYReCpVLB2sDPWAiZlniLfDAJagl/bnsGQOeMpSc/eCGX7PZ3vsK3Qk26nD
	 oAXv/dJU+NPu4Z1T2Zm2n5QmwFtAzOXGTqlWPP/WPdUHC6jGCX3aBxQFGDBGPyLUov
	 W4ojOayDi9+VwJy2la76TcyyOvWeVU3WnwT1OE0F7v3+EVufhCCFGm5z3tui4AdoE2
	 Xsclfj7bs1H3Cwbs7raRxs8sbPpYDQ1sRjmOHv6kws8cRf3hcLq21Mj5pE+KHApxVH
	 yjY0RrzyDIf85AfMPtumf7rpjROitHfp1zuSHcmIxR2VEEmIVNALBAnJwmMQYt5tVm
	 mtEqNVQh8vDfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5264980ABB;
	Mon, 31 Aug 2026 19:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E58E72FC
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D743B4051F
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uspAATg0ieF for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EAB74051D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A00339346B; Mon, 31 Aug 2026 19:09:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 21:08:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb18f3a74a49a62119857ce1ab712ff4528a1d3d
X-Git-Newrev: 4c504ef75df4caf58acd20c02c9b2993708b1390
X-Patchwork-Hint: ignore
Message-Id: <20260831190910.A00339346B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.8.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c504ef75df4caf58acd20c02c9b2993708b1390
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_8_4/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-4-released/

Fixes CVE-2026-66046, CVE-2026-76641, CVE-2026-76956 & CVE-2026-76957.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index c5a8816f9b..d8b4eef2f9 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_3
-sha256  f6256df90c906773d344da084402b7d3e4f22ed41b1a59c989098a83d3ea0c85  expat-2.8.3.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
+sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a82be75a4d..1e5b738463 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.3
+EXPAT_VERSION = 2.8.4
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
