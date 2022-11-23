Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CFAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA85611A7;
	Wed, 23 Nov 2022 10:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA85611A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eE5L6u9bq-re; Wed, 23 Nov 2022 10:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5A46F9A1;
	Wed, 23 Nov 2022 10:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C5A46F9A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B20031BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F1D40C6B
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F1D40C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8gsOT5Wt5fC for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:04:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C348C40C18
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C348C40C18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFFDE841A0; Wed, 23 Nov 2022 10:04:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:01:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73f04f7f0cb5ab7b4df0f2e8c706d73e6d12b793
X-Git-Newrev: f157a1136220ff0ad88766ebfb9d1ca9b4f59cc2
X-Patchwork-Hint: ignore
Message-Id: <20221123100436.AFFDE841A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15, 19}.x / 6.0.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=f157a1136220ff0ad88766ebfb9d1ca9b4f59cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ee59761f33..3631fcb6d6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c4ee15c37b..0af02e1326 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8ede745a69351ea0f27fe0c48780d4efa37ff086135e129358ce09694957e8f9  linux-6.0.1.tar.xz
+sha256  6114a208e82739b4a1ab059ace35262be2a83be34cd1ae23cb8a09337db831c7  linux-6.0.9.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4686e33847db3ec58e1043bc0c806472aae694b2c413bb7d8da91a5c9a55eb1b  linux-5.19.15.tar.xz
-sha256  a822f09525ae8803453939a91e73f18097a3ba2aec73be4fe9ab314a0131715d  linux-5.15.73.tar.xz
-sha256  85253abf097eb5013b988a400eb022eed0e0626e7e0a7daa3ab4b6bcabbced9a  linux-5.10.147.tar.xz
-sha256  2bb826cdf9b2cfce385fb5d51fc8070fe428e467bd3df4ae2a7eb6f0c0cc2e63  linux-5.4.217.tar.xz
+sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
+sha256  cba39031dbc0eed0785b8afdc8c58cf23df83e47001b2354fa44486ae699c154  linux-5.15.79.tar.xz
+sha256  f1b027526c58e7bd127f35b17736e4a6c865866b9048898f05c5358d4d52d4f3  linux-5.10.155.tar.xz
+sha256  8b7df25b5560620eb2776d7b7c67569764b3916ff2f596767f72567b38d13d36  linux-5.4.224.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  bf021936a450e9292e10cc7db9909cd0d336406191d22aadd22bdcc51ca2595f  linux-4.9.330.tar.xz
-sha256  62ccb9ba94a7da5115bc923eebf8dffee9229801da02be87d90ae68ab9a76a6b  linux-4.14.295.tar.xz
-sha256  bec33298bd0470b5e725c7dc29a2dd4daf02065cb01cd4a54f6adee6ff582cb2  linux-4.19.261.tar.xz
+sha256  41bf80c4766ba9915470afe97ead6a16faff484b94590387012ce7f9ce41502b  linux-4.9.333.tar.xz
+sha256  26233603ae992cd31e9f78066d54475b3e3f878ab0e3fd271e74a795ab60b15c  linux-4.14.299.tar.xz
+sha256  37406ead61149283973bccdf670a1fd020c2f19722b7176e88ec8567df6dacd0  linux-4.19.265.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8679241a2c..f72e7f408c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -392,14 +392,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.330"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.295"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.261"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.217"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.147"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.73"	if BR2_KERNEL_HEADERS_5_15
-	default "5.19.15"	if BR2_KERNEL_HEADERS_5_19
-	default "6.0.1"		if BR2_KERNEL_HEADERS_6_0
+	default "4.9.333"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.299"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.265"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.224"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.155"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.79"	if BR2_KERNEL_HEADERS_5_15
+	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
+	default "6.0.9"		if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
