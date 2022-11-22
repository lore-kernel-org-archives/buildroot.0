Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A1DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F348409F8;
	Tue, 22 Nov 2022 21:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F348409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3IYPEh01Yta; Tue, 22 Nov 2022 21:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA41404C1;
	Tue, 22 Nov 2022 21:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA41404C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 420331BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 295BA4186A
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295BA4186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8d2RXiiGqkKy for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:47:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D69841874
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D69841874
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:47:25 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 00710D51C1
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:30:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09306100002;
 Tue, 22 Nov 2022 21:30:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oxaqt-001STx-RD; Tue, 22 Nov 2022 22:30:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:30:46 +0100
Message-Id: <20221122213046.347766-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
