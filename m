Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2017E77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12BD8121A;
	Wed, 11 Dec 2024 13:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmQSBnGAUziQ; Wed, 11 Dec 2024 13:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6F6811DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6F6811DD;
	Wed, 11 Dec 2024 13:43:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A533962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0884133A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaG4kLHBX4mf for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39A5408AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39A5408AF
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:43:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9792986CD9; Wed, 11 Dec 2024 13:43:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 14:35:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5144d2d7aeafcbff1e0c5bf5ad3fc4bb44ca0089
X-Git-Newrev: 8ad137d76222f26fd32fdbab0c188ad6b6287d7d
X-Patchwork-Hint: ignore
Message-Id: <20241211134307.9792986CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.12 headers
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ad137d76222f26fd32fdbab0c188ad6b6287d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.12 to linux-headers.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 6002478854..67bdc32372 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
 sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
 sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
 sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e8f7515894..0b517534c7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_11
+	default BR2_KERNEL_HEADERS_6_12
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_11
 	bool "Linux 6.11.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
+config BR2_KERNEL_HEADERS_6_12
+	bool "Linux 6.12.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12
+	bool "6.12.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
-	bool "6.11.x or later"
+	bool "6.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
@@ -435,6 +443,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
 	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
+	default "6.12.3"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index c2522aca7f..87160af3d7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -660,6 +660,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -673,6 +677,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index fcffeb6b77..2dc04747b3 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_12
+	bool "6.12.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11
-	bool "6.11.x or later"
+	bool "6.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
