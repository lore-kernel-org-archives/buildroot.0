Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEC2CD5BC6
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C714B8108D;
	Sat, 23 May 2026 19:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9eWOPN5MaWH; Sat, 23 May 2026 19:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A81F881069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779566347;
	bh=KS5XkAdxYouzfzFHxNexEHlRR26rQ24OvUo5gnwQQ+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H9GAiEhziCMOfSSfPLi09q6pooHBieo1PtiU1SDGj8AuPxz2N1FKUI0Ayfgg2VtDB
	 glBh0JDxr1sO0U9MRFf2GvisVTWmadR+P5brTQMP/sZNDfTk+QQzz5dglHtqVe4OPR
	 Ikf8WYOC9DZSxsb84gfw7afmdUCcOZT3clkaujafYm3q29G1459HLEGUO6HWnq8qrV
	 Ii4roLPRCrZygbnuw9QxNo9g23FW6wIFn5YS9OFTtz2iOEjvrSMa3S+iLeNxsw7WaI
	 8W78jnR75oQ3aAFCzGn4vnbds5xDPXIkkfZWr+vgORT1wHhQLB0n/GamNLxXM0kgqW
	 36EDHKZoHXT/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A81F881069;
	Sat, 23 May 2026 19:59:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 057B3265
 for <buildroot@buildroot.org>; Sat, 23 May 2026 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02DEC81066
 for <buildroot@buildroot.org>; Sat, 23 May 2026 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_uzjEMCT6Eq for <buildroot@buildroot.org>;
 Sat, 23 May 2026 19:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC81881065
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC81881065
 for <buildroot@buildroot.org>; Sat, 23 May 2026 19:59:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0AB086CC3; Sat, 23 May 2026 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 21:50:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 852e39ba2cf107b898c5ae413dacc84ccc6079bd
X-Git-Newrev: 2888204be6be098b5cac562e7f09f4d38da65c14
X-Patchwork-Hint: ignore
Message-Id: <20260523195854.E0AB086CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2888204be6be098b5cac562e7f09f4d38da65c14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.9 => 7.0.10}                      |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.256 => 5.10.257} |  0
 package/linux-headers/{5.15.207 => 5.15.208} |  0
 package/linux-headers/{6.1.173 => 6.1.174}   |  0
 package/linux-headers/{6.12.90 => 6.12.91}   |  0
 package/linux-headers/{6.18.32 => 6.18.33}   |  0
 package/linux-headers/{6.6.140 => 6.6.141}   |  0
 package/linux-headers/{7.0.9 => 7.0.10}      |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.0.9 b/linux/7.0.10
similarity index 100%
rename from linux/7.0.9
rename to linux/7.0.10
diff --git a/linux/Config.in b/linux/Config.in
index a0eca841af..96c2d5b1f4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 380987601b..cd460fc958 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
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
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2d9eadabdb..a5caa90370 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  ac07acdf76cf4621cc5187a2670270a1a699533c8a6b225e4878c416ad83f1c4  linux-7.0.9.tar.xz
+sha256  094977eb62c20e3d1939fe81a92958a1f987f339446e532fa86963b2804e32dc  linux-7.0.10.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
+sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.256 b/package/linux-headers/5.10.257
similarity index 100%
rename from package/linux-headers/5.10.256
rename to package/linux-headers/5.10.257
diff --git a/package/linux-headers/5.15.207 b/package/linux-headers/5.15.208
similarity index 100%
rename from package/linux-headers/5.15.207
rename to package/linux-headers/5.15.208
diff --git a/package/linux-headers/6.1.173 b/package/linux-headers/6.1.174
similarity index 100%
rename from package/linux-headers/6.1.173
rename to package/linux-headers/6.1.174
diff --git a/package/linux-headers/6.12.90 b/package/linux-headers/6.12.91
similarity index 100%
rename from package/linux-headers/6.12.90
rename to package/linux-headers/6.12.91
diff --git a/package/linux-headers/6.18.32 b/package/linux-headers/6.18.33
similarity index 100%
rename from package/linux-headers/6.18.32
rename to package/linux-headers/6.18.33
diff --git a/package/linux-headers/6.6.140 b/package/linux-headers/6.6.141
similarity index 100%
rename from package/linux-headers/6.6.140
rename to package/linux-headers/6.6.141
diff --git a/package/linux-headers/7.0.9 b/package/linux-headers/7.0.10
similarity index 100%
rename from package/linux-headers/7.0.9
rename to package/linux-headers/7.0.10
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f935c21f9e..3d9d578f8e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.256"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.207"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.173"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.140"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.90"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.32"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.9"		if BR2_KERNEL_HEADERS_7_0
+	default "5.10.257"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.208"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.174"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.141"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.91"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.33"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.10"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
