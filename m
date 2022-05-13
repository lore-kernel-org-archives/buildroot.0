Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA25C433FE
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4824D60B4B;
	Fri, 13 May 2022 16:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2ufgogxqn2a; Fri, 13 May 2022 16:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D06760F3C;
	Fri, 13 May 2022 16:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4B21BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CFA560B4B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuI-AJEqhVnn for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:35:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A866260AEE
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F15F285DB5; Fri, 13 May 2022 16:24:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 18:32:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9286f2a4d4b81d5e8d04195cf3bfc4a786286558
X-Git-Newrev: 2b134f9549dacd73621be11bb7894bacd3c7b0a1
X-Patchwork-Hint: ignore
Message-Id: <20220513162431.F15F285DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 5.17.x headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b134f9549dacd73621be11bb7894bacd3c7b0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.hash                                              |  1 +
 package/linux-headers/Config.in.host                          | 11 ++++++++++-
 toolchain/Config.in                                           |  4 ++++
 .../toolchain-external-custom/Config.in.options               |  6 +++++-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index e6ac7af19d..2a96eef8d3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  22f67ef6b12ef6c0c0353be4b90b4bf4b9b18b858c16c346fa495b67ec718c99  linux-5.17.7.tar.xz
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
 sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
 sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 36af5d0a20..5ff616fb34 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -59,6 +59,10 @@ config BR2_KERNEL_HEADERS_5_15
 config BR2_KERNEL_HEADERS_5_16
 	bool "Linux 5.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
+config BR2_KERNEL_HEADERS_5_17
+	bool "Linux 5.17.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -136,8 +140,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17
+	bool "5.17.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16
-	bool "5.16.x or later"
+	bool "5.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
@@ -382,6 +390,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
+	default "5.17.7"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index b572a89f2f..73ea78624a 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -572,6 +572,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 683204e56e..0c8b83fc0e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_17
+	bool "5.17.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_16
-	bool "5.16.x or later"
+	bool "5.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_15
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
