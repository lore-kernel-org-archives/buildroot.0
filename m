Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D284C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF6570C6B;
	Mon, 19 May 2025 10:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6YDI3U80kGi; Mon, 19 May 2025 10:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3307A70C6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3307A70C6C;
	Mon, 19 May 2025 10:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3358CD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 494DA414E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqvkRa12qpW0 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E697B4149D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E697B4149D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2E138348A; Mon, 19 May 2025 10:40:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 May 2025 21:56:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 176c61266e6cce1e7039d67c5d848fde534312f1
X-Git-Newrev: 9aec878a0dde3615d8f1ae18a7c13b387e26e52d
X-Patchwork-Hint: ignore
Message-Id: <20250519104000.E2E138348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {toolchain,
 linux-headers}: add support for 6.14 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aec878a0dde3615d8f1ae18a7c13b387e26e52d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And add (and default to) 6.14 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 68bc458c71..4dc1504be6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
 sha256  611fbb669cf5539da48137a9c052becd499f3f862afaf21ab84cea3966221242  linux-6.13.12.tar.xz
 sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
 sha256  ff856748671629c1fefef219099e0b4b81131c2d325e768cb0806e204157014e  linux-6.6.90.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6fd591eb69..f788f9ca44 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_13
+	default BR2_KERNEL_HEADERS_6_14
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_13
 	bool "Linux 6.13.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
+
+config BR2_KERNEL_HEADERS_6_14
+	bool "Linux 6.14.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14
+	bool "6.14.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13
-	bool "6.13.x or later"
+	bool "6.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12
@@ -443,6 +451,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.90"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.28"	if BR2_KERNEL_HEADERS_6_12
 	default "6.13.12"	if BR2_KERNEL_HEADERS_6_13
+	default "6.14.6"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2290d13ad0..89eaa7b618 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -649,6 +649,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -662,6 +666,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	default "6.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 	default "6.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 	default "6.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index e1ecf06e4a..94ea3b82de 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -166,8 +166,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_14
+	bool "6.14.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_13
-	bool "6.13.x or later"
+	bool "6.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
