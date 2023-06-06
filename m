Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B95C77B7A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 951BD4178D;
	Tue,  6 Jun 2023 19:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 951BD4178D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lr9eOnTRCT8u; Tue,  6 Jun 2023 19:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 361AB417B4;
	Tue,  6 Jun 2023 19:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 361AB417B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7E71BF339
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63A93612E4
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A93612E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYfNYmfhk6iv for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 19:42:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75CF9612E0
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 19:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75CF9612E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D12886D0F; Tue,  6 Jun 2023 19:42:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Jun 2023 21:40:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48c3d9f396dd7a9fa426e3f7ddbff65a6270aeaf
X-Git-Newrev: 2b0c6c0b7261937027a4f294a2d3c8c0a51eb722
X-Patchwork-Hint: ignore
Message-Id: <20230606194221.5D12886D0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 3}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b0c6c0b7261937027a4f294a2d3c8c0a51eb722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f288f52601..b4d32f6ea3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4806bf711c..18ede2d60f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f5cd478c3d8b908ab606afd1e95a4f8f77e7186b4a82829251d6e6aaafff825e  linux-6.3.5.tar.xz
-sha256  e86917bba1990e967943645484182a64ba325f98b114a1906cc1d50992e073c1  linux-6.1.31.tar.xz
+sha256  7a6a1f0dfa0bf7f45f9d4a7b409315cf32267850adab4db033a17de0320a24ef  linux-6.3.6.tar.xz
+sha256  7c88b7a09ba2b9e47b78eba2b32b1db6a4d89636f7ddd586545f9671a2521a6c  linux-6.1.32.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e981ea5d219f77735bf5a3f7e84a8af578df8ac3e1c4ff1b0649e2b0795277d2  linux-5.15.114.tar.xz
-sha256  ace6ceb73f5f2504bc1bcb9b8cd5b55d6ff8e90a81ee244ad2315fdd671ba4e7  linux-5.10.181.tar.xz
-sha256  90f5280e95ed7b374ad6f3979ed08008e29a051e5f372d367c06ed75b002a21b  linux-5.4.244.tar.xz
+sha256  1b076860779235e90519e867c1ec78c7a34d1125d8fdba787ff495c7c14f1214  linux-5.15.115.tar.xz
+sha256  de8ec58929460e3a14c1b0502f4a449f24c988a7a4a03ff04a82fb2d665fe9f6  linux-5.10.182.tar.xz
+sha256  9607881878fbd21e0dec4e8192b0f6352d17fd74c3ec23ffe6b0a24093efb1a4  linux-5.4.245.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  7fb9ee20c7e52f9be6d9f501e8498a22f4b364abfde136143749a77e597fd03e  linux-4.19.284.tar.xz
 sha256  ac8318f1c1d387e23ccfa760ec042943372df23e3c4e2408177fb5a3f6488f76  linux-4.14.316.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 51f475f16a..f9a164d78d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -398,11 +398,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.316"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.284"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.244"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.181"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.114"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.31"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.5"		if BR2_KERNEL_HEADERS_6_3
+	default "5.4.245"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.182"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.115"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.32"	if BR2_KERNEL_HEADERS_6_1
+	default "6.3.6"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
