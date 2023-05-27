Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB1C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 09:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7732360F56;
	Sat, 27 May 2023 09:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7732360F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOR_su__8Kpd; Sat, 27 May 2023 09:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15C560FC7;
	Sat, 27 May 2023 09:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15C560FC7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 674351BF34B
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41B9240134
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B9240134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSHPuDI1Pefb for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 09:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7257D40105
 for <buildroot@buildroot.org>; Sat, 27 May 2023 09:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7257D40105
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 611AE8632D; Sat, 27 May 2023 09:55:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 11:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c27bf8881d94b3973b5bf00f414321a6ee7db819
X-Git-Newrev: 4030a7eb59fa7d12fe31ef56fe0479f2c5f8d3f7
X-Patchwork-Hint: ignore
Message-Id: <20230527095536.611AE8632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.2.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=4030a7eb59fa7d12fe31ef56fe0479f2c5f8d3f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.2.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index debe8428a5..ac2e302a6b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_KERNEL_HEADERS_6_2
+	bool "kernel headers version 6.2.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.2.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_ATK
 	bool "atk removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 5b860d4aa1..b8ec77e232 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  d8627528ed6b3ae607d00b1ef5a46e0e7051ae40b285fd4e82f4ff0bb72b68e8  linux-6.3.4.tar.xz
-sha256  06ff0d780a6934b46140f6d8c1a15792c78aa337d8b2411bf90747371d358713  linux-6.2.16.tar.xz
 sha256  1bf254c4ca9ebccb25328296584fb5e87ad635ae0c1cc1deb0b5bb37a4608813  linux-6.1.30.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  4a4e98d21149d781867a6d44855f708b02f03cfe233d8026a0af9c9841b3b9ca  linux-5.15.113.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ba7cf49455..4a2e1e154d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
-config BR2_KERNEL_HEADERS_6_2
-	bool "Linux 6.2.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
-
 config BR2_KERNEL_HEADERS_6_3
 	bool "Linux 6.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
@@ -406,7 +402,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.180"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.113"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.30"	if BR2_KERNEL_HEADERS_6_1
-	default "6.2.16"	if BR2_KERNEL_HEADERS_6_2
 	default "6.3.4"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
