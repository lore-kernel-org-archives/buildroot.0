Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FFEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 14:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C03A40904;
	Fri, 13 May 2022 14:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y773jZMMLvGW; Fri, 13 May 2022 14:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 379E8408AF;
	Fri, 13 May 2022 14:42:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBAA1BF31A
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 14:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A142408A3
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 14:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0_NmHVWUCj9 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 14:42:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E224940332
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:42:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5F5EFF804;
 Fri, 13 May 2022 14:42:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1npWUi-00Au89-P4; Fri, 13 May 2022 16:42:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 16:42:11 +0200
Message-Id: <20220513144215.2598981-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x series
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c37b4cd422..24655a2962 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.37" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.39" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7a3308546f..e6ac7af19d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  18bf091a2157faa8d92a1aba2ecb66b5124bb0e033fc7797343984e069a2c026  linux-5.15.37.tar.xz
-sha256  82516a02bb52456f6e8057217dde6e02b78003b1e058117557c2ae9661696dfc  linux-5.10.113.tar.xz
-sha256  288ca85fcdad18e950ccbe3d640594ee36d5aac226321ed935076fadb0cc0a3a  linux-5.4.191.tar.xz
+sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
+sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
+sha256  0d16d343956d311e3f4ab3f032fd626d8e6b67c0db94edd32f561407d374f2a0  linux-5.4.193.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  fa2fb1fb5ba2e6ed99603063474804bd5fddeb8a5ad769d47786f82109e5c627  linux-4.9.312.tar.xz
-sha256  e3dcacc2459c91586ae94121f54eb54a7cae9c424766fe20498169f682fd1b15  linux-4.14.277.tar.xz
-sha256  4c6269d3c14e593151b035a55227110e632642d848032ef6992135c18488fe13  linux-4.19.241.tar.xz
+sha256  e03b777861fae559cb7ed635500cde305bc2ca34dee4dc2fe806de0060c87bdc  linux-4.9.313.tar.xz
+sha256  3cd6d4eeb3a5d1c906b35c08f0d602f329410c291233bee1a7a2b168c7378bbe  linux-4.14.278.tar.xz
+sha256  59bcfd094ec26b03ca506199224cff53c13325e62d22bd4e31ef4ccafe7265a2  linux-4.19.242.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
 sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b030996dff..36af5d0a20 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -375,12 +375,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.312"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.277"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.241"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.191"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.113"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.37"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.313"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.278"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.242"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
