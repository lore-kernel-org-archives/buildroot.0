Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D5CC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5336A60736;
	Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KcP_4iqGmX5; Fri, 28 Feb 2025 16:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65086FACC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65086FACC;
	Fri, 28 Feb 2025 16:32:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E97E711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB090419C5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgfIuRFyQS5B for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D3041965
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9D3041965
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C251F7FD96; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Nov 2024 19:36:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1ec30e6f11f058b4510342a98639b06de1c43358
X-Git-Newrev: 5d49bc51e032b0d512741618dbec6596eac9d452
X-Patchwork-Hint: ignore
Message-Id: <20250228162930.C251F7FD96@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 6.{1, 6, 11}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d49bc51e032b0d512741618dbec6596eac9d452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 62f0b06d7b..92aeda5e6f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 07c1ce7e4f..0135a14119 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  75658a7aa3bd9598c96ee1e5862c5e1d34fced75c28d825c727a1510a6f384b4  linux-6.11.9.tar.xz
-sha256  e2c35611775534941b9d4dd871f3ae5b988b6594dc9033b5ca784366e07d9336  linux-6.6.62.tar.xz
-sha256  010784bd7161c32c4cd68a423d4dcb14e4587677d238b2825a31fe012869224c  linux-6.1.118.tar.xz
+sha256  4bc184915290629d61f935aa1eb1b6e711b8e47d8f289a39f0d584ecbdb4fe77  linux-6.11.10.tar.xz
+sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
+sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
 sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f74802adc9..9cf31c484d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,9 +432,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.118"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.62"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.9"	if BR2_KERNEL_HEADERS_6_11
+	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.10"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
