Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD5ECD4F4A
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 17:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674D04287C;
	Sun, 17 May 2026 17:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB1yKqxjx26f; Sun, 17 May 2026 17:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3232042880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779037395;
	bh=8OoEmYQOLsiQmBtw8qx9hO9cmGehYW68qn0GBR3j+IE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sLTArMtpjAXjnd+mC7U3gQhtn73PBxg9M8M7lLygAAKBXmkAZohmE0pptDULaCw9g
	 fj/HJReAtMBrR4cexKc+B5/RNgRDEV/3nfVcmg5fpmdJfJKvf/dejdzSMynMJeUHLM
	 k6VDULndaEFC64g1Q4eJt/F5AJoz9ylaE6WFhVnV/XpsyfALSMN5JZ8S272iPB4onP
	 yLYsRkoJyC/sld15E8vhxc8Zw3Xc/SBUFak1+Vb1VOEknQpHQUJrvVA2QpogaJ3TxY
	 uvIVvkewucVjICvvUy5Szk0NxpnzQlIHE8xP9gkUQUkxuhgA9uCtQfR3W3ky2Svzd7
	 c6o1JI/rOA4Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3232042880;
	Sun, 17 May 2026 17:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B03D5390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B5542880
 for <buildroot@buildroot.org>; Sun, 17 May 2026 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWtuBwqA9Plo for <buildroot@buildroot.org>;
 Sun, 17 May 2026 17:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F73F4287C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F73F4287C
 for <buildroot@buildroot.org>; Sun, 17 May 2026 17:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C48C986514; Sun, 17 May 2026 17:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 May 2026 18:55:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b1b1d6380536e1b01f78535ac3a0a1c19c4f0b7
X-Git-Newrev: f049a07fb054a39b832b06c3c2f2aa74410cd167
X-Patchwork-Hint: ignore
Message-Id: <20260517170306.C48C986514@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f049a07fb054a39b832b06c3c2f2aa74410cd167
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.6 => 7.0.9}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.255 => 5.10.256} |  0
 package/linux-headers/{5.15.206 => 5.15.207} |  0
 package/linux-headers/{6.1.172 => 6.1.173}   |  0
 package/linux-headers/{6.12.87 => 6.12.90}   |  0
 package/linux-headers/{6.18.29 => 6.18.32}   |  0
 package/linux-headers/{6.6.138 => 6.6.140}   |  0
 package/linux-headers/{7.0.6 => 7.0.9}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.0.6 b/linux/7.0.9
similarity index 100%
rename from linux/7.0.6
rename to linux/7.0.9
diff --git a/linux/Config.in b/linux/Config.in
index 84246b4228..a0eca841af 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index ba20750b7b..380987601b 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  cc12a7644b4cef9e06627b29de8753e22b3d076703a9b52be84263e05c8b9830  linux-6.12.87.tar.xz
-sha256  add06b5fdb655c7e575fbfa29e7bab23a3c36c5388e77fa759ed4b0d1a55a80f  linux-6.6.138.tar.xz
-sha256  f1672e610dc9e05e33de1803857e26c5abe1d1ab0a2ea74b0d8269267f73b499  linux-6.1.172.tar.xz
+sha256  1f1a1ff057468b8a6284d3ce1d181278259beb5670ea16724c46dbf8820fa2a8  linux-6.12.90.tar.xz
+sha256  d67c9674a2d4307f3747183935a5d434391df0fc5f5bf0e00691e059f664b7db  linux-6.6.140.tar.xz
+sha256  c4f32c6cfbe8c31478f18a4b2a50f89e73f8641ba1d683d80efc16c898876d98  linux-6.1.173.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  5fc6ce4f4cfb17977bc6e14c52a0e10846544f1ffc133aac26d6de7e14a5e61f  linux-5.15.206.tar.xz
-sha256  3956b387bfb5133c00f3f7f76a0a436934a349e8a9319a231a1b5b829d7866a7  linux-5.10.255.tar.xz
+sha256  50eb7fa307745f30e5cae4c17e188fc42ce6a72f7d925d5ea7e3c2135de6148e  linux-5.15.207.tar.xz
+sha256  f1e9dac8ec41e5bd7b1811158c7b72269696ce1c37fbdd17a898b293b54d8e5f  linux-5.10.256.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index d80a04c02c..2d9eadabdb 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  cba44440aa57affd7c21241dc5bc234b0df53c499f8ffc3ebc290dd3390a7523  linux-7.0.6.tar.xz
+sha256  ac07acdf76cf4621cc5187a2670270a1a699533c8a6b225e4878c416ad83f1c4  linux-7.0.9.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c33ea75b1f3bc5fccab836790cd3684eab7057ff383464b5efd8a68ba622a83c  linux-6.18.29.tar.xz
+sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.255 b/package/linux-headers/5.10.256
similarity index 100%
rename from package/linux-headers/5.10.255
rename to package/linux-headers/5.10.256
diff --git a/package/linux-headers/5.15.206 b/package/linux-headers/5.15.207
similarity index 100%
rename from package/linux-headers/5.15.206
rename to package/linux-headers/5.15.207
diff --git a/package/linux-headers/6.1.172 b/package/linux-headers/6.1.173
similarity index 100%
rename from package/linux-headers/6.1.172
rename to package/linux-headers/6.1.173
diff --git a/package/linux-headers/6.12.87 b/package/linux-headers/6.12.90
similarity index 100%
rename from package/linux-headers/6.12.87
rename to package/linux-headers/6.12.90
diff --git a/package/linux-headers/6.18.29 b/package/linux-headers/6.18.32
similarity index 100%
rename from package/linux-headers/6.18.29
rename to package/linux-headers/6.18.32
diff --git a/package/linux-headers/6.6.138 b/package/linux-headers/6.6.140
similarity index 100%
rename from package/linux-headers/6.6.138
rename to package/linux-headers/6.6.140
diff --git a/package/linux-headers/7.0.6 b/package/linux-headers/7.0.9
similarity index 100%
rename from package/linux-headers/7.0.6
rename to package/linux-headers/7.0.9
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 405d136ea0..f935c21f9e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.255"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.206"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.172"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.138"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.87"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.29"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.6"		if BR2_KERNEL_HEADERS_7_0
+	default "5.10.256"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.207"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.173"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.140"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.90"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.32"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.9"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
