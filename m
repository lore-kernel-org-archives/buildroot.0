Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E4CE7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 14:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87B380FA9;
	Sat,  7 Dec 2024 14:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43Tc_gaDsqMT; Sat,  7 Dec 2024 14:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D733680FAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D733680FAA;
	Sat,  7 Dec 2024 14:38:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D44ED7
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 14:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F67605CA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 14:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxXbZ5j3sVPp for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 14:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9FC5600C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9FC5600C6
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 14:38:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C538386ADE; Sat,  7 Dec 2024 14:38:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 15:37:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eedf9750ff8ade051892a5c4d2bc88e85dc4ebb8
X-Git-Newrev: 5f18745057a8bd2e0a3dc40d77ea382c5f6e41f0
X-Patchwork-Hint: ignore
Message-Id: <20241207143803.C538386ADE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: bump 4.19.x / 6.11.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f18745057a8bd2e0a3dc40d77ea382c5f6e41f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 92aeda5e6f..63078d686e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0135a14119..6002478854 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4bc184915290629d61f935aa1eb1b6e711b8e47d8f289a39f0d584ecbdb4fe77  linux-6.11.10.tar.xz
+sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
 sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
 sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
@@ -7,7 +7,7 @@ sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-
 sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
 sha256  180754f3df0e8d7f206625255b3f5a6e1f441feec83336df42613ca8f6b1887c  linux-5.4.286.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  90e140ad2d07da88b43d5930cfda7bffc5c121660e9d8a86d96a9efe4d87ffe6  linux-4.19.324.tar.xz
+sha256  607bed7de5cda31a443df4c8a78dbe5e8a9ad31afde2a4d28fe99ab4730e8de1  linux-4.19.325.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9cf31c484d..e8f7515894 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,13 +428,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.324"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.325"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.10"	if BR2_KERNEL_HEADERS_6_11
+	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
