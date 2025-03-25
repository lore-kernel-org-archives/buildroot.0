Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB8C3600B
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 08:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9CC860D56;
	Tue, 25 Mar 2025 08:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiPrL6ZvDOEL; Tue, 25 Mar 2025 08:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F9B60E9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F9B60E9A;
	Tue, 25 Mar 2025 08:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 650B71C9
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 452DD41042
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17xa60lue_3M for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53632410BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53632410BB
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D94A82B5B; Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 09:40:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfb490799e72406cc4831e440f5536da3620850d
X-Git-Newrev: b51b32ae4e131e373507d523d96ff17d9d70b4d8
X-Patchwork-Hint: ignore
Message-Id: <20250325084711.3D94A82B5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.11.3
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
