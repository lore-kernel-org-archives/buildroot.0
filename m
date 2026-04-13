Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B177F531CD
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3284840F48;
	Mon, 13 Apr 2026 19:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UaAbH3xh_6f; Mon, 13 Apr 2026 19:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E1240F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776109610;
	bh=hELzpyETBB5WOobM5o1HdCbTtnrebIPo2x3GQlBo3AA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D2cq6Ymhyg0LXNRACLue7p44j0xIWWj2xYC+RM8WEh3NdEHcduR/67xuV3CNBnoI7
	 xdPOyTEX8UWneU9HKV9LEkNN7JA2YfhxyxFEyuROjC0lyXCvptMWUkg5qZscxBUzRq
	 84n1CIQFkfOYhFDItELO7JBqxnxEJg+XTtXOO3Fi2RvR2UaDa84A2zpCczXRK8r7hJ
	 xSb4JMcJoijR6gYD9IF1+p35xEEo3nZcPeoP0xghPbbvoh/lP5YnwPp2n0U/QjToEC
	 MjHyQAMUtVXP+mTgDH5k6hldiud2mlwmCXUp3aX2+B6NY0Ka17n3vplZF/86B3oZgp
	 jD46BrUBAkFyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E1240F55;
	Mon, 13 Apr 2026 19:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5D71283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C0BE60EF1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWErLGoBE59l for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C433A60DDA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C433A60DDA
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F798813CF; Mon, 13 Apr 2026 19:46:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 21:23:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59ee8738f6073503798b72eb4cac095f2edca1d5
X-Git-Newrev: 9af85c8f018ccbd9af60dc8bd4bbf52a1a68327f
X-Patchwork-Hint: ignore
Message-Id: <20260413194645.5F798813CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 7.0 headers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9af85c8f018ccbd9af60dc8bd4bbf52a1a68327f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/from-6.17/linux.hash                                  |  3 +++
 package/linux-headers/7.0                                   |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 77c1ba866d..75994f545c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,3 +1,6 @@
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  bb7f6d80b387c757b7d14bb93028fcb90f793c5c0d367736ee815a100b3891f0  linux-7.0.tar.xz
+
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
 sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
diff --git a/package/linux-headers/7.0 b/package/linux-headers/7.0
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.0
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd68c29ec4..366d17ad09 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_19
+	default BR2_KERNEL_HEADERS_7_0
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_6_19
 	bool "Linux 6.19.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
+config BR2_KERNEL_HEADERS_7_0
+	bool "Linux 7.0.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
+	bool "7.0.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_19
-	bool "6.19.x or later"
+	bool "6.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
@@ -471,6 +479,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.81"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.22"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19.12"	if BR2_KERNEL_HEADERS_6_19
+	default "7.0"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 51c5ae6f96..910cd103dc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -676,6 +676,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -689,6 +693,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 01c2371e15..9ca024f5b8 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
+	bool "7.0.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_19
-	bool "6.19.x or later"
+	bool "6.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_18
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
