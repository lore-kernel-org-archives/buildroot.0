Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F850C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E633283FBA;
	Thu,  6 Oct 2022 18:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E633283FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMfW_rOUStJf; Thu,  6 Oct 2022 18:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F409783F88;
	Thu,  6 Oct 2022 18:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F409783F88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204001BF3FB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF3583F3E
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF3583F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCbqdXLwJ5f4 for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 250F683F88
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250F683F88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1439886937; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:53:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db678645eb1702e007414a9e9d5073d541a7c6d3
X-Git-Newrev: 0551f23b05996d92c65c359ed6daa2cd15502aba
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.1439886937@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 5.19 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=0551f23b05996d92c65c359ed6daa2cd15502aba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 5.19.13 to linux-headers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index a1b7984489..9e75877be9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  4ecdb8b59c6f6f258d89cbf22eede210e0a55c09db884988fe706efe2fe8f148  linux-5.19.13.tar.xz
 sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
 sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz
 sha256  3f47ebdb9afe152a0c32c1157336ef13fa5cc08ac6d884dfc1f6ddc2b7dba268  linux-5.10.142.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9d993a2e99..856c7fd7b1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_17
+	default BR2_KERNEL_HEADERS_5_19
 	help
 	  Select the kernel version to get headers from.
 
@@ -56,6 +56,10 @@ config BR2_KERNEL_HEADERS_5_15
 config BR2_KERNEL_HEADERS_5_17
 	bool "Linux 5.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
+
+config BR2_KERNEL_HEADERS_5_19
+	bool "Linux 5.19.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19
+	bool "5.19.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18
-	bool "5.18.x or later"
+	bool "5.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17
@@ -387,6 +395,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.142"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
 	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
+	default "5.19.13"	if BR2_KERNEL_HEADERS_5_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index c49691cff2..0801a3c516 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -571,6 +571,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -584,6 +588,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	default "5.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 	default "5.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	default "5.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 16f1ac0a5e..494e67516f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_19
+	bool "5.19.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_18
-	bool "5.18.x or later"
+	bool "5.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_17
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
