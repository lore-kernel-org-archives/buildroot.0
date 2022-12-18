Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5360EC10F1E
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E798160B2E;
	Sun, 18 Dec 2022 11:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E798160B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itgFbMvHx0bq; Sun, 18 Dec 2022 11:22:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DC160B4C;
	Sun, 18 Dec 2022 11:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36DC160B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 443411BF2A2
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 11:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2235E817A5
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 11:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2235E817A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWrkYt3Dtxpp for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 11:22:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA398177A
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFA398177A
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 11:22:02 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout12.t-online.de (Postfix) with SMTP id 29EA417440;
 Sun, 18 Dec 2022 12:22:00 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p6rjz-36Rl8j0; Sun, 18 Dec 2022 12:21:59 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36510)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p6rjz-0007Ig-03;
 Sun, 18 Dec 2022 12:21:59 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 12:21:57 +0100
Message-Id: <20221218112158.18021-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221218112158.18021-1-bernd.kuhls@t-online.de>
References: <20221218112158.18021-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671362519-F9452742-1A7422FC/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c096a70-6d3e-4f47-bee4-5d1f66258e87
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.1 headers
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/linux.hash                                    |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9684dc5697..c7bbb6be99 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb  linux-6.1.tar.xz
 sha256  08d3118d6b755769f166de6babed54964393a7c0928029bef11bf55559a72da4  linux-6.0.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  40590843c04c85789105157f69efbd71a4efe87ae2568e40d1b7258c3f747ff3  linux-5.15.83.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 93f443b78f..cd36c7c763 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_0
+	default BR2_KERNEL_HEADERS_6_1
 	help
 	  Select the kernel version to get headers from.
 
@@ -56,6 +56,10 @@ config BR2_KERNEL_HEADERS_5_15
 config BR2_KERNEL_HEADERS_6_0
 	bool "Linux 6.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+
+config BR2_KERNEL_HEADERS_6_1
+	bool "Linux 6.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1
+	bool "6.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0
-	bool "6.0.x or later"
+	bool "6.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19
@@ -395,6 +403,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.159"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.83"	if BR2_KERNEL_HEADERS_5_15
 	default "6.0.13"	if BR2_KERNEL_HEADERS_6_0
+	default "6.1"		if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4947ab3aae..544b423001 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -591,6 +591,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -604,6 +608,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	default "6.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	default "5.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
 	default "5.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a9cb61365f..1c39334ddd 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_1
+	bool "6.1.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_0
-	bool "6.0.x or later"
+	bool "6.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_19
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
