Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579F6C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 21:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EBB6812BD;
	Thu, 12 Jun 2025 21:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEVvWGo_-KSj; Thu, 12 Jun 2025 21:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FBD811BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FBD811BB;
	Thu, 12 Jun 2025 21:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43F571BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D382408B5
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adaSprUR9_12 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 21:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C974087B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C974087B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3717082DEB; Thu, 12 Jun 2025 21:13:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 22:54:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a00ac13d814d795b3d051d10ddbab501e44a7bd
X-Git-Newrev: a4450546ddd5cf1f8600c6c86135785b7049c3c1
X-Patchwork-Hint: ignore
Message-Id: <20250612211358.3717082DEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.15 headers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4450546ddd5cf1f8600c6c86135785b7049c3c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.15 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index c6b3bb7ee1..de6e89dda8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  3458cd6a6c508e161dbc5406e72b99d5dbdf929faf704a67db9ba46d07514858  linux-6.15.2.tar.xz
 sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
 sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
 sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2dc5f8075..15ca78c890 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_14
+	default BR2_KERNEL_HEADERS_6_15
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_14
 	bool "Linux 6.14.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
+
+config BR2_KERNEL_HEADERS_6_15
+	bool "Linux 6.15.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15
+	bool "6.15.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14
-	bool "6.14.x or later"
+	bool "6.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13
@@ -447,6 +455,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
 	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
+	default "6.15.2"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3063bae2b6..185a01057e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -653,6 +653,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -666,6 +670,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	default "6.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	default "6.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	default "6.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 94ea3b82de..7a27714e09 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_15
+	bool "6.15.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_14
-	bool "6.14.x or later"
+	bool "6.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_13
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
