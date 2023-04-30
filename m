Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C22C77B73
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 20:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B1BD40574;
	Sun, 30 Apr 2023 20:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1BD40574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QzTmyJ8wwG4; Sun, 30 Apr 2023 20:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 182C94056C;
	Sun, 30 Apr 2023 20:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182C94056C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD3E1BF844
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 20:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB72F8175E
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 20:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB72F8175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyVPDwdQnRkr for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 20:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 048A581551
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 20:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048A581551
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E73C7844E9; Sun, 30 Apr 2023 20:44:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Apr 2023 22:42:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b73d16cdcf8a6a835c13d1e589b67f1b28acd311
X-Git-Newrev: eadff4efe9d4c4209b328d7da9dc1b2e6849ca80
X-Patchwork-Hint: ignore
Message-Id: <20230430204406.E73C7844E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.3 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=eadff4efe9d4c4209b328d7da9dc1b2e6849ca80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index cab7b30385..e3047886c5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  ba3491f5ed6bd270a370c440434e3d69085fcdd528922fa01e73d7657db73b1e  linux-6.3.tar.xz
 sha256  c7dded14e368834b18bb2ad64af65560d8bcb9d2d6597e0f6ef151fded01e577  linux-6.2.13.tar.xz
 sha256  dfdcc143a879d64a5ee99213b2b4b05b5dccd566c144df93bca1e204df64c110  linux-6.1.26.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cb614d0eef..4a4f1308cb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_2
+	default BR2_KERNEL_HEADERS_6_3
 	help
 	  Select the kernel version to get headers from.
 
@@ -52,6 +52,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_2
 	bool "Linux 6.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
+config BR2_KERNEL_HEADERS_6_3
+	bool "Linux 6.3.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3
+	bool "6.3.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2
-	bool "6.2.x or later"
+	bool "6.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1
@@ -399,6 +407,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.109"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.26"	if BR2_KERNEL_HEADERS_6_1
 	default "6.2.13"	if BR2_KERNEL_HEADERS_6_2
+	default "6.3"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 80b2dbde4d..ff0eb93017 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -604,6 +604,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -617,6 +621,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.3"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
 	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	default "6.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 8f3905b8d7..0fd8841e5b 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_3
+	bool "6.3.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_2
-	bool "6.2.x or later"
+	bool "6.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
