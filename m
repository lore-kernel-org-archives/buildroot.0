Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4114CCD183
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5796E83E4B;
	Wed,  1 Oct 2025 16:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCVQIHXwR9uQ; Wed,  1 Oct 2025 16:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0DCF83E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DCF83E4E;
	Wed,  1 Oct 2025 16:43:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6173E26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB6E061375
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpC_o4MT1wJN for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2AA613A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE2AA613A4
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:43:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE10F866C4; Wed,  1 Oct 2025 16:43:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Oct 2025 18:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 507653a74a0f9c1f7cb0ad0ecba5958f376f0ab5
X-Git-Newrev: 76d25d365bc12c34d01703f1f9a45a0e02454466
X-Patchwork-Hint: ignore
Message-Id: <20251001164334.DE10F866C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.17 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=76d25d365bc12c34d01703f1f9a45a0e02454466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.17 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3e0dff74ee..d17675f20e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7  linux-6.17.tar.xz
 sha256  7ac8c8a3cf05476375deaaa85dfcee095a826ffe557b437f43774fc3b64ce58d  linux-6.16.9.tar.xz
 sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
 sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 05e1c7ae90..0593c13282 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_16
+	default BR2_KERNEL_HEADERS_6_17
 	help
 	  Select the kernel version to get headers from.
 
@@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_16
 	bool "Linux 6.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
+config BR2_KERNEL_HEADERS_6_17
+	bool "Linux 6.17.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -135,8 +139,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_17
+	bool "6.17.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16
-	bool "6.16.x or later"
+	bool "6.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15
@@ -461,6 +469,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
 	default "6.16.9"	if BR2_KERNEL_HEADERS_6_16
+	default "6.17"		if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 30ccbcee7a..5fcc9362ba 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -671,6 +671,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -684,6 +688,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
 	default "6.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index bc34701455..9855b33ade 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_17
+	bool "6.17.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_16
-	bool "6.16.x or later"
+	bool "6.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_15
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
