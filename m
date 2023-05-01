Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F7EC77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 06:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CA26073E;
	Mon,  1 May 2023 06:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36CA26073E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJraoEAAxBsX; Mon,  1 May 2023 06:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73073606A9;
	Mon,  1 May 2023 06:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73073606A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0699D1BF429
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 06:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1C9540900
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 06:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C9540900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AN8PqbOxSctl for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 06:47:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3594015A
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E3594015A
 for <buildroot@buildroot.org>; Mon,  1 May 2023 06:47:46 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout08.t-online.de (Postfix) with SMTP id 86E39D358
 for <buildroot@buildroot.org>; Mon,  1 May 2023 08:47:42 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1ptNJv-2J61wn0; Mon, 1 May 2023 08:47:35 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:47922)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ptNJu-0004Og-3B
 for buildroot@buildroot.org; Mon, 01 May 2023 08:47:35 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon,  1 May 2023 08:47:34 +0200
Message-Id: <20230501064734.16030-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682923655-3C8ABC0E-0345B625/0/0 CLEAN NORMAL
X-TOI-MSGID: de4cfc70-cffc-4bdb-97a6-45cf406e48ec
Subject: [Buildroot] [PATCH 1/1] linux: bump _KERNEL_LATEST_VERSION to 6.3
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 690ee9c339..f6b50a4b58 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.26" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
