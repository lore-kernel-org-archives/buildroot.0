Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD994EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2EB610CC;
	Thu,  6 Jul 2023 08:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2EB610CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGjOYqCEVC2s; Thu,  6 Jul 2023 08:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F67610B0;
	Thu,  6 Jul 2023 08:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F67610B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 727231BF575
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47867408FF
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47867408FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgmLJ5k4wwvR for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:30:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3630940583
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3630940583
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22B578671A; Thu,  6 Jul 2023 08:30:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:27:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3512b76f2ec3612a3329bad6da5e82064fd06e6a
X-Git-Newrev: 32230a52aaf9651f8b9ad2692d59db70ac8f27a3
X-Patchwork-Hint: ignore
Message-Id: <20230706083053.22B578671A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.4 headers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=32230a52aaf9651f8b9ad2692d59db70ac8f27a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index d6371a4906..a300d7e9f2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  8fa0588f0c2ceca44cac77a0e39ba48c9f00a6b9dc69761c02a5d3efac8da7f3  linux-6.4.tar.xz
 sha256  e0a9ad8692b2191cbd33db371a780a3fe375de90123a307ecd874c0860cd46e3  linux-6.3.10.tar.xz
 sha256  d8ca0e300f30b9ff70c6e1497c638a1dac1407f45d3655e9c62c6e45a08afe6b  linux-6.1.36.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index baeabd94db..e7175faf70 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_3
+	default BR2_KERNEL_HEADERS_6_4
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_3
 	bool "Linux 6.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+
+config BR2_KERNEL_HEADERS_6_4
+	bool "Linux 6.4.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
+	bool "6.4.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3
-	bool "6.3.x or later"
+	bool "6.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2
@@ -403,6 +411,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.119"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.36"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.10"	if BR2_KERNEL_HEADERS_6_3
+	default "6.4"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index ff0eb93017..2479128cab 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -608,6 +608,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -621,6 +625,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 8ca66ab7b6..5bfc4d0723 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -142,8 +142,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_4
+	bool "6.4.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_3
-	bool "6.3.x or later"
+	bool "6.3.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
