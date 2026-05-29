Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D137CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE82384287;
	Fri, 29 May 2026 13:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQae5sbLDhsN; Fri, 29 May 2026 13:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A7E84281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780062242;
	bh=4ZmzVY4XCycaffONH/PL0m94kg+qUp74tO2UAhkm62U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TCOTrZIgOCKlE0dFn+E3eODc0tLgP8ISOGGBsGfLXHlkcsl6S5Q8EB9kC5aeulESx
	 bxJwiwqZJc8A0YDHK6/ThF1Vse7RiqeUY0Ngt9eeRvZBap0D3L1bfXEDl5Dpj5gwA3
	 tjwgs53lgY52MHjhzHKTk3RtlpIlcfeYy3NNy0ozZ0SPFDGOb2Rh0ZvIyuHufAfeLt
	 O7LRzvATXFxzcW+Jpov1x+Po2/rNR2J4wLgksPWNwhfs+vPCStU3061QK4ayjCL5zZ
	 FGVyXMwNlpPI5q8usSXwk5S1n1S4tDFVfSpZgC5yz9hHrtTgCKyLVk4kKScBtH87Sv
	 jy+3mcCONf4nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A7E84281;
	Fri, 29 May 2026 13:44:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F192F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04B0D84286
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5e-aOQMNeDl for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E3C884281
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E3C884281
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C96DD873DB; Fri, 29 May 2026 13:43:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:37:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8ecbcc713ee106295991d2dfaed5f6188c944667
X-Git-Newrev: 8714f00265fd9fec7fa48f75424cb188bd1e0bdf
X-Patchwork-Hint: ignore
Message-Id: <20260529134346.C96DD873DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igt-gpu-tools: only
 needs libudev, not udev daemon
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8714f00265fd9fec7fa48f75424cb188bd1e0bdf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Arnout: order _DEPENDENCIES alphabetically]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/igt-gpu-tools/Config.in        | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 00dc59a2ae..72d3f0b0db 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on BR2_USE_WCHAR # elfutils, procps-ng
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
@@ -40,10 +40,10 @@ config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
 
 endif
 
-comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
+comment "igt-gpu-tools needs libudev and a toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
 	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+	depends on !BR2_PACKAGE_HAS_LIBUDEV || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
 		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 6e6d4278f1..5dcbdcaab5 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -18,10 +18,10 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	libdrm \
 	libglib2 \
 	libpciaccess \
+	libudev \
 	pciutils \
 	pixman \
 	procps-ng \
-	udev \
 	zlib
 
 IGT_GPU_TOOLS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
