Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DEFC3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 06:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D19B4405F7;
	Fri, 26 Jul 2024 06:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcBSfYcaTzF5; Fri, 26 Jul 2024 06:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB17406A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB17406A4;
	Fri, 26 Jul 2024 06:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6465D1BF83A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09CD660698
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSItVoAW491h for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 06:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215436070C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 215436070C
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 06:43:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08C56874F6; Fri, 26 Jul 2024 06:43:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 08:37:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5e2f8287a73f33ac82da78f4b75c6289612510e
X-Git-Newrev: 92a1e80ba4f7c8349acc7dc67bc0611ca67b8e9b
X-Patchwork-Hint: ignore
Message-Id: <20240726064330.08C56874F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.10 headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92a1e80ba4f7c8349acc7dc67bc0611ca67b8e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.10 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b059ecd892..2d2b6d3546 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  70109dfd1cd1c5f8a58eb1cb37122b9bf93f9c6a6280bf91019263c7339cf76b  linux-6.10.1.tar.xz
 sha256  efd12e335fa67d13a3eae30e4b7b7546e74b8ccc90682e4c3fffab0b22654da1  linux-6.9.10.tar.xz
 sha256  9ec99c578158ab85d99b37791a76643d2ea4c3f72ecbef7b5eb6d60f3de032ef  linux-6.6.41.tar.xz
 sha256  b9aa6ec1a00f234d6c6f2d428fbb0a6bf459606c259263df978f86685b65a8b9  linux-6.1.100.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index daa54b4ef1..707f2ad026 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_9
+	default BR2_KERNEL_HEADERS_6_10
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_9
 	bool "Linux 6.9.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+
+config BR2_KERNEL_HEADERS_6_10
+	bool "Linux 6.10.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -128,8 +132,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
+	bool "6.10.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9
-	bool "6.9.x or later"
+	bool "6.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8
@@ -426,6 +434,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.100"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.41"	if BR2_KERNEL_HEADERS_6_6
 	default "6.9.10"	if BR2_KERNEL_HEADERS_6_9
+	default "6.10.1"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8acdc62fc2..6e91ab756c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -652,6 +652,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -665,6 +669,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 45a87fb3c8..0daa1e3583 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_10
+	bool "6.10.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_9
-	bool "6.9.x or later"
+	bool "6.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
