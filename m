Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E704C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC0881772;
	Sun, 11 Dec 2022 08:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC0881772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8l3DjL14AKho; Sun, 11 Dec 2022 08:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB4C08176E;
	Sun, 11 Dec 2022 08:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB4C08176E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85E3A1BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D72540886
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D72540886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vnz-hI-Sbeii for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E174087A
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4E174087A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:15:17 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout09.t-online.de (Postfix) with SMTP id 03CA13F2C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:15:15 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4HUQ-00nlqr0; Sun, 11 Dec 2022 09:15:14 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37350)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4HUQ-0002nq-1B
 for buildroot@buildroot.org; Sun, 11 Dec 2022 09:15:14 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:15:14 +0100
Message-Id: <20221211081514.3138057-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211081514.3138057-1-bernd.kuhls@t-online.de>
References: <20221211081514.3138057-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670746514-F3FEE417-8187293D/0/0 CLEAN NORMAL
X-TOI-MSGID: 52d3adcc-6c1e-42f8-8912-e0b892ba6d50
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: drop 5.19.x option
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

The 5.19.x series is now EOL upstream, so drop the linux-headers option and
add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9602a49e3b..cb0176a31c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_KERNEL_HEADERS_5_19
+	bool "kernel headers version 5.19.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.19.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	bool "xf86-video-tga removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 8739da4f75..9976a44489 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  89b730edf8942b49e02f9894244205886c9a214d629b35b88c4ff06ee9304f01  linux-6.0.12.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
 sha256  fceef6bb79bac494663ccde34453521fc616cd94272fd30564752b3742381b65  linux-5.15.82.tar.xz
 sha256  1e0a24bb5510caa18b3601b25e12cc2a1ce123948de551f4f2cdbb40aea707e7  linux-5.10.158.tar.xz
 sha256  0c1f552a1d2f63b3ecd4d33189f0003bc91fb8ff79967a7e295d015c280c9a44  linux-5.4.226.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 24f51418e6..4c8b1fca27 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -53,10 +53,6 @@ config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
-config BR2_KERNEL_HEADERS_5_19
-	bool "Linux 5.19.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
-
 config BR2_KERNEL_HEADERS_6_0
 	bool "Linux 6.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
@@ -398,7 +394,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.226"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.158"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.82"	if BR2_KERNEL_HEADERS_5_15
-	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
 	default "6.0.12"	if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
