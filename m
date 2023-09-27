Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F93AE82CC6
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5D442884;
	Wed, 27 Sep 2023 19:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5D442884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQulq952LmZR; Wed, 27 Sep 2023 19:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C2BE428E9;
	Wed, 27 Sep 2023 19:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C2BE428E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93C491BF98E
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D3D783560
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D3D783560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5y9leNFSxJGN for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:08:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8693A83542
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8693A83542
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 635EB8269E; Wed, 27 Sep 2023 19:08:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:06:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 181cf756ca42422569ed4fa8ac00ea844722208d
X-Git-Newrev: 18d21c9cfc93da9896e32bdd173b607c85980708
X-Patchwork-Hint: ignore
Message-Id: <20230927190849.635EB8269E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.5 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=18d21c9cfc93da9896e32bdd173b607c85980708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.5 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index cac7fba207..858e615a12 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  8cf10379f7df8ea731e09bff3d0827414e4b643dd41dc99d0af339669646ef95  linux-6.5.5.tar.xz
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
 sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a0bdbe8555..ee4e953bf0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_4
+	default BR2_KERNEL_HEADERS_6_5
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_4
 	bool "Linux 6.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
+config BR2_KERNEL_HEADERS_6_5
+	bool "Linux 6.5.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
+	bool "6.5.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
-	bool "6.4.x or later"
+	bool "6.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3
@@ -407,6 +415,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
+	default "6.5.5"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index da6bf5f4c8..d8081f1b9d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -636,6 +636,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -649,6 +653,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0f4f5eef2e..556ca7a642 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
+	bool "6.5.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_4
-	bool "6.4.x or later"
+	bool "6.4.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
