Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816B9F483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C3C82219;
	Mon, 23 Mar 2026 19:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRTplfIb9vJI; Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6D5821F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295256;
	bh=GIHmUa/Mge0GL5p8vBWScI97oLZnMzTkCr2zctM+S1s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fgCxrVbcAUuG37XztrZUM4xMrrfNnZA0AzituPDGKOH72n2thIQ6B9R6Uid1LXbzk
	 MHAHXaxcLpQ2i5eKqzVdHwO1zPj06e8lgEDs8cgpy1XRu5+UO6AP7kZs/ei31/ghHE
	 DXW5Zi5HBBfbJY0vAtd5XHy52Aw2FZAi+sx92azc5A0Iaq1RSCKHGZp5dubGCeTjTc
	 NeqUH7agcCoWiaejBL/PcHrioNTQ8f546Oz1HZbGV/J0W9ql0Oh+nL0lUeAzwXqXJ9
	 WW2/w4cMtKyxS3OL+Ylvle1qicuxQFziGwXi5LMnLdMiYmbq/WWQ9CqenS54jHD0/R
	 1YEDKPWywK6WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6D5821F5;
	Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC880F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE7F140262
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nziYPQf61NMq for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1504007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A1504007D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 475698382D; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 15:13:51 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: a6a9c1930e2514faabddd01cc8ebe449a5ca66e2
X-Git-Newrev: 44ba95ab09154d05b30ae6106b260aca52f5f56c
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.475698382D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 6.19.x,
 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44ba95ab09154d05b30ae6106b260aca52f5f56c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.74 -> 6.12.77
 - 6.6.127 -> 6.6.129
 - 6.1.164 -> 6.1.166
 - 5.15.201 -> 5.15.202
 - 5.10.251 -> 5.10.252
 - 6.19.5 -> 6.19.8
 - 6.18.15 -> 6.18.18

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/before-6.17/linux.hash         | 10 +++++-----
 linux/from-6.17/linux.hash           |  4 ++--
 package/linux-headers/Config.in.host | 14 +++++++-------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 32b74f817d..44f8b08e71 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f2946ac337..1c6a6ab553 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3b56eeb1dc9a437f189ca56b823be3769994f59a4ea0895b08ec0d20acaca13e  linux-6.12.74.tar.xz
-sha256  a7cd9c97b4f0b31cc030bcdc60abe5434fffb2556e293f7438ce7909dff8c9fe  linux-6.6.127.tar.xz
-sha256  33bf087f7bbf7f626873dd7d955eb44182a93695db41f5f89a6bd3d233a39d1c  linux-6.1.164.tar.xz
+sha256  358836ebe5caef41e7ae9492e7fbcdf5be6e53ee43c99752aebda81e1b2cff67  linux-6.12.77.tar.xz
+sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
+sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4f2afffbeddaad6b8527d41a3e3a82646d3cf5dfd0acbb6c4e8a99fc70461b96  linux-5.15.201.tar.xz
-sha256  e6857625fee3b587b0279b445adc3940a5c40723385fa1055ac7af16ff4b4c01  linux-5.10.251.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 20618f4da0..5e4f727a84 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  95ae05c8c709e353c0e8506c072efc5598d85b8b7b564a1ebac7ee8345042ffa  linux-6.19.5.tar.xz
-sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
+sha256  aada4722db8bcfa0b9732851856d405082b6a4fa2e3ab067be8db17cdd115b38  linux-6.19.8.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f8364d0c7b..5b1f090a2a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,13 +464,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.251"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.201"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.164"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.127"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.74"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.15"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.5"	if BR2_KERNEL_HEADERS_6_19
+	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.18"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.8"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
