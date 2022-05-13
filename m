Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81ACC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 14:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B9D83E6B;
	Fri, 13 May 2022 14:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4jlU7pbLwx2; Fri, 13 May 2022 14:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFCF83E6C;
	Fri, 13 May 2022 14:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30B61BF31A
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 14:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F09A583E1C
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 14:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQuUktAylV2p for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 14:42:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0206D82A17
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:42:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62A44240007;
 Fri, 13 May 2022 14:42:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1npWUk-00Au8a-AX; Fri, 13 May 2022 16:42:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 16:42:14 +0200
Message-Id: <20220513144215.2598981-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513144215.2598981-1-peter@korsgaard.com>
References: <20220513144215.2598981-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] {linux,linux-headers}: default to 5.17.x
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

5.15.x is getting quite old, so default to 5.17.x instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 6 +++---
 package/linux-headers/Config.in.host | 7 +------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 24655a2962..fd3605a559 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.15)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (5.17)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.104-cip3)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.39" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5ff616fb34..859f772624 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_15
+	default BR2_KERNEL_HEADERS_5_17
 	help
 	  Select the kernel version to get headers from.
 
@@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
-config BR2_KERNEL_HEADERS_5_16
-	bool "Linux 5.16.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
-
 config BR2_KERNEL_HEADERS_5_17
 	bool "Linux 5.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
@@ -389,7 +385,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
-	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default "5.17.7"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
