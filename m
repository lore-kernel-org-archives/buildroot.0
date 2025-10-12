Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF05CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB343605F4;
	Sun, 12 Oct 2025 21:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8WdCcTl3oCp; Sun, 12 Oct 2025 21:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 793D7605E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793D7605E0;
	Sun, 12 Oct 2025 21:13:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F8B012B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E65605CE
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3S4zeaLl1XSJ for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 21:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F4EA605E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F4EA605E0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:13:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 504D986F47; Sun, 12 Oct 2025 21:13:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:53:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fec2d492a431f557817ba4ba8ee9244fdcc11370
X-Git-Newrev: 3fef7cbb6d9212d3702213ade1e09629ad7d8e1c
X-Patchwork-Hint: ignore
Message-Id: <20251012211311.504D986F47@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.16.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fef7cbb6d9212d3702213ade1e09629ad7d8e1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.16.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3548646f61..f3558c0f3a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_KERNEL_HEADERS_6_16
+	bool "kernel headers version 6.16.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.16.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_MURATA_CYW_FW_CYW4339_1CK
 	bool "This firmware has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 5b56aebb58..de40c6b7b6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  fdebcb065065f5c1b8dc68a6fb59cda50cdddbf9103d207c2196d55ea764f57f  linux-6.17.2.tar.xz
-sha256  7ca4debc5ca912ebb8a76944a5c118afd5d09e31ef43c494adb14273da29a26e  linux-6.16.12.tar.xz
 sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
 sha256  04c470e130d659ef05217ac695422c28d817d19daa50643fe28b945e6ab646c7  linux-6.6.111.tar.xz
 sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e7ba0cac24..75de52e94a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -54,10 +54,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_16
-	bool "Linux 6.16.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
-
 config BR2_KERNEL_HEADERS_6_17
 	bool "Linux 6.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
@@ -468,7 +464,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.155"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.111"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.52"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.12"	if BR2_KERNEL_HEADERS_6_16
 	default "6.17.2"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
