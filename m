Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196F7E82CC6
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF5942C63;
	Wed, 27 Sep 2023 19:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF5942C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzr5CB1KJ5Zz; Wed, 27 Sep 2023 19:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC0A942C79;
	Wed, 27 Sep 2023 19:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC0A942C79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 857051BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A68660D4F
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A68660D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmJpRAzzUGYV for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:08:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A6A3610B0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A6A3610B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7798C8269F; Wed, 27 Sep 2023 19:08:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:06:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5ba9f80ad99980a290905a57a447148c097a7b1
X-Git-Newrev: 2a711479d38e1862a754159c76307bbad3e92fb8
X-Patchwork-Hint: ignore
Message-Id: <20230927190849.7798C8269F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.4.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a711479d38e1862a754159c76307bbad3e92fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.4.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index daf83dda4a..ca80279212 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_KERNEL_HEADERS_6_4
+	bool "kernel headers version 6.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
 	bool "google-material-design-icons removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 858e615a12..bdd27eb600 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  8cf10379f7df8ea731e09bff3d0827414e4b643dd41dc99d0af339669646ef95  linux-6.5.5.tar.xz
-sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
 sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ee4e953bf0..d1023a15e6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
-config BR2_KERNEL_HEADERS_6_4
-	bool "Linux 6.4.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
-
 config BR2_KERNEL_HEADERS_6_5
 	bool "Linux 6.5.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
@@ -414,7 +410,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default "6.5.5"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
