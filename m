Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E135DC83F17
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 00:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25C34114D;
	Tue, 29 Jul 2025 00:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBUYLFLwcbnP; Tue, 29 Jul 2025 00:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BDE4114F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BDE4114F;
	Tue, 29 Jul 2025 00:09:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B5F1DE2
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 00:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98B6E4114F
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 00:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keoKmBYkrTrw for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 00:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B86A94114D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B86A94114D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 00:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5C2686C73; Tue, 29 Jul 2025 00:09:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 01:20:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d08c30697b4eb62f20a50a512f354ea456d71ed0
X-Git-Newrev: d9a1352e7d9fdda64e9cf8a2a6d398f8d4c83389
X-Patchwork-Hint: ignore
Message-Id: <20250729000947.A5C2686C73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.16 headers
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9a1352e7d9fdda64e9cf8a2a6d398f8d4c83389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.16 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1e6602c878..8401af95e4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
 sha256  d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6  linux-6.15.8.tar.xz
 sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
 sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 23b65f8dee..37a44c2e3c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_15
+	default BR2_KERNEL_HEADERS_6_16
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_15
 	bool "Linux 6.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+
+config BR2_KERNEL_HEADERS_6_16
+	bool "Linux 6.16.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16
+	bool "6.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15
-	bool "6.15.x or later"
+	bool "6.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14
@@ -451,6 +459,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
 	default "6.15.8"	if BR2_KERNEL_HEADERS_6_15
+	default "6.16"		if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 185a01057e..8f91b23562 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -657,6 +657,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -670,6 +674,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	default "6.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	default "6.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1580ffb920..bc34701455 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_16
+	bool "6.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_15
-	bool "6.15.x or later"
+	bool "6.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_14
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
