Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D98FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 603BA61514;
	Mon,  4 May 2026 14:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULZrSplZifhR; Mon,  4 May 2026 14:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A9D66155F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906113;
	bh=cJYeiztHzGv03CyfFkbNzW/TjZov/lJR0stn45IU3To=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nPTSfdJfHfxWJu1fG+JypVaxnvkai1/heqNE9ffFGnj0CmNjXP2sC7OyY6l5jxc7y
	 3p/qlaAwBBgE+wopRXH5s8Y7VjSTGpv98VKgoXTVc+VsPFSSqhIQFZUdE8p484dvlM
	 RoowSkNLea36p8DcVYYYxmraj+nK2JKFTygI6/tC20VhREEKtEbcgr78uE16Y0BPaO
	 B1aiFrCoanPe4HCXh+2I7p69kI5xpN43Ehw3nm0XiQhsoWYfWGOH/fLseOhIwFV3Gu
	 nz9rJQIWqn6QpIhIeTWeSVVcEmGv7xMF/w6J3V/w8bKUWS8KtZi+Q6kjoKp1Gix/ku
	 lr1Wxt6qH64Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A9D66155F;
	Mon,  4 May 2026 14:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2477D190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0935184619
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5URyw2z_wrj for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1838469B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE1838469B
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC3D18435A; Mon,  4 May 2026 14:48:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 15:24:44 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 0be927b89a319c9ac35249354558e9f4cb102fd0
X-Git-Newrev: 152acddfa73d0befd2dc822b9ce98f4d1a4bdc77
X-Patchwork-Hint: ignore
Message-Id: <20260504144829.AC3D18435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.19.x, 6.18.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/152acddfa73d0befd2dc822b9ce98f4d1a4bdc77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.82 -> 6.12.84
 - 6.6.135 -> 6.6.136
 - 6.19.13 -> 6.19.14
 - 6.18.23 -> 6.18.25

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/before-6.17/linux.hash         | 4 ++--
 linux/from-6.17/linux.hash           | 4 ++--
 package/linux-headers/Config.in.host | 8 ++++----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 018b59154d..33dbfe2148 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cd69a9dd05..d9f1290f9c 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
-sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
+sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
 sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 1b379cfa3f..a8c9a7ce78 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0559b1fea740e71714b4368023902b7d098c45ac1faa3176eab392c867645648  linux-6.19.13.tar.xz
-sha256  2a2d8e76bfcd135ab861bb9795211574eeff6d4ede9cc920f7c137587e835134  linux-6.18.23.tar.xz
+sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
+sha256  29680a07d4430b269af6ce68079b0e81dbd60f03e6f351e0661991fe39bd1898  linux-6.18.25.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 00b5bc86fc..3b517283a7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -467,10 +467,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.82"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.23"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.13"	if BR2_KERNEL_HEADERS_6_19
+	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.25"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
