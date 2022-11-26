Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD68C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAC981E3A;
	Sat, 26 Nov 2022 18:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAC981E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1v8SJYwT3tS; Sat, 26 Nov 2022 18:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28EA281E1E;
	Sat, 26 Nov 2022 18:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EA281E1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C83521BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A425F60E39
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A425F60E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhpgpdARfjqV for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:42:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD72D60E34
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD72D60E34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAA2284755; Sat, 26 Nov 2022 18:42:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:39:48 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2ea2c4b5f2635d459acacfce0068016010e334a6
X-Git-Newrev: 2f57c2695800090a9abbf68442e344dfda91df38
X-Patchwork-Hint: ignore
Message-Id: <20221126184255.AAA2284755@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{4, 10, 15, 19}.x / 6.0.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f57c2695800090a9abbf68442e344dfda91df38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f157a1136220ff0ad88766ebfb9d1ca9b4f59cc2)
[Peter: drop 5.19.x / 6.0.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 733f57c4a4..219aceb07d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.73" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.79" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ec28403f36..421de24541 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  a822f09525ae8803453939a91e73f18097a3ba2aec73be4fe9ab314a0131715d  linux-5.15.73.tar.xz
-sha256  85253abf097eb5013b988a400eb022eed0e0626e7e0a7daa3ab4b6bcabbced9a  linux-5.10.147.tar.xz
-sha256  2bb826cdf9b2cfce385fb5d51fc8070fe428e467bd3df4ae2a7eb6f0c0cc2e63  linux-5.4.217.tar.xz
+sha256  cba39031dbc0eed0785b8afdc8c58cf23df83e47001b2354fa44486ae699c154  linux-5.15.79.tar.xz
+sha256  f1b027526c58e7bd127f35b17736e4a6c865866b9048898f05c5358d4d52d4f3  linux-5.10.155.tar.xz
+sha256  8b7df25b5560620eb2776d7b7c67569764b3916ff2f596767f72567b38d13d36  linux-5.4.224.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  bf021936a450e9292e10cc7db9909cd0d336406191d22aadd22bdcc51ca2595f  linux-4.9.330.tar.xz
-sha256  62ccb9ba94a7da5115bc923eebf8dffee9229801da02be87d90ae68ab9a76a6b  linux-4.14.295.tar.xz
-sha256  bec33298bd0470b5e725c7dc29a2dd4daf02065cb01cd4a54f6adee6ff582cb2  linux-4.19.261.tar.xz
+sha256  41bf80c4766ba9915470afe97ead6a16faff484b94590387012ce7f9ce41502b  linux-4.9.333.tar.xz
+sha256  26233603ae992cd31e9f78066d54475b3e3f878ab0e3fd271e74a795ab60b15c  linux-4.14.299.tar.xz
+sha256  37406ead61149283973bccdf670a1fd020c2f19722b7176e88ec8567df6dacd0  linux-4.19.265.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dc5eeeb38b..f97656e60f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -382,12 +382,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.330"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.295"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.261"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.217"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.147"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.73"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.333"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.299"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.265"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.224"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.155"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.79"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
