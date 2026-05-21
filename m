Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4AECD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 18:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A85411BA;
	Thu, 21 May 2026 18:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDABl8YUdfOj; Thu, 21 May 2026 18:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C8340FB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779389350;
	bh=a1I6fHOOGkjZNEb1TYp4ujv6ZVLMc2Ctzok5+stSeVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jAiUd943sP8aoz/HGgJdR628gTuLl7WOLFtpQmygyXQ+q2y7Fq6gG/TDvyUiMS4mU
	 8O0Xe3g1vcmCXd5BUT4WAcyoy5JBGDP9z33+6+krPq9jJ0dMKdNFycfg+eBLRkR7cj
	 1fh8XVEbGzei7wHn7aPzPZWg95CvjM1hIuYGIgpY7/6f6Mio0hq/CbdYKeKUaJHNPl
	 ifMG7QqBZjAgS06m52GBZ6K5mmTHVupw+MZ89Wp7vsde01ZC2/o4Ygz3pYCxdvX6wM
	 0N14sgEe4Bl1kjhmuTgqhuDtFYTzcQ3smnwY63URrzNN6ftSGiFdemOXBOW+lmvpOJ
	 w9IoAst8xVeAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C8340FB7;
	Thu, 21 May 2026 18:49:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB1B265
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 625F161B7E
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-rbNuwa1snU for <buildroot@buildroot.org>;
 Thu, 21 May 2026 18:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806C361B42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 806C361B42
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:49:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABE6186A77; Thu, 21 May 2026 18:48:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 May 2026 20:48:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 701f8bb31cac8e6be5a4ccf5bc1d643a65c19327
X-Git-Newrev: a4b761f39541dcb210b356583a767f67095253a3
X-Patchwork-Hint: ignore
Message-Id: <20260521184859.ABE6186A77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: fix stale libepoxy
 dependency comments
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4b761f39541dcb210b356583a767f67095253a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wpewebkit depends directly on OpenGL ES and EGL support, but those
dependencies are not imposed by libepoxy itself. Update the inline
comments so they describe the actual dependency source before relaxing
libepoxy's package-level EGL/GL dependency.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/wpewebkit/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c8602f1de6..c4ee5a27f7 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
