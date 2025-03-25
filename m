Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B89C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC88B4258F;
	Mon, 19 May 2025 10:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6It0RpOjEWf; Mon, 19 May 2025 10:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D189242581
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D189242581;
	Mon, 19 May 2025 10:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18212E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47B3440C99
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PbE5G2hVYRm for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C22F40DBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C22F40DBC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 098A683A2E; Mon, 19 May 2025 10:39:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 09:40:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bfb490799e72406cc4831e440f5536da3620850d
X-Git-Newrev: b51b32ae4e131e373507d523d96ff17d9d70b4d8
X-Patchwork-Hint: ignore
Message-Id: <20250519103945.098A683A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2024.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b51b32ae4e131e373507d523d96ff17d9d70b4d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8fdf9ed8d27ad4436cd9ac8a0d0c27dc47a8e285)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/CHANGES b/CHANGES
index e7bfe4134e..8b0e596672 100644
--- a/CHANGES
+++ b/CHANGES
@@ -77,6 +77,19 @@
 	- samba4 build failed in master
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/86
 
+2024.11.3, released March 24st, 2025
+
+	Important / security related fixes.
+
+	Defconfigs: Octavo osd23mp1: Fix TF-A/Linux compilation after
+	move to newer toolchain versions.
+
+	Updated/fixed packages: compiler-rt, exim, expat, fio, foot,
+	go, jbig2dec, libcamera, libjxl, libopenssl, libxml2, mokutil,
+	musl, optee-os, php, pkgconf, postgresql, prboom,
+	python-typing-extensions, rauc, systemd, util-linux,
+	watchdogd, webkitgtk
+
 2024.11.2, released February 21st, 2025
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
