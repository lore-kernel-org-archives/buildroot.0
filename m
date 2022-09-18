Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0411C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68436843A6;
	Sun, 18 Sep 2022 09:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68436843A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zd30gVDcOXIN; Sun, 18 Sep 2022 09:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 954568414A;
	Sun, 18 Sep 2022 09:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 954568414A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08FD11BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F3F8414A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6F3F8414A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nv6WoKmUjAKG for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:40:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B008427D
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B008427D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8FC284CA5; Sun, 18 Sep 2022 09:40:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:38:15 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a534ba5573fb5a29ea3fccbb895600d84082032d
X-Git-Newrev: 56549362e41a86638d889798f5bbcb34e3e726e9
X-Patchwork-Hint: ignore
Message-Id: <20220918094030.D8FC284CA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{4, 10, 15}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=56549362e41a86638d889798f5bbcb34e3e726e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 49f661e5484cf5965564f78511d5201a45bb0d24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a36bde2945..4be34dd7eb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.64" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.67" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 28425024f2..4d87543bbb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  c6a1d38c6fa3798341372d5cf0088ae806ccdc827e31ecbff8988e097ba5de50  linux-5.15.64.tar.xz
-sha256  a4dfd8bddb94bd35e42002d85f04b51dcfe862228e5a975f12bd59c456ab6803  linux-5.10.140.tar.xz
-sha256  bfb43241b72cd55797af68bea1cebe630d37664c0f9a99b6e9263a63a67e2dec  linux-5.4.211.tar.xz
+sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz
+sha256  3f47ebdb9afe152a0c32c1157336ef13fa5cc08ac6d884dfc1f6ddc2b7dba268  linux-5.10.142.tar.xz
+sha256  09c72e3dd85df773eb52e53e25c556d132958bd775b0ed6985a6b1ac21c9cfc2  linux-5.4.212.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
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
index 290815c641..c256e3bca1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -382,12 +382,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
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
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
