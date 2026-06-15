Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC66CD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD40F41B9C;
	Mon, 15 Jun 2026 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tn37kBib6QnB; Mon, 15 Jun 2026 21:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C589E41B8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781559098;
	bh=QvsY6XM8+aYtQBYoyPFyX9nZxW2vjirJ49CZQvUFc9c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H+KId4EYKwaqxY+WYq47UR0vzPKyIMXkkV3pSDHVn+YBxcf+PDkSkFdZNZ9nNOYXd
	 9BAwM1xLcrC4LjqD9NDVMYudvwmc3Sxai2M3XWiRDNQAaeeFbKlA0nVuTDVFVq7CkS
	 gDI8g4PPfVmvv+l5P6SxW7rIi9xdgCCQ1DUhhkXNx8YLWe9ie1xCrSczEqBgYz0V01
	 S2aSty+aRNE79QbuA7MUKjznYABDZi4yrzIgDagbCMy2t46X0NCPA2B4e0jiXiAPUf
	 3AEi2QmOk/oOD9qkCcWeKL+8H9Dwex0jByxuxv4rN125iBqGuleQpce0hBfRuJC+hF
	 rOpKrkadFvhLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C589E41B8F;
	Mon, 15 Jun 2026 21:31:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDEC3169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B03138466E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKH0WoulGrlz for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF77B8466D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF77B8466D
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 181F77FF65; Mon, 15 Jun 2026 21:31:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 23:17:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ee8e9f12a461c01ca6e26adc2293aae05cdd39e
X-Git-Newrev: 9530d74ddb04d5fc81f9054ec0e76fbcb2a1e7d2
X-Patchwork-Hint: ignore
Message-Id: <20260615213115.181F77FF65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 7.1 headers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9530d74ddb04d5fc81f9054ec0e76fbcb2a1e7d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/from-6.17/linux.hash                                  |  1 +
 package/linux-headers/7.1                                   |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 8274594ec2..9aa69b6e96 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  691f44797fbe790dc8a321604c927087526ad27b6d649925d60f8eed0a2564a0  linux-7.1.tar.xz
 sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.1 b/package/linux-headers/7.1
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.1
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3e3832b707..0b02c183c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_0
+	default BR2_KERNEL_HEADERS_7_1
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_0
 	bool "Linux 7.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
+config BR2_KERNEL_HEADERS_7_1
+	bool "Linux 7.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
+	bool "7.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
-	bool "7.0.x or later"
+	bool "7.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_19
@@ -475,6 +483,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
+	default "7.1"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5aa6cf8f6d..7762106bee 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -680,6 +680,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -693,6 +697,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index f69e09ecf0..003887f025 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
+	bool "7.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
-	bool "7.0.x or later"
+	bool "7.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_19
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
