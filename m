Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3781DF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9343560829;
	Mon, 23 Mar 2026 19:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kkoRA1Qf-gf; Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8E960838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295240;
	bh=mYgzPqSgF+uRXfW/1BNmlHcaC86S4n49wMzkqyP+1f8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kv3ApDH4hJ9dAUB1X0CrR41GBvtYwpj2rZ86OlWL7eR1T7Pm1BKhrZZ8ryLbc9vxE
	 35WfyDxeTJDBTbhqcgxeJqzAkFO56X+uEondDIIVEvkgB8fBlcFPaOjt4HEmYYzUgI
	 sPkWSqA51EtJGG0qZbmU+J0Gx1n3RehD9Ic+3d1hElFIlQ0OiI50YDh8j6h0XQ6QhV
	 g8Deyo/n7VVzZlvGObpWUIb2ksC4HDQjV8e6u3aRjRztk/Wl7ixrMM7E0DZcTtD/7e
	 DE9J8rb6SlgZrQyrsGjQQbJL3qPxvMn2W6VEwdaS6xvZH4Y+OuR6JEs7I5DkRmi49o
	 jLuOOIJiRFxqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8E960838;
	Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9E9F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EDF781CEF
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxm7xSTudbiJ for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 897A281A81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897A281A81
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6D5784BCB; Mon, 23 Mar 2026 19:47:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:46 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 137a566bf5353831d97c068a4c22e6df5b4d07a0
X-Git-Newrev: 041e9d289ebaf14d7a7a4f60da9c97e3d78c4cca
X-Patchwork-Hint: ignore
Message-Id: <20260323194713.B6D5784BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/041e9d289ebaf14d7a7a4f60da9c97e3d78c4cca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases to:
 - 6.12.73 -> 6.12.77
 - 6.6.126 -> 6.6.129
 - 6.1.163 -> 6.1.166
 - 5.15.200 -> 5.15.202
 - 5.10.250 -> 5.10.252

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 976892aba4..a2b09c4e5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.73" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.77" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 56a7b436e0..fb495841cc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,12 +2,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4059d394cbf8e9548df36d37e0b8a80c4409ac4e14ecc5019a72a770ef7b41ba  linux-6.12.73.tar.xz
-sha256  16742f4e78abfec8cc9205fb3cf79d63c7e819c33bfc691402683402c350ee2f  linux-6.6.126.tar.xz
-sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
+sha256  358836ebe5caef41e7ae9492e7fbcdf5be6e53ee43c99752aebda81e1b2cff67  linux-6.12.77.tar.xz
+sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
+sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
-sha256  47754da223a9f264b917be5d575a4dae03fc8777aa9e1b00473e973ee997d529  linux-5.10.250.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 12e68b5edd..058a15b066 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.126"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.73"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
