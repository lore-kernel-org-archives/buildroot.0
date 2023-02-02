Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9864C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 21:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1748560B50;
	Thu,  2 Feb 2023 21:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1748560B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlAZ732f2A5e; Thu,  2 Feb 2023 21:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D459A611FE;
	Thu,  2 Feb 2023 21:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D459A611FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB501BF271
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 21:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9DB641D37
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 21:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DB641D37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47D4u1ZWaTg6 for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 21:04:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29AF641C91
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29AF641C91
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 21:04:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77BC6FF804;
 Thu,  2 Feb 2023 21:04:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pNgl0-00Ca1P-8C; Thu, 02 Feb 2023 22:04:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 22:04:32 +0100
Message-Id: <20230202210432.2998354-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{14, 19}.x / 5.{4,
 10, 15}.x / 6.1.x series
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

4.9.x / 6.0.x is now EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e18b515311..a0e9286bd3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 157f267a9d..927172e8fa 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  bc7f6d9a8a8bbe9a723e82346bba94b58d926f78bfba106b21e041e0290076fc  linux-6.1.5.tar.xz
+sha256  d60cf185693c386e7acd9f3eb3a94ae30ffbfee0a9447a20e83711e0bdf5922b  linux-6.1.9.tar.xz
 sha256  abe37eb0e2e331bdc7c4110115664e180e7d43b7336de6b4cd2bd1b123d30207  linux-6.0.19.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e7359bd2935b54fe8bb821cf748591c36a95bed019e752d3e4d5803d9da1ccb4  linux-5.15.87.tar.xz
-sha256  2ec400fc50ffdfe4c836a3c02bf6e7aebcd7963dd2ac1425e6d41545c37dd217  linux-5.10.162.tar.xz
-sha256  80253b2cac54c256dfdfd1061800aef907f88432090f7aef74c0ddf50f6e6524  linux-5.4.228.tar.xz
+sha256  a63c2bb1beb15f1aea9c63cf80559f5b7ab58afd2da2fa5e7670c515ebe1fe80  linux-5.15.91.tar.xz
+sha256  0051a1780e5bda0efc68dafab7c728b8283d2b028fedb439418f478be7d3e1af  linux-5.10.166.tar.xz
+sha256  a74fd32ccc1025b72f3ba7183208761f7c6190fb96e8f484f6d543a5a183e62f  linux-5.4.230.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  e32a230d71072a4ee50bd4386aa23ca4e617b8ad07b6f9fb223b65bf004c4c80  linux-4.14.302.tar.xz
-sha256  6e0ba5d224ab216b7b938cc9ff2478be7882a884bbdf15374149bade4d58b20a  linux-4.19.269.tar.xz
+sha256  64cbb234e46c196bc12bde74b233c7d3cb3b68d9c8ed48bf06715bd0f5c549d5  linux-4.14.304.tar.xz
+sha256  636d3f9cb48eaf06df14e56bd9d57bfc7c1b5952a75b9f841d41a43b75829d1a  linux-4.19.271.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1ad9fffcd3..3a5207e0b6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -397,13 +397,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.302"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.228"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.162"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.87"	if BR2_KERNEL_HEADERS_5_15
+	default "4.14.304"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.271"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.230"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.166"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.91"	if BR2_KERNEL_HEADERS_5_15
 	default "6.0.19"	if BR2_KERNEL_HEADERS_6_0
-	default "6.1.5"		if BR2_KERNEL_HEADERS_6_1
+	default "6.1.9"		if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
