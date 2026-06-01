Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5528FCD6E61
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6CD6066F;
	Mon,  1 Jun 2026 19:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QkeQbYHfKuN; Mon,  1 Jun 2026 19:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E4860688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780340479;
	bh=9e79EbafysrppxcpbFcnV5XDSjPWYU2px2Lsg/M0G6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OsPWEZb3rMlSA8dbhR/OX/5Pddidbn2gs3OYrHIBoqIsQk5SZwJbsJ9oEuhQsI/4Q
	 teY4C89l0waWLJ6ZG68J1G8Ur/CkcvOP+dPNx3PYU+3FHdbXX+AGlQAZ7XJqyXsc+3
	 46vxzuu2zkGXhsbRaSokfPoWv4n7nPrZw+cKwsB7BfUAuoie2cCjIL8ppJxrxtX8ZU
	 pkTfSOLcko6Sbtp9tetczRIrS5rAHRFKb/F1t5rIkKlShpaQIXQLFtD96D4xJcHil6
	 u3elvVO7gg9h1Mv4iKXsoL056OHp30/c2lIqXABdLlwghQoX3zeZI5yIyVV2Zrua/d
	 88mvYifMbUwBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E4860688;
	Mon,  1 Jun 2026 19:01:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34940D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DF7E407AE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P78tkiPQGGxJ for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380D3407AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380D3407AC
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20EA98780C; Mon,  1 Jun 2026 19:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 20:46:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd633fe5b4785435d7822251d02289082a0d1b5e
X-Git-Newrev: ccf15ef72b01398fa6e7063c470492742ca9f8bc
X-Patchwork-Hint: ignore
Message-Id: <20260601190101.20EA98780C@busybox.osuosl.org>
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccf15ef72b01398fa6e7063c470492742ca9f8bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 linux/{7.0.10 => 7.0.11}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.257 => 5.10.258} |  0
 package/linux-headers/{5.15.208 => 5.15.209} |  0
 package/linux-headers/{6.1.174 => 6.1.175}   |  0
 package/linux-headers/{6.12.91 => 6.12.92}   |  0
 package/linux-headers/{6.18.33 => 6.18.34}   |  0
 package/linux-headers/{6.6.141 => 6.6.142}   |  0
 package/linux-headers/{7.0.10 => 7.0.11}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.0.10 b/linux/7.0.11
similarity index 100%
rename from linux/7.0.10
rename to linux/7.0.11
diff --git a/linux/Config.in b/linux/Config.in
index 96c2d5b1f4..8b17fece44 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cd460fc958..93c36c9156 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0ff2ab9e169f9f1948557471fbb450d3018f8c5b77caf288e1a3982582597969  linux-6.12.91.tar.xz
-sha256  3bc2652eb62ab90a90a8b0aa156b91d276f92eb84702971df62fe1a3f1eb7fe1  linux-6.6.141.tar.xz
-sha256  ed88346df623ae9150d11b5feb16ddb52c25aef563bb7803ab160bb4493fe06e  linux-6.1.174.tar.xz
+sha256  0fe376b7db3cac4456b38291bee4faa7091cb8befaa6f9870314f5d1282f9e3e  linux-6.12.92.tar.xz
+sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
+sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b53d7036e327a627595f42349cb5c9d55b4db8262ab473e08274bd8d3028b172  linux-5.15.208.tar.xz
-sha256  08b1fde1b563d7f5b0f429b283105b8a0e255463590e50fdce0abbc07a66f0d1  linux-5.10.257.tar.xz
+sha256  346d77c7eac2cd8d719a2530b4f858bf99bc956b25f80995fd214f8aef821eb4  linux-5.15.209.tar.xz
+sha256  9e7ccb1efc5796e6f8398b778a8b25f7e227e7c54ef5caf6377b8c37d66fb4e5  linux-5.10.258.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index a5caa90370..03ed2d7876 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  094977eb62c20e3d1939fe81a92958a1f987f339446e532fa86963b2804e32dc  linux-7.0.10.tar.xz
+sha256  e56c8356dda01136a6041c6ef832bd0ec99bd2d35dff97832aa5ec10ed014304  linux-7.0.11.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
+sha256  640c4732fb42842166db97e032c1fe7e5ff72c85a8982c75b40f74be3555d760  linux-6.18.34.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.257 b/package/linux-headers/5.10.258
similarity index 100%
rename from package/linux-headers/5.10.257
rename to package/linux-headers/5.10.258
diff --git a/package/linux-headers/5.15.208 b/package/linux-headers/5.15.209
similarity index 100%
rename from package/linux-headers/5.15.208
rename to package/linux-headers/5.15.209
diff --git a/package/linux-headers/6.1.174 b/package/linux-headers/6.1.175
similarity index 100%
rename from package/linux-headers/6.1.174
rename to package/linux-headers/6.1.175
diff --git a/package/linux-headers/6.12.91 b/package/linux-headers/6.12.92
similarity index 100%
rename from package/linux-headers/6.12.91
rename to package/linux-headers/6.12.92
diff --git a/package/linux-headers/6.18.33 b/package/linux-headers/6.18.34
similarity index 100%
rename from package/linux-headers/6.18.33
rename to package/linux-headers/6.18.34
diff --git a/package/linux-headers/6.6.141 b/package/linux-headers/6.6.142
similarity index 100%
rename from package/linux-headers/6.6.141
rename to package/linux-headers/6.6.142
diff --git a/package/linux-headers/7.0.10 b/package/linux-headers/7.0.11
similarity index 100%
rename from package/linux-headers/7.0.10
rename to package/linux-headers/7.0.11
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3d9d578f8e..1c00e2508b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.257"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.208"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.174"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.141"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.91"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.33"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.10"	if BR2_KERNEL_HEADERS_7_0
+	default "5.10.258"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.92"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.34"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.11"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
