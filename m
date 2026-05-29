Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0441ACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE3483C87;
	Fri, 29 May 2026 08:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKK31q0ibjMq; Fri, 29 May 2026 08:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D6C83C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043185;
	bh=QS2tDUGGBGcZHhipjRasRaNIk222BjaPeaqGleZ68EM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LVFlzx94e9kcwdtoiRsPCCC3cnoD6VYB9f2ENtWBQRNj6/ATdbbqwc/besJ6MfnKG
	 Wju6j71xAYAs06aWDbS2CLtDG/UzlAnf62oNAGE0YqrKfRCDnI8hgxn4XSOQayHOHH
	 a+mD3ZY4B2gtCuE9U/EayleUR1na5XjTJpM5ifkW3Pgef4HQvb1rhVK5lSSodqcFKK
	 93LN82L3NCwzR78cX8wfRwX7opqqcLvqZm7l7cwWT2TPTFU7W/YHJB1u8KRpUlBu7x
	 a8eNdDl00kQQDhPu0eXle9VYlLNchGDWH9LOm0mKl2EnTmQLIKNrgv9JTgvxCes0OP
	 hi0B2c0jUYTcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D6C83C75;
	Fri, 29 May 2026 08:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF3E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC5A741F89
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bpYKd24qITB for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5298A41F98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5298A41F98
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E604B87171; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 08:34:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0d24f9515f080ac6f5a5697d0d7a52598e8d5cc1
X-Git-Newrev: d2eda853cac4e3044aebb8aadad6ffbc03f1adfe
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.E604B87171@busybox.osuosl.org>
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2eda853cac4e3044aebb8aadad6ffbc03f1adfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases to:
 - 6.12.90 -> 6.12.91
 - 6.6.140 -> 6.6.141
 - 6.1.173 -> 6.1.174
 - 5.15.207 -> 5.15.208
 - 5.10.256 -> 5.10.257

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 836012a880..dd209666f4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.90" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.91" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0040c266ed..e14d164f5d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,12 +2,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1f1a1ff057468b8a6284d3ce1d181278259beb5670ea16724c46dbf8820fa2a8  linux-6.12.90.tar.xz
-sha256  d67c9674a2d4307f3747183935a5d434391df0fc5f5bf0e00691e059f664b7db  linux-6.6.140.tar.xz
-sha256  c4f32c6cfbe8c31478f18a4b2a50f89e73f8641ba1d683d80efc16c898876d98  linux-6.1.173.tar.xz
+sha256  0ff2ab9e169f9f1948557471fbb450d3018f8c5b77caf288e1a3982582597969  linux-6.12.91.tar.xz
+sha256  3bc2652eb62ab90a90a8b0aa156b91d276f92eb84702971df62fe1a3f1eb7fe1  linux-6.6.141.tar.xz
+sha256  ed88346df623ae9150d11b5feb16ddb52c25aef563bb7803ab160bb4493fe06e  linux-6.1.174.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  50eb7fa307745f30e5cae4c17e188fc42ce6a72f7d925d5ea7e3c2135de6148e  linux-5.15.207.tar.xz
-sha256  f1e9dac8ec41e5bd7b1811158c7b72269696ce1c37fbdd17a898b293b54d8e5f  linux-5.10.256.tar.xz
+sha256  b53d7036e327a627595f42349cb5c9d55b4db8262ab473e08274bd8d3028b172  linux-5.15.208.tar.xz
+sha256  08b1fde1b563d7f5b0f429b283105b8a0e255463590e50fdce0abbc07a66f0d1  linux-5.10.257.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 250e618a35..87bcdd9001 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.256"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.207"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.173"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.140"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.90"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.257"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.208"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.174"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.141"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.91"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
