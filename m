Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2621CC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 18:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2833842FB;
	Fri, 28 Apr 2023 18:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2833842FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLRPoflEAti7; Fri, 28 Apr 2023 18:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF9BD842F2;
	Fri, 28 Apr 2023 18:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF9BD842F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594B41BF578
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 18:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FAB1842F2
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 18:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAB1842F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u40KK0hoXyRA for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 18:09:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1259F81E37
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1259F81E37
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 18:09:05 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout10.t-online.de (Postfix) with SMTP id 67E9C43D66;
 Fri, 28 Apr 2023 20:07:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psSVY-1p6bEf0; Fri, 28 Apr 2023 20:07:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:32816)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psSVY-0002Lr-0v;
 Fri, 28 Apr 2023 20:07:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 20:07:47 +0200
Message-Id: <20230428180748.518827-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230428180748.518827-1-bernd.kuhls@t-online.de>
References: <20230428180748.518827-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682705268-0AFFAC01-8914A4B7/0/0 CLEAN NORMAL
X-TOI-MSGID: a73d5be8-fcb9-4585-a44e-4ad2bb0bd6f4
Subject: [Buildroot] [PATCH 2/3] {toolchain,
 linux-headers}: add support for 6.2 headers
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 43c9314a23..cab7b30385 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c7dded14e368834b18bb2ad64af65560d8bcb9d2d6597e0f6ef151fded01e577  linux-6.2.13.tar.xz
 sha256  dfdcc143a879d64a5ee99213b2b4b05b5dccd566c144df93bca1e204df64c110  linux-6.1.26.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  066c4bbcbe3c480068a2e302f52b1708f340ecaaf633ec43d7f791bbeac5771a  linux-5.15.109.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e102369395..cb614d0eef 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_1
+	default BR2_KERNEL_HEADERS_6_2
 	help
 	  Select the kernel version to get headers from.
 
@@ -48,6 +48,10 @@ config BR2_KERNEL_HEADERS_5_15
 config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
+
+config BR2_KERNEL_HEADERS_6_2
+	bool "Linux 6.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -125,8 +129,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2
+	bool "6.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1
-	bool "6.1.x or later"
+	bool "6.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0
@@ -390,6 +398,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.109"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.26"	if BR2_KERNEL_HEADERS_6_1
+	default "6.2.13"	if BR2_KERNEL_HEADERS_6_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 08e4ccad9e..80b2dbde4d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -600,6 +600,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -613,6 +617,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.2"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
 	default "6.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 	default "6.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0
 	default "5.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1c39334ddd..8f3905b8d7 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_2
+	bool "6.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_1
-	bool "6.1.x or later"
+	bool "6.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
