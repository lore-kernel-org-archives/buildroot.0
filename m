Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37524CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047AD40628;
	Tue, 22 Oct 2024 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTR8W8FfJfoA; Tue, 22 Oct 2024 21:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FCC4062D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77FCC4062D;
	Tue, 22 Oct 2024 21:08:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 434602072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0553607A9
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJ_UJOBCs4w6 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDFA6078B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FDFA6078B
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C92686274; Tue, 22 Oct 2024 21:08:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 23:03:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a203208204cd9530337145fde6dcdf1e9b41b8f
X-Git-Newrev: 8142ae5c2a6c6510036a9dc01f56e41aed21f268
X-Patchwork-Hint: ignore
Message-Id: <20241022210811.8C92686274@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.11 headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8142ae5c2a6c6510036a9dc01f56e41aed21f268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.11 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ea13ab0aeb..32e1be4091 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
 sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
 sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
 sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 39dca346ea..a3610d7ecd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_10
+	default BR2_KERNEL_HEADERS_6_11
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_10
 	bool "Linux 6.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
+
+config BR2_KERNEL_HEADERS_6_11
+	bool "Linux 6.11.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11
+	bool "6.11.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10
-	bool "6.10.x or later"
+	bool "6.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9
@@ -431,6 +439,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
 	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
+	default "6.11.3"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6e91ab756c..c2522aca7f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -656,6 +656,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -669,6 +673,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
 	default "6.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 	default "6.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
 	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0daa1e3583..fcffeb6b77 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_11
+	bool "6.11.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_10
-	bool "6.10.x or later"
+	bool "6.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
