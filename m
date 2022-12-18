Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F7FC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4751E82BA7;
	Mon, 20 Feb 2023 23:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4751E82BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIXLDAVIGEaE; Mon, 20 Feb 2023 23:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6447C82BC0;
	Mon, 20 Feb 2023 23:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6447C82BC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88F791BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96D95612C9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D95612C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BRrVAHGzrRm for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F6D612B7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F6D612B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C33A828C8; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:56:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 298bcb0455d0cbf4231f4b87a8e132202120ac79
X-Git-Newrev: 79bb1ab519448993dbd88e21ddf55b5cfc283115
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.6C33A828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {toolchain,
 linux-headers}: add support for 6.1 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=79bb1ab519448993dbd88e21ddf55b5cfc283115
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9684dc5697..c7bbb6be99 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb  linux-6.1.tar.xz
 sha256  08d3118d6b755769f166de6babed54964393a7c0928029bef11bf55559a72da4  linux-6.0.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  40590843c04c85789105157f69efbd71a4efe87ae2568e40d1b7258c3f747ff3  linux-5.15.83.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 93f443b78f..cd36c7c763 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_0
+	default BR2_KERNEL_HEADERS_6_1
 	help
 	  Select the kernel version to get headers from.
 
@@ -56,6 +56,10 @@ config BR2_KERNEL_HEADERS_5_15
 config BR2_KERNEL_HEADERS_6_0
 	bool "Linux 6.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+
+config BR2_KERNEL_HEADERS_6_1
+	bool "Linux 6.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1
+	bool "6.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0
-	bool "6.0.x or later"
+	bool "6.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19
@@ -395,6 +403,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.159"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.83"	if BR2_KERNEL_HEADERS_5_15
 	default "6.0.13"	if BR2_KERNEL_HEADERS_6_0
+	default "6.1"		if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4947ab3aae..544b423001 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -591,6 +591,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -604,6 +608,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	default "6.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	default "5.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	default "5.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a9cb61365f..1c39334ddd 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_1
+	bool "6.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_0
-	bool "6.0.x or later"
+	bool "6.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_19
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
