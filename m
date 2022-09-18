Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF88C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F31540A8B;
	Sun, 18 Sep 2022 09:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F31540A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvBmSZeW3bOT; Sun, 18 Sep 2022 09:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63EB540B08;
	Sun, 18 Sep 2022 09:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63EB540B08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8821BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD7E843E7
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDD7E843E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJ02ubvlzcF1 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 034D7813F0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 034D7813F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B3484BC1; Sun, 18 Sep 2022 09:35:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:45:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 57f2aeb98a23c666d3c3942fbe98509ac0ef5fe0
X-Git-Newrev: b0baf7df65ac85c659dd102dad5d9e3a533ae1ea
X-Patchwork-Hint: ignore
Message-Id: <20220918093505.E1B3484BC1@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0baf7df65ac85c659dd102dad5d9e3a533ae1ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

5.17.x is EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2bc9cac446e606c4fcb5a4c86fbe99e48a76eae5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d306365876..a36bde2945 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.53" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.64" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 1c1f541c4c..28425024f2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  f3aa717243051f3fcca90ebfe26fe5c3a596c2f6047846e8d1724ea90df77b07  linux-5.15.53.tar.xz
-sha256  aae72f052b80858f77d40009faf9ccf09c38c8b33f56346d16c05f7e6a429cfe  linux-5.10.129.tar.xz
-sha256  fdc1b10a19d85b37eb0957ddd81acec1d5484f36c496493d8cdad75278737a47  linux-5.4.204.tar.xz
+sha256  c6a1d38c6fa3798341372d5cf0088ae806ccdc827e31ecbff8988e097ba5de50  linux-5.15.64.tar.xz
+sha256  a4dfd8bddb94bd35e42002d85f04b51dcfe862228e5a975f12bd59c456ab6803  linux-5.10.140.tar.xz
+sha256  bfb43241b72cd55797af68bea1cebe630d37664c0f9a99b6e9263a63a67e2dec  linux-5.4.211.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  621978d371b8f0a64e28e3b734af74d5a8d99b81298a99f336b17883e3a4e409  linux-4.9.322.tar.xz
-sha256  78b5494c205d9839b1905b2553c22596dee57c87586a8124186415c8b8f8f616  linux-4.14.287.tar.xz
-sha256  3787c8adccea6e35928dea855af0eb2e849966553505448972d6b3cf037acaf4  linux-4.19.251.tar.xz
+sha256  2bf3c2ddc76f9754112e990b27241282a564a41615fd8cb7964b9569911a887b  linux-4.9.326.tar.xz
+sha256  ec93b115e4748e4eead83656486f11e35b515cf5fa19d6d01be3d81f10350796  linux-4.14.291.tar.xz
+sha256  67de95c6080b5730bf14227478cfc3e4db807941d8a881d9824c25059b3ff549  linux-4.19.256.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1d5eaa5194..290815c641 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -382,12 +382,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.322"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.287"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.251"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.204"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.129"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.53"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.326"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.291"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.256"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.211"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.140"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.64"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
