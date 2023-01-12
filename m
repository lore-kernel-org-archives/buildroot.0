Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8D1C61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 17:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5707F60D57;
	Thu, 12 Jan 2023 17:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5707F60D57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZSMxvxyJbz6; Thu, 12 Jan 2023 17:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903B660D4D;
	Thu, 12 Jan 2023 17:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903B660D4D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 307F21BF35C
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 17:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BA3C4036F
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 17:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BA3C4036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6k2CVtZt3Fq4 for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 17:57:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D6DE400CE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D6DE400CE
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 17:57:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 454AF60003;
 Thu, 12 Jan 2023 17:57:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pG1pX-0032aZ-5m; Thu, 12 Jan 2023 18:57:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 18:57:33 +0100
Message-Id: <20230112175734.724878-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.9.x / 5.{10,
 15}.x / 6.{0, 1}.x series
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
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bca1b3fc8b..e18b515311 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8ac04b60f9..157f267a9d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ee41f3c4f599b2f46f08aae428c9243db403e7292eb2c9f04ee34909b038d1ae  linux-6.1.2.tar.xz
-sha256  842071bca611c1f080cbc39c7ab3a6b58d7951f4f41e553b3db4fbe3e0705ce4  linux-6.0.16.tar.xz
+sha256  bc7f6d9a8a8bbe9a723e82346bba94b58d926f78bfba106b21e041e0290076fc  linux-6.1.5.tar.xz
+sha256  abe37eb0e2e331bdc7c4110115664e180e7d43b7336de6b4cd2bd1b123d30207  linux-6.0.19.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  80fcd9efa443502de9e2750f6dfb59e8de43a5d87a6d2be09dca748d79b5f2ee  linux-5.15.86.tar.xz
-sha256  7aaaf6d0bcd8a2cfa14ad75f02ca62bb2de08aad3bee3eff198de49ea5254079  linux-5.10.161.tar.xz
+sha256  e7359bd2935b54fe8bb821cf748591c36a95bed019e752d3e4d5803d9da1ccb4  linux-5.15.87.tar.xz
+sha256  2ec400fc50ffdfe4c836a3c02bf6e7aebcd7963dd2ac1425e6d41545c37dd217  linux-5.10.162.tar.xz
 sha256  80253b2cac54c256dfdfd1061800aef907f88432090f7aef74c0ddf50f6e6524  linux-5.4.228.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  1f6de11306cc9f82fe1d4dd03565cdf43906fa6f77302913d942fd63b77b500c  linux-4.9.336.tar.xz
+sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
 sha256  e32a230d71072a4ee50bd4386aa23ca4e617b8ad07b6f9fb223b65bf004c4c80  linux-4.14.302.tar.xz
 sha256  6e0ba5d224ab216b7b938cc9ff2478be7882a884bbdf15374149bade4d58b20a  linux-4.19.269.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 216b496fe4..1ad9fffcd3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -396,14 +396,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.336"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.302"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.228"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.161"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.86"	if BR2_KERNEL_HEADERS_5_15
-	default "6.0.16"	if BR2_KERNEL_HEADERS_6_0
-	default "6.1.2"		if BR2_KERNEL_HEADERS_6_1
+	default "5.10.162"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.87"	if BR2_KERNEL_HEADERS_5_15
+	default "6.0.19"	if BR2_KERNEL_HEADERS_6_0
+	default "6.1.5"		if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
