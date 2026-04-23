Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EC2FDEE47
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C063583D9F;
	Thu, 23 Apr 2026 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmJK7g42QQs8; Thu, 23 Apr 2026 19:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E71083DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776972767;
	bh=k+W6jEHHP4PwhNYR14dRieqYiVGeEx78W1qxPJzJsH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eBZI7CJzqJXB/9eERoBkO6u2S8f26lB7k+f56xo+liYwzEytaYO8C8QGWwWn9hlC6
	 vBqztE5Q03Dk3fDVA29Xxt3Lt3AXYJzoP034/6wB4xDpZm5R/fAjgdBu08B3veS/BH
	 xOWQGwVQdL5LcwYTI8Y4jUKh1nVtC5x+RhjhdukFK3iJLEvu4qCBsmY9K0FUMCePPD
	 YyD/7saCEvWr6Aa6R/Bo+PRDCmm80Efzk7DgIlvpwC2i13zPrAkkT7fe55n2D7zCEp
	 xqQNZZ9RXMmp9YglFTulS64IfDM0hjPodPyDqH8X0VpXkOyQhh4dE3vf1O25ucW7Wg
	 TJTHAAt2ytEvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E71083DA6;
	Thu, 23 Apr 2026 19:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02ABB231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E835A408D1
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRStixtMGkb8 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1075403B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1075403B3
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:32:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55FA182828; Thu, 23 Apr 2026 19:32:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 21:24:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fd8a1cf4993de9299487e73459b942a67b3a161
X-Git-Newrev: 1f2845d8d6d07fae0237359922b4573b470f9d4b
X-Patchwork-Hint: ignore
Message-Id: <20260423193243.55FA182828@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12, 18,
 19}.x / 7.0.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f2845d8d6d07fae0237359922b4573b470f9d4b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0 => 7.0.1}                       | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 6 +++---
 package/linux-headers/{6.12.82 => 6.12.83} | 0
 package/linux-headers/{6.18.23 => 6.18.24} | 0
 package/linux-headers/{6.19.13 => 6.19.14} | 0
 package/linux-headers/{7.0 => 7.0.1}       | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/7.0 b/linux/7.0.1
similarity index 100%
rename from linux/7.0
rename to linux/7.0.1
diff --git a/linux/Config.in b/linux/Config.in
index d674356e06..8633ddbc82 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cd69a9dd05..7e14032158 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
+sha256  39e3172cd1dfa526d353b603e6388db2ab122bbf6a08e05930559a832adcdf31  linux-6.12.83.tar.xz
 sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
 sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 66c28f474e..928ae172cd 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  bb7f6d80b387c757b7d14bb93028fcb90f793c5c0d367736ee815a100b3891f0  linux-7.0.tar.xz
+sha256  b2c935a36d24980e11e59bed3ca558ea6d67619ec0065faa335cdc0b64d887bf  linux-7.0.1.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0559b1fea740e71714b4368023902b7d098c45ac1faa3176eab392c867645648  linux-6.19.13.tar.xz
-sha256  2a2d8e76bfcd135ab861bb9795211574eeff6d4ede9cc920f7c137587e835134  linux-6.18.23.tar.xz
+sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
+sha256  c207c557ce58103b4dda30e26da5203f3d8467c6dadc53d709f6d83ae1d1255f  linux-6.18.24.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.82 b/package/linux-headers/6.12.83
similarity index 100%
rename from package/linux-headers/6.12.82
rename to package/linux-headers/6.12.83
diff --git a/package/linux-headers/6.18.23 b/package/linux-headers/6.18.24
similarity index 100%
rename from package/linux-headers/6.18.23
rename to package/linux-headers/6.18.24
diff --git a/package/linux-headers/6.19.13 b/package/linux-headers/6.19.14
similarity index 100%
rename from package/linux-headers/6.19.13
rename to package/linux-headers/6.19.14
diff --git a/package/linux-headers/7.0 b/package/linux-headers/7.0.1
similarity index 100%
rename from package/linux-headers/7.0
rename to package/linux-headers/7.0.1
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c774796377..7e38fc161e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,10 +476,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.82"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.23"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.13"	if BR2_KERNEL_HEADERS_6_19
-	default "7.0"		if BR2_KERNEL_HEADERS_7_0
+	default "6.12.83"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.24"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
+	default "7.0.1"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
