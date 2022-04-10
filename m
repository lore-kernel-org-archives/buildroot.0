Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A913DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69C1440493;
	Sun, 10 Apr 2022 20:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gn1RmGFb-LUo; Sun, 10 Apr 2022 20:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C30A4014A;
	Sun, 10 Apr 2022 20:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEA501BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB504014A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpKzVux-3WzQ for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:24:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C3D340106
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:24:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99FA7240004;
 Sun, 10 Apr 2022 20:24:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nde71-005F1f-K8; Sun, 10 Apr 2022 22:24:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:24:42 +0200
Message-Id: <20220410202442.1249348-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15, 16}.x series
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
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f25b662aa5..4b4ea8d92b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.30" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.33" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 87a0f0465b..cf7ccc5cc5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  cca7d6e053e33f44af1b39f7becec73a387911d81ede5a84ecf671692533138f  linux-5.16.16.tar.xz
-sha256  254ea2fe08f0aa07e4f7fffe95d12463df7fa6ff8a9ba72f321da15e50fa7132  linux-5.15.30.tar.xz
-sha256  c467c3077946370fb26c9277313b601d6c48bb557abc889f4892caf627fcdfea  linux-5.10.107.tar.xz
-sha256  61f7cd24cb8a38d41891d9066c1dfd14a688a9dff7f485922e385654ea8b39b9  linux-5.4.186.tar.xz
+sha256  da6d2cfa8b5b82d8a17b032a627fc1c7885097523c32cc8a4294745697d59b7e  linux-5.16.19.tar.xz
+sha256  c30a17e6090f9ebf2d8ff58cd6c92c7324b1f4a8b3aa6a7f68850310af05a9c4  linux-5.15.33.tar.xz
+sha256  dbef6a06325433481551cb8cfca9254d908d0ae950bc809f3da8ade00c485693  linux-5.10.110.tar.xz
+sha256  9fbc8bfdc28c9fce2307bdf7cf1172c9819df673397a411c40a5c3d0a570fdbc  linux-5.4.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  47470f83aa64e0098830a53176c959740742973663fead7ca7cc7b84e1f9d0f7  linux-4.9.307.tar.xz
-sha256  9b6178099cf33c534c971f3f065c0debe92788f0f504d54badb2f8c2ee089d69  linux-4.14.272.tar.xz
-sha256  530c5ac848111bbf7d1ad407a4ce8173ef8f9a4554477a32c695c5a4eaf02598  linux-4.19.235.tar.xz
+sha256  e86a55a89e1e28756b890b2b78f8b582d05cecb3509ff5c353e9534866468614  linux-4.9.309.tar.xz
+sha256  100a9960fb2d8e079c9feeef640715a7fb749ed728a57e427f9e2443212e58f9  linux-4.14.275.tar.xz
+sha256  bafff35102cc486ec2bf94c6d908be8e24017b2e4a1873f52f24c855eb220cd8  linux-4.19.237.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
 sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 479f64b72e..decf02d175 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -381,13 +381,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.307"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.272"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.235"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.186"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.107"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.30"	if BR2_KERNEL_HEADERS_5_15
-	default "5.16.16"	if BR2_KERNEL_HEADERS_5_16
+	default "4.9.309"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.275"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.237"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.188"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.110"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.33"	if BR2_KERNEL_HEADERS_5_15
+	default "5.16.19"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
