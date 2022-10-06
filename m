Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DACC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 329A440BD3;
	Thu,  6 Oct 2022 18:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329A440BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNG0kI3x0ykK; Thu,  6 Oct 2022 18:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FF3540B8A;
	Thu,  6 Oct 2022 18:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FF3540B8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DB151C2744
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D1360F49
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D1360F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18nZSzxHcqVW for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F5F960F3F
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5F960F3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DFDA86938; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:53:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0551f23b05996d92c65c359ed6daa2cd15502aba
X-Git-Newrev: 4613b7aaf023607e8a1f3957b78a816e2e3a5905
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.1DFDA86938@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.0 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=4613b7aaf023607e8a1f3957b78a816e2e3a5905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.0 to linux-headers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                            |  2 ++
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9e75877be9..dde8e5c54c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,3 +1,5 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5c2443a5538de52688efb55c27ab0539c1f5eb58c0cfd16a2b9fbb08fd81788e  linux-6.0.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  4ecdb8b59c6f6f258d89cbf22eede210e0a55c09db884988fe706efe2fe8f148  linux-5.19.13.tar.xz
 sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 856c7fd7b1..4847cd4c87 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_19
+	default BR2_KERNEL_HEADERS_6_0
 	help
 	  Select the kernel version to get headers from.
 
@@ -60,6 +60,10 @@ config BR2_KERNEL_HEADERS_5_17
 config BR2_KERNEL_HEADERS_5_19
 	bool "Linux 5.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
+config BR2_KERNEL_HEADERS_6_0
+	bool "Linux 6.0.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -137,8 +141,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0
+	bool "6.0.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19
-	bool "5.19.x or later"
+	bool "5.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18
@@ -396,6 +404,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
 	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
 	default "5.19.13"	if BR2_KERNEL_HEADERS_5_19
+	default "6.0"		if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0801a3c516..23596d6c85 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -575,6 +575,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -588,6 +592,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	default "5.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	default "5.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 	default "5.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 494e67516f..a9cb61365f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_0
+	bool "6.0.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_19
-	bool "5.19.x or later"
+	bool "5.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_18
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
