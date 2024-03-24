Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A4CC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE38D40A15;
	Sun, 24 Mar 2024 16:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCHIvOnQtkqh; Sun, 24 Mar 2024 16:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 668DE40AA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 668DE40AA5;
	Sun, 24 Mar 2024 16:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 811C51BF861
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E20440490
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyTwolOO7Qnh for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E4E40004
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E4E40004
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:00:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D87083BB5; Sun, 24 Mar 2024 16:00:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:55:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9553dc9a55c13916c26aaae4fac037d35ddacca3
X-Git-Newrev: c21a0556db93a85b3363e4a5b6e3a832d061ccfd
X-Patchwork-Hint: ignore
Message-Id: <20240324160057.6D87083BB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.7 headers
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c21a0556db93a85b3363e4a5b6e3a832d061ccfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.7 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 977ad30f73..6b0c5de1f6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
 sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
 sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fe4fc5011e..1c2500fb79 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_6
+	default BR2_KERNEL_HEADERS_6_7
 	help
 	  Select the kernel version to get headers from.
 
@@ -47,6 +47,10 @@ config BR2_KERNEL_HEADERS_6_1
 config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
+config BR2_KERNEL_HEADERS_6_7
+	bool "Linux 6.7.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -124,8 +128,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
+	bool "6.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
-	bool "6.6.x or later"
+	bool "6.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
@@ -409,6 +417,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
+	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 1641dbae06..d71fb96d40 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -645,6 +645,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -658,6 +662,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
 	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 5554d56719..a7c239dcab 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
+	bool "6.7.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
-	bool "6.6.x or later"
+	bool "6.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
