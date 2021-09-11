Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7CEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:32:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0E6611F2
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC0E6611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25AE607DA;
	Sat, 11 Sep 2021 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPkiwHFWPFJ8; Sat, 11 Sep 2021 13:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF8C2607D7;
	Sat, 11 Sep 2021 13:32:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7F0C1BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D717C4079B
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejVnRlxgYxyp for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:32:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17606404A6
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:32:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 08D0A88F9C; Sat, 11 Sep 2021 13:30:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 15:31:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8bc9b4d86db9839b5f83c83cd5b3ab710a0782d
X-Git-Newrev: 47523da623d81464fd48586ea265f5dc26a4d93f
X-Patchwork-Hint: ignore
Message-Id: <20210911133048.08D0A88F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: add version 5.14
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47523da623d81464fd48586ea265f5dc26a4d93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                                             |  4 ++--
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3f00680a09..270b825e22 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,7 +28,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.13)"
+	bool "Latest version (5.14)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.198-cip54)"
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.13.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ee5946e61f..e042123438 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2  linux-5.14.tar.xz
 sha256  72fe7cc1f0363523061659a21e24754697b27f405cb88a41a63038629636159a  linux-5.13.9.tar.xz
 sha256  e9381cd3525a02f5b895f74147e2440be443ecd45484c6c64075046bc6f94c73  linux-5.12.19.tar.xz
 sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 18f51b93be..4dfd4a7845 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_13
+	default BR2_KERNEL_HEADERS_5_14
 	help
 	  Select the kernel version to get headers from.
 
@@ -69,6 +69,10 @@ config BR2_KERNEL_HEADERS_5_12
 config BR2_KERNEL_HEADERS_5_13
 	bool "Linux 5.13.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
+
+config BR2_KERNEL_HEADERS_5_14
+	bool "Linux 5.14.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -143,8 +147,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14
+	bool "5.14.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13
-	bool "5.13.x or later"
+	bool "5.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12
@@ -379,6 +387,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
 	default "5.12.19"	if BR2_KERNEL_HEADERS_5_12
 	default "5.13.9"	if BR2_KERNEL_HEADERS_5_13
+	default "5.14"		if BR2_KERNEL_HEADERS_5_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index af21959eff..a78b884579 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -545,6 +545,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -558,6 +562,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	default "5.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 	default "5.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	default "5.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index bc4561f3f7..ae78c0ef9e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,8 +123,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_14
+	bool "5.14.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_13
-	bool "5.13.x or later"
+	bool "5.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_12
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
