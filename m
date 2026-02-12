Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B2FEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C1541FB4;
	Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2hMJspcssOL; Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382DD41FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011476;
	bh=OIwjihi6DFpIJgfZetjnYjbFvlTyTpSXgVppwqjZUbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=so8QdQtRzDqeGbjq8+l2kGpzKhbInrjGOzER5mSER+3LHqbUQRAekEHErm31gJGuP
	 rP7aWS6cxOlfFQ3qlm/KESuxaQZ6gNR5iF/7inciBtFJIgG9buSVlp2VRC18csrjNS
	 V/wcbRJX7tUhN6KITt1a5yfCGul9iMFjpisK4IIgDIs4vQRsj8A9+3uNG0ReM79HdI
	 QVVA17RI+oi/85HjSxSeeW89HP5C9Feiv8V9FRtj6AudpnISAvU5Z16OpCUFPID9t8
	 A0wKCPVHnt04yeC3xctwfZQq9OtnRADYBIMSl979KDo99kzU1AO2rh3Aim4J+KY+pZ
	 L3jWZ80S02YXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382DD41FBB;
	Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D12BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 423D04134B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPOf5ONstjAN for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79543412DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79543412DC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E0AF81665; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:36:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 292c8cf89023748ab7f8b6c816f2ba3c38bf37c3
X-Git-Newrev: f407daec2ec74565050b7ec560c7e64ce128cc73
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.6E0AF81665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dc3dd: needs MMU
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f407daec2ec74565050b7ec560c7e64ce128cc73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

savewd.c:75:27: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
   75 |           wd->val.child = fork ();

Fixes:
https://autobuild.buildroot.net/results/40a/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4/

The build error occurred already in January 2025:
https://autobuild.buildroot.net/results/9f3/9f3fefe5578dc41272e460146b566ac20f6cde75/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4df3fa1ab50fb280f011550edc5b178e7a4a0482)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index bd181b7065..b4b7dfd691 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_RISCV_32
 	depends on !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -13,6 +14,7 @@ config BR2_PACKAGE_DC3DD
 	  https://sourceforge.net/projects/dc3dd/
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_RISCV_32
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
