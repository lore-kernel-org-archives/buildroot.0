Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40579CD4F26
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 11:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB73403E8;
	Sat, 20 Jun 2026 11:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WvkqQl1SW5m; Sat, 20 Jun 2026 11:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D4064EE29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781954461;
	bh=kkDV/0dWVFfU5PcAOXxhFT1F3IAgXRUSPlvc4vva6tY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZFrJZ3WrVGky+Gx4Nv4trTd+1GIonPN57uexVCH/lJ8JczasICE0GCDUlt6VPWSm8
	 kN9xYusfVsQN4oDG5Hm6TcA7MuIulHYMfawhQCq+OFrwTM3PY6cV53FXoY90NSp5tT
	 sPo/wodTSmc76JybBXeT1lD993TMigtu9CgEb6J1IGI7n2+5NR8jN5YoTIsCK/vnYu
	 2tOYIjEeC+gT2DNzWz5Kr1j/7antq2W/kB8KoLpMb6kXlfeb6jbXlGAaB4E4fKB5Bj
	 riHU5BuhNPAazH7FT3n2v5a8npbVmBBtGUQ5j0U/t+VgbcFdyUFXRmMZcls94r3uRi
	 wzDGQnZRTDkTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4064EE29;
	Sat, 20 Jun 2026 11:21:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F09367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 11:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574194EE2B
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 11:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zujJcmzrddr for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 11:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C514EDE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53C514EDE0
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 11:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4077482136; Sat, 20 Jun 2026 11:20:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 12:34:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33345d5bef081fdf912a422cdcd4279b82d34f04
X-Git-Newrev: 9f3c9b43b064db45fb93a1cc5b1502cd5268e4bb
X-Patchwork-Hint: ignore
Message-Id: <20260620112036.4077482136@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 7.0.x, 6.18.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f3c9b43b064db45fb93a1cc5b1502cd5268e4bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.1 -> 7.1.1
 - 7.0.12 -> 7.0.13
 - 6.18.35 -> 6.18.36
 - 6.12.93 -> 6.12.94
 - 6.6.142 -> 6.6.143
 - 6.1.175 -> 6.1.176
 - 5.15.209 -> 5.15.210
 - 5.10.258 -> 5.10.259

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{7.1 => 7.1.1}                         |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  6 +++---
 package/linux-headers/{5.10.258 => 5.10.259} |  0
 package/linux-headers/{5.15.209 => 5.15.210} |  0
 package/linux-headers/{6.1.175 => 6.1.176}   |  0
 package/linux-headers/{6.12.93 => 6.12.94}   |  0
 package/linux-headers/{6.18.35 => 6.18.36}   |  0
 package/linux-headers/{6.6.142 => 6.6.143}   |  0
 package/linux-headers/{7.0.12 => 7.0.13}     |  0
 package/linux-headers/{7.1 => 7.1.1}         |  0
 package/linux-headers/Config.in.host         | 16 ++++++++--------
 13 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/7.1 b/linux/7.1.1
similarity index 100%
rename from linux/7.1
rename to linux/7.1.1
diff --git a/linux/Config.in b/linux/Config.in
index 664c97c01d..0aa35bd028 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 4ebc486eac..688b99ded6 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  492648a87c0b69c5ac7f43be64792b9000e3439550d4e82e4a14710c49094fa3  linux-6.12.93.tar.xz
-sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
-sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
+sha256  e998a232b9418db3301cb58468e291a4f41d6ab8306029b30d991f56251dc8d2  linux-6.12.94.tar.xz
+sha256  dace1f8dc9c0dbf5df14f47e3229cd62c298e83049681731ef229f2ba7592932  linux-6.6.143.tar.xz
+sha256  aa19772dba40e9737356c00d0671cdedbe26cc895eff062868f0a1f688ae44f6  linux-6.1.176.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  346d77c7eac2cd8d719a2530b4f858bf99bc956b25f80995fd214f8aef821eb4  linux-5.15.209.tar.xz
-sha256  9e7ccb1efc5796e6f8398b778a8b25f7e227e7c54ef5caf6377b8c37d66fb4e5  linux-5.10.258.tar.xz
+sha256  910ba46ae15e7495a9624f89d7f11b24ccc8bc1ee4b3abdd502e75b055290a01  linux-5.15.210.tar.xz
+sha256  aa5e8e580a555e55176658b78fb6759f9c84654462b735119d4e819b5c46b609  linux-5.10.259.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 9aa69b6e96..33ee9dc232 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  691f44797fbe790dc8a321604c927087526ad27b6d649925d60f8eed0a2564a0  linux-7.1.tar.xz
-sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
+sha256  5215fa3541dc7e7f5bcd51bf7e57f169cec6fce508ca54e3dc85fdee14371d7d  linux-7.1.1.tar.xz
+sha256  3c81edd0f716aca3dd48dff691681827580cc53d35a8eec3be47d346d1f89913  linux-7.0.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f78602932219125e211c5f5bfd84edcfd4ec5ce88fc944f8248413f665bef236  linux-6.18.35.tar.xz
+sha256  fbab86c9f471c81075b280cca30bd85d790c060063a1245859b6344b07c9c44e  linux-6.18.36.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.258 b/package/linux-headers/5.10.259
similarity index 100%
rename from package/linux-headers/5.10.258
rename to package/linux-headers/5.10.259
diff --git a/package/linux-headers/5.15.209 b/package/linux-headers/5.15.210
similarity index 100%
rename from package/linux-headers/5.15.209
rename to package/linux-headers/5.15.210
diff --git a/package/linux-headers/6.1.175 b/package/linux-headers/6.1.176
similarity index 100%
rename from package/linux-headers/6.1.175
rename to package/linux-headers/6.1.176
diff --git a/package/linux-headers/6.12.93 b/package/linux-headers/6.12.94
similarity index 100%
rename from package/linux-headers/6.12.93
rename to package/linux-headers/6.12.94
diff --git a/package/linux-headers/6.18.35 b/package/linux-headers/6.18.36
similarity index 100%
rename from package/linux-headers/6.18.35
rename to package/linux-headers/6.18.36
diff --git a/package/linux-headers/6.6.142 b/package/linux-headers/6.6.143
similarity index 100%
rename from package/linux-headers/6.6.142
rename to package/linux-headers/6.6.143
diff --git a/package/linux-headers/7.0.12 b/package/linux-headers/7.0.13
similarity index 100%
rename from package/linux-headers/7.0.12
rename to package/linux-headers/7.0.13
diff --git a/package/linux-headers/7.1 b/package/linux-headers/7.1.1
similarity index 100%
rename from package/linux-headers/7.1
rename to package/linux-headers/7.1.1
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0b02c183c1..a890c8f161 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,14 +476,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.258"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
-	default "7.1"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.259"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.210"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.176"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.36"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.13"	if BR2_KERNEL_HEADERS_7_0
+	default "7.1.1"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
