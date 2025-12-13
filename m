Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C86D5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 12:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A2D40B89;
	Sat, 13 Dec 2025 12:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GkR9Wr_emNh; Sat, 13 Dec 2025 12:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C76240ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765628004;
	bh=xkHw0MP7S8i+6y3T2126Z3oRKVIWY/j3hyIw7t4b414=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VkXS1E2gVtIDV96o2ha0DVjiMdCQoK97c3LzYVQk1wIIhqgtavW4bSQ0DeOAV6kpM
	 LuhcKReuCO3hzA9GkP0ycSFJNzIvsQ2eJwDTvd68wcllBz+u4zs3oFg4okiHlqFXbd
	 PfD0jsuGTy4sl4tbvgrBoY2wOShHhtA0aNRjWEo3k/ldFY0tMz/8eei/AbbPMJGHFj
	 rSaweWUL8yizbR3hRyUce7BMYKZpUdv9GX5lHQo/6onBSi6y+XH+u4ejMKjUeMJEbZ
	 +b4HOGEsOMgR0JeY0mMdfmnH6+14qZqGp9uNAY9qlqMgRtEfCuKfKa/9Oy6zbllGf7
	 la/MpqIf0ESvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C76240ADC;
	Sat, 13 Dec 2025 12:13:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0817F13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB7740186
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8GR2bk7CW97 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 12:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A8AB4009B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A8AB4009B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:13:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A0AD86A25; Sat, 13 Dec 2025 12:13:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 13:04:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe5dcf402c0075b6ab86a92733ec75135f9dd760
X-Git-Newrev: dc7eb6bf08d2293fc47f5f43d16d377758e9788a
X-Patchwork-Hint: ignore
Message-Id: <20251213121319.0A0AD86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12, 17,
 18}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc7eb6bf08d2293fc47f5f43d16d377758e9788a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 10024bef38..7b1c9b61a2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d82ccf83c3..29950987b1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
-sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
-sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
+sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
+sha256  42780496f99194e9d66b21f13dc2bded952624d5c7bd83eade7f74ff658e98d6  linux-6.17.12.tar.xz
+sha256  13e2c685ac8fab5dd992dd105732554dae514aef350c2a8c7418e7b74eb62c13  linux-6.12.62.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 412232a571..0f544e07f8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,9 +464,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
-	default "6.18"		if BR2_KERNEL_HEADERS_6_18
+	default "6.12.62"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.12"	if BR2_KERNEL_HEADERS_6_17
+	default "6.18.1"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
