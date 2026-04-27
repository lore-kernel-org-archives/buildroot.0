Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8DBFF8868
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCCC260760;
	Mon, 27 Apr 2026 20:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogb4TIUOATSt; Mon, 27 Apr 2026 20:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D405A60763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777322380;
	bh=RmZctaq2URgzMkc14IuOmWh9igC7aeUV3p3wLZXpusw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LOjQSKwqm1zSGFnTo07mPN/8Z2YjXrFhQioUVbNBP5Z7cZNbnI7WX7Te5ItdeI7gR
	 xpJcQMXzKAyeQJ54fo8ZIXLL+MBfwxzVlNl2LJ72Da/b+CMMKCbggRiZHwtCEiGAFV
	 hiU0Z0B/7azeZ7Dy15uuZsXRWrRPe2WCpOVr0L5rbQ8zgf6eweJb1eEiC3EseR9fB1
	 AYOHaJWzfvmWIiuk5I8NPpsTx/iEfqS/Hss9VceNBkX9BOKaXtv3RA93eDHzTOs0z1
	 sFAr8QNUx3by3IeKAmyjI3ckBacTY0tzjpn3NDZnUQmVh2gDuJlm/9GjdkV4CcAO2K
	 nnDMG75fAbv5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D405A60763;
	Mon, 27 Apr 2026 20:39:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3F11B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80E094009D
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EsR1Qsk5Y6u for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B1F400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B1F400C7
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:39:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67D4D83785; Mon, 27 Apr 2026 20:39:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 22:33:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8e7f79241999245710963f42a4bcb4524ebeff7
X-Git-Newrev: 37d84032bef02a913c825dc67ab7ecff39b0e9d3
X-Patchwork-Hint: ignore
Message-Id: <20260427203938.67D4D83785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12,
 18}.x / 7.0.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/37d84032bef02a913c825dc67ab7ecff39b0e9d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.1 => 7.0.2}                     | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.83 => 6.12.84} | 0
 package/linux-headers/{6.18.24 => 6.18.25} | 0
 package/linux-headers/{6.6.135 => 6.6.136} | 0
 package/linux-headers/{7.0.1 => 7.0.2}     | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/7.0.1 b/linux/7.0.2
similarity index 100%
rename from linux/7.0.1
rename to linux/7.0.2
diff --git a/linux/Config.in b/linux/Config.in
index 8633ddbc82..8fa2ab8ef2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7e14032158..d9f1290f9c 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  39e3172cd1dfa526d353b603e6388db2ab122bbf6a08e05930559a832adcdf31  linux-6.12.83.tar.xz
-sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
+sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
 sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index a2e1be9d31..c7f378d06c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  b2c935a36d24980e11e59bed3ca558ea6d67619ec0065faa335cdc0b64d887bf  linux-7.0.1.tar.xz
+sha256  53591a03294527a48ccb0b9e559e922df8a38554745a1206827ca751d2ca7662  linux-7.0.2.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c207c557ce58103b4dda30e26da5203f3d8467c6dadc53d709f6d83ae1d1255f  linux-6.18.24.tar.xz
+sha256  29680a07d4430b269af6ce68079b0e81dbd60f03e6f351e0661991fe39bd1898  linux-6.18.25.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.83 b/package/linux-headers/6.12.84
similarity index 100%
rename from package/linux-headers/6.12.83
rename to package/linux-headers/6.12.84
diff --git a/package/linux-headers/6.18.24 b/package/linux-headers/6.18.25
similarity index 100%
rename from package/linux-headers/6.18.24
rename to package/linux-headers/6.18.25
diff --git a/package/linux-headers/6.6.135 b/package/linux-headers/6.6.136
similarity index 100%
rename from package/linux-headers/6.6.135
rename to package/linux-headers/6.6.136
diff --git a/package/linux-headers/7.0.1 b/package/linux-headers/7.0.2
similarity index 100%
rename from package/linux-headers/7.0.1
rename to package/linux-headers/7.0.2
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0c1a90f920..c34dd4a7df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -471,10 +471,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.83"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.24"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.1"		if BR2_KERNEL_HEADERS_7_0
+	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.25"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.2"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
