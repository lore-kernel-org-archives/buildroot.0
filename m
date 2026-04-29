Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07EFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A2961355;
	Mon,  4 May 2026 14:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsNHKrPTHKWE; Mon,  4 May 2026 14:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACF2614F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906006;
	bh=2+B2vZ1N/xWjCzxGVsaJOPJJTAcYK/fMJkYb6pj2ES4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p2KFB0gcuRySKSooCMnAbtOH5AqDiNWW2tVq4nj0lzlgVe2pS6L0gJu0zXkR2KL0x
	 OlAw+pqe3Ji66uBd7/8M1vawc8t3YceuRpLKd1pbga0WdOjBD1yVW9fKzRUh4K+hBM
	 lGPg/7TQfM+XVn+16jBlqefpTiOjbTIqxAyVSN/RfNP1pFl0v7kjQO+4WD17ol2SGv
	 C77l+UzIcq81k8RBLZrnvpT1HjRWO+z1RXsHA5MFxyeyruaw8V0qwWR8csXBb9l/UP
	 bfej34MMMMVFVuFTNO6Jr7FYavdzKhLZP32aHQNK+mxGYe0LkSEByhehdseFR//ZEr
	 YOA/l63k60h+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACF2614F3;
	Mon,  4 May 2026 14:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C03F30A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32AB3410D8
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKatlt_-QAiQ for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDED410AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEDED410AE
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E8AA82AD5; Mon,  4 May 2026 14:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 15:24:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 290f86e05e2d3a9da7561b3972f6c0b382ea99bf
X-Git-Newrev: dabbb7caa4c057505cf0f6f15a61b0aaa46bb7dc
X-Patchwork-Hint: ignore
Message-Id: <20260504144642.9E8AA82AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dabbb7caa4c057505cf0f6f15a61b0aaa46bb7dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases to:
 - 6.12.82 -> 6.12.84
 - 6.6.135 -> 6.6.136

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c08e3e3c03..9f7a42b2e8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.82" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.84" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e1e999e9bc..2eebd0649e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,8 +2,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
-sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
+sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
 sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index be9c603a9c..ce4aa5f03a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,8 +432,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.82"	if BR2_KERNEL_HEADERS_6_12
+	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
