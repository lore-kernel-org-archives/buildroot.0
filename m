Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8B2CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DFF82468;
	Fri, 29 May 2026 14:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1p3af7763CN; Fri, 29 May 2026 14:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36503822D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780066025;
	bh=2xuRLnQm9fE5EGQrNqyNv8G0ePLlGlw8zELDMUb8Ams=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SPVfhNjX90hHq+NaY5nEw83IFvDI20IkMOK2zkuPNKHDa+1eEgELfsHMf2WTQogyq
	 QhWYsxcBxm3N+7gCtPr3tLLLL/zXNVr9wNeFtMImTCAUMtySLaHVfNalPvuEG/pqjy
	 nUT5vn8RyOOULbl2oJfRPlp77Hx9ZhsOfyGkPjEAs9AJvQxjetoyaF97a1/bfzhv+E
	 Z3BdaKNCZdlFOGL5pLl7tuBwBSRzxFgUFwMIBz8l360MXqAlyc6StT6MvEax8g12jB
	 1ftVoISA7Tk/GQ4T6uH2bhDRPbxhvMk1HG3rQ+nskj9s22lghLXFMK7kO0PQdOw8Gl
	 HeoxXMkT/+r2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36503822D7;
	Fri, 29 May 2026 14:47:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 786C3288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55ECE40FDB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aExZuXPZkGiP for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1A940DE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1A940DE5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:47:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC45873E7; Fri, 29 May 2026 14:46:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 16:45:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 815e765c1a5a25ea0510610ec499d08620d1863e
X-Git-Newrev: 6775bfd7494faefbe12266e2e5c35497649e49fb
X-Patchwork-Hint: ignore
Message-Id: <20260529144650.DFC45873E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/wpewebkit: fix
 stale libepoxy dependency comments
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6775bfd7494faefbe12266e2e5c35497649e49fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

wpewebkit depends directly on OpenGL ES and EGL support, but those
dependencies are not imposed by libepoxy itself. Update the inline
comments so they describe the actual dependency source before relaxing
libepoxy's package-level EGL/GL dependency.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a4b761f39541dcb210b356583a767f67095253a3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
