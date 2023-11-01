Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB9C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 20:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2028E4EE90;
	Wed,  1 Nov 2023 20:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2028E4EE90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rzsNtXZKocA; Wed,  1 Nov 2023 20:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB024EE91;
	Wed,  1 Nov 2023 20:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB024EE91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9A811BF5DB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 20:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10BF704E8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 20:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10BF704E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jj2r6iQqa4nJ for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 20:54:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCAC7704E7
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 20:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCAC7704E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A42B186486; Wed,  1 Nov 2023 20:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 19:22:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82b17f5757275fe83b0a6671bc6c07d335306f86
X-Git-Newrev: f3a81cc068547629b46dcceadd741c05f0e51957
X-Patchwork-Hint: ignore
Message-Id: <20231101205421.A42B186486@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.6 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3a81cc068547629b46dcceadd741c05f0e51957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.6 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 78d1395e66..7b56d19cb5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0  linux-6.6.tar.xz
 sha256  c6662f64713f56bf30e009c32eac15536fad5fd1c02e8a3daf62a0dc2f058fd5  linux-6.5.9.tar.xz
 sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bb624147ec..74d445ff27 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_5
+	default BR2_KERNEL_HEADERS_6_6
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_5
 	bool "Linux 6.5.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
+config BR2_KERNEL_HEADERS_6_6
+	bool "Linux 6.6.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
+	bool "6.6.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
-	bool "6.5.x or later"
+	bool "6.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4
@@ -411,6 +419,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.9"		if BR2_KERNEL_HEADERS_6_5
+	default "6.6"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d8081f1b9d..34e0ae2c5f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -640,6 +640,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -653,6 +657,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 556ca7a642..5554d56719 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
+	bool "6.6.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
-	bool "6.5.x or later"
+	bool "6.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
