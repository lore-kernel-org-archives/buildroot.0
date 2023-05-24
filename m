Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E149C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 20:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982F642A3D;
	Wed, 24 May 2023 20:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 982F642A3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9kYSvu2XTRa; Wed, 24 May 2023 20:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01CED42A4F;
	Wed, 24 May 2023 20:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01CED42A4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 485F81BF2F8
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ECEB615FC
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECEB615FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9huFiRbxNHL for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 20:56:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD0D615F9
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDD0D615F9
 for <buildroot@buildroot.org>; Wed, 24 May 2023 20:56:37 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout07.t-online.de (Postfix) with SMTP id 5273B179B1
 for <buildroot@buildroot.org>; Wed, 24 May 2023 22:56:35 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q1vX4-2y6W930; Wed, 24 May 2023 22:56:30 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55022)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q1vX4-0008NQ-0j
 for buildroot@buildroot.org; Wed, 24 May 2023 22:56:30 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 22:56:29 +0200
Message-Id: <20230524205629.2934876-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524205629.2934876-1-bernd.kuhls@t-online.de>
References: <20230524205629.2934876-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684961790-18DBAE62-6970C023/0/0 CLEAN NORMAL
X-TOI-MSGID: ba8acbe4-ed42-44df-9ef4-f75c598c9c44
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.2.x option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 6.2.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1590343ca1..46aa0796a7 100644
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
 config BR2_GCC_VERSION_10_X
 	bool "gcc 10.x support removed"
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
