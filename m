Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1ACC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF8C9405C9;
	Sun, 24 Mar 2024 18:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOawJkeyUoc9; Sun, 24 Mar 2024 18:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762B0405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 762B0405CB;
	Sun, 24 Mar 2024 18:19:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 381C81BF861
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FABA40469
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1ztXHLTE8Yq for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044A8400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 044A8400D8
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:19:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E512E83C51; Sun, 24 Mar 2024 18:19:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 19:18:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44c221c856a473179daeb9e49bcb89af2b1b1405
X-Git-Newrev: 807a44925697b9567d5bd9872a334a073b3dcf55
X-Patchwork-Hint: ignore
Message-Id: <20240324181919.E512E83C51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.8 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=807a44925697b9567d5bd9872a334a073b3dcf55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.8 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 5595e51fe0..4fa9f701cd 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
 sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
 sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
 sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 874a0a261c..4c3651450e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_7
+	default BR2_KERNEL_HEADERS_6_8
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_6
 config BR2_KERNEL_HEADERS_6_7
 	bool "Linux 6.7.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
+
+config BR2_KERNEL_HEADERS_6_8
+	bool "Linux 6.8.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -128,8 +132,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8
+	bool "6.8.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
-	bool "6.7.x or later"
+	bool "6.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
@@ -418,6 +426,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.22"	if BR2_KERNEL_HEADERS_6_6
 	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
+	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d71fb96d40..e8b3db64fb 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -649,6 +649,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -662,6 +666,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
 	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a7c239dcab..f7825cb88e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -162,8 +162,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_8
+	bool "6.8.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
-	bool "6.7.x or later"
+	bool "6.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
