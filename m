Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9211C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 18:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6081B414C1;
	Tue, 11 Jan 2022 18:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mh_PwUjo7Lss; Tue, 11 Jan 2022 18:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC5B4149F;
	Tue, 11 Jan 2022 18:30:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B751BF365
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 18:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52AD6405B6
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 18:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7LYDLWtmQYN for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 18:30:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E30401DD
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 18:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DE1A282A06; Tue, 11 Jan 2022 18:23:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 19:28:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f51be73f25bdc9b370db42996475136098ebd251
X-Git-Newrev: 27eb296a202b6559e8b6d363effb36af4319cb9f
X-Patchwork-Hint: ignore
Message-Id: <20220111182359.DE1A282A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.14.x headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=27eb296a202b6559e8b6d363effb36af4319cb9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.14.x series is now EOL, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: actualyl drop it from the choice list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d36eac3302..b3e8d5a6d8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_KERNEL_HEADERS_5_14
+	bool "kernel headers version 5.14.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.14.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
 	bool "python-backports-functools-lru-cache package removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 86dc8d7af9..c40c26c1b2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb  linux-5.16.tar.xz
 sha256  b3e9ba06a299a3e2ead4a15753bc46a3e0c90d3b92ffeed1034ccc9f13a717f0  linux-5.15.6.tar.xz
-sha256  f41a259cb2002dd2e3286524b2bb4e803f4f982992d092706ecea613584023b3  linux-5.14.21.tar.xz
 sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
 sha256  6246fe1776d83039d71f74eb839f38ebdec23e1b37a7bf76f3bce13cbf0290be  linux-5.4.163.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8ee86e09af..bf306faf92 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -58,10 +58,6 @@ config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
-config BR2_KERNEL_HEADERS_5_14
-	bool "Linux 5.14.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
-
 config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -388,7 +384,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.219"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.163"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
-	default "5.14.21"	if BR2_KERNEL_HEADERS_5_14
 	default "5.15.6"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16"		if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
