Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A3BECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 16:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A831A415A1;
	Fri,  9 Sep 2022 16:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A831A415A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylb3EQNpROBz; Fri,  9 Sep 2022 16:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C219C4070F;
	Fri,  9 Sep 2022 16:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C219C4070F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 598141BF294
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 16:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A1C60615
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 16:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A1C60615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxkD0sCLxpbY for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 16:19:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BCF9605B5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BCF9605B5
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 16:19:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12D2C240004;
 Fri,  9 Sep 2022 16:19:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oWgj1-00HaBz-S6; Fri, 09 Sep 2022 18:19:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  9 Sep 2022 18:19:26 +0200
Message-Id: <20220909161927.4190652-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
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
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9c39e15332..a1b7984489 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
-sha256  c6a1d38c6fa3798341372d5cf0088ae806ccdc827e31ecbff8988e097ba5de50  linux-5.15.64.tar.xz
-sha256  a4dfd8bddb94bd35e42002d85f04b51dcfe862228e5a975f12bd59c456ab6803  linux-5.10.140.tar.xz
-sha256  bfb43241b72cd55797af68bea1cebe630d37664c0f9a99b6e9263a63a67e2dec  linux-5.4.211.tar.xz
+sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz
+sha256  3f47ebdb9afe152a0c32c1157336ef13fa5cc08ac6d884dfc1f6ddc2b7dba268  linux-5.10.142.tar.xz
+sha256  09c72e3dd85df773eb52e53e25c556d132958bd775b0ed6985a6b1ac21c9cfc2  linux-5.4.212.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  2bf3c2ddc76f9754112e990b27241282a564a41615fd8cb7964b9569911a887b  linux-4.9.326.tar.xz
-sha256  ec93b115e4748e4eead83656486f11e35b515cf5fa19d6d01be3d81f10350796  linux-4.14.291.tar.xz
-sha256  67de95c6080b5730bf14227478cfc3e4db807941d8a881d9824c25059b3ff549  linux-4.19.256.tar.xz
+sha256  2283c1af5373c43e79adca6987174d932989a8b2551405e83e2e39ebe31e06d2  linux-4.9.327.tar.xz
+sha256  70f4df21901a654632ebbb533884ccaf117a29b14e6f2b672f0c36613c3e897d  linux-4.14.292.tar.xz
+sha256  eadd13aa70f37cdf50eef45c5964bd7146d353b61a1fd026d4fa0b2a68a3ea47  linux-4.19.257.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd04f87928..ab59bdd368 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -376,12 +376,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.326"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.291"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.256"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.211"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.140"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.64"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.327"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.292"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.257"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.212"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.142"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
 	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
