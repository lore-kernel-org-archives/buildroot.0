Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED76C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 16:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7CA40721;
	Sat, 15 Jun 2024 16:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JdaBFvQQ0kw; Sat, 15 Jun 2024 16:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857CB4081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 857CB4081E;
	Sat, 15 Jun 2024 16:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8A81BF300
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 16:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB3D40721
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 16:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Afy4T3v1kk4P for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 16:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 148F640511
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148F640511
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 16:47:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00C3987E74; Sat, 15 Jun 2024 16:47:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 18:42:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa70c331a29d662a0da8115a36a7e0716f6f4983
X-Git-Newrev: 1b3ed2610d12bf928175bf46158b3433ca33f2de
X-Patchwork-Hint: ignore
Message-Id: <20240615164733.00C3987E74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.8.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b3ed2610d12bf928175bf46158b3433ca33f2de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.8.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                     | 9 ++++++++-
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f0bff5191f..c1d6fd646e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,14 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2024.05"
+comment "Legacy options removed in 2024.08"
+
+config BR2_KERNEL_HEADERS_6_8
+	bool "kernel headers version 6.8.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.8.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
 
 config BR2_TARGET_AT91BOOTSTRAP
 	bool "at91bootstrap removed"
diff --git a/linux/linux.hash b/linux/linux.hash
index ac7028c535..6ebd708bcb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  272800e0d1a7d01a78bce95a3aaf5c80816f50eb15c517d7003e58355760ecc2  linux-6.9.4.tar.xz
-sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
 sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
 sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2664a523e..7b7928549c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_8
-	bool "Linux 6.8.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
-
 config BR2_KERNEL_HEADERS_6_9
 	bool "Linux 6.9.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9
@@ -429,7 +425,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
-	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
 	default "6.9.4"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
