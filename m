Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A387AC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6211F42597;
	Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRJuegkzPUdu; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 994DB42D5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994DB42D5E;
	Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 232A8711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14BB980837
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGzquZzh3uYS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 279168030C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 279168030C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21030879C2; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 10:42:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 175dbdf3fc67775486ddf121b6deb651e2bf7c06
X-Git-Newrev: d9bea4bb89fe2621e8fc26a212f8123f7d53cbe1
X-Patchwork-Hint: ignore
Message-Id: <20250228162930.21030879C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 11}.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9bea4bb89fe2621e8fc26a212f8123f7d53cbe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5e5df7eb40..62f0b06d7b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7bb05dee49..07c1ce7e4f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0bf5ec644817d7928920f763581311f5bf258a92759cf2f30985da743af3ebb2  linux-6.11.7.tar.xz
-sha256  52f9e32d5082ab94253447fd66670d0c3bb765cfcb99b0bf61d1b8eae25952ef  linux-6.6.60.tar.xz
-sha256  17eb68336ee2a8f34378bf6089ffe8f805b978eda314c299d2a63b0603833b81  linux-6.1.116.tar.xz
+sha256  75658a7aa3bd9598c96ee1e5862c5e1d34fced75c28d825c727a1510a6f384b4  linux-6.11.9.tar.xz
+sha256  e2c35611775534941b9d4dd871f3ae5b988b6594dc9033b5ca784366e07d9336  linux-6.6.62.tar.xz
+sha256  010784bd7161c32c4cd68a423d4dcb14e4587677d238b2825a31fe012869224c  linux-6.1.118.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2953e064d8123c4c22c4fd48011378d73c8b99a3bf3d989e33f4f5c8f82f2a3b  linux-5.15.171.tar.xz
-sha256  08a6b5e6bbff85ef017f67b722f6beec7f12fe36fc0f9043f27a91990b88cde0  linux-5.10.229.tar.xz
-sha256  be32c37ef2f6f724fa13acf43cbc9aacfd3acef58964923dae5daa6206d3429c  linux-5.4.285.tar.xz
+sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
+sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
+sha256  180754f3df0e8d7f206625255b3f5a6e1f441feec83336df42613ca8f6b1887c  linux-5.4.286.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  eec9215fbac649d826fda9d3421da47aebd3c4e69e060e5106d32e309a9b6a1c  linux-4.19.323.tar.xz
+sha256  90e140ad2d07da88b43d5930cfda7bffc5c121660e9d8a86d96a9efe4d87ffe6  linux-4.19.324.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a58f54138a..f74802adc9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,13 +428,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.323"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.285"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.229"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.171"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.116"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.60"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.7"	if BR2_KERNEL_HEADERS_6_11
+	default "4.19.324"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.118"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.62"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.9"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
