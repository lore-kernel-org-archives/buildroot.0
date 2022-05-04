Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA93C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC344418FD;
	Wed,  4 May 2022 19:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqbNsPJHDTtY; Wed,  4 May 2022 19:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6978418AD;
	Wed,  4 May 2022 19:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5341C1148
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4917E40BB9
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcs5ZLYzgXMN for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:47:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BC1840488
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:47:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB4B985783; Wed,  4 May 2022 19:36:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 May 2022 21:39:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efdbd301b7f83c1cc629e7bcc80d1835911ee32a
X-Git-Newrev: 5cc46a07220091afb23228adf4bebb6dee39b64a
X-Patchwork-Hint: ignore
Message-Id: <20220504193655.CB4B985783@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 4.4.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cc46a07220091afb23228adf4bebb6dee39b64a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 4.4.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 7 -------
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6d2c82ab7f..806e995bd1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_KERNEL_HEADERS_4_4
+	bool "kernel headers version 4.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32.x has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 077bc4d4d7..7a3308546f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,7 +4,6 @@ sha256  18bf091a2157faa8d92a1aba2ecb66b5124bb0e033fc7797343984e069a2c026  linux-
 sha256  82516a02bb52456f6e8057217dde6e02b78003b1e058117557c2ae9661696dfc  linux-5.10.113.tar.xz
 sha256  288ca85fcdad18e950ccbe3d640594ee36d5aac226321ed935076fadb0cc0a3a  linux-5.4.191.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
 sha256  fa2fb1fb5ba2e6ed99603063474804bd5fddeb8a5ad769d47786f82109e5c627  linux-4.9.312.tar.xz
 sha256  e3dcacc2459c91586ae94121f54eb54a7cae9c424766fe20498169f682fd1b15  linux-4.14.277.tar.xz
 sha256  4c6269d3c14e593151b035a55227110e632642d848032ef6992135c18488fe13  linux-4.19.241.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 229c5a0ca8..b030996dff 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -27,12 +27,6 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on BR2_LINUX_KERNEL
 	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
-config BR2_KERNEL_HEADERS_4_4
-	bool "Linux 4.4.x kernel headers"
-	depends on !BR2_riscv
-	depends on !BR2_csky
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	depends on !BR2_riscv
@@ -381,7 +375,6 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.312"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.277"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.241"	if BR2_KERNEL_HEADERS_4_19
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
