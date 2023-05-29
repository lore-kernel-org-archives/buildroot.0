Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDD6C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 14:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD18408E6;
	Mon, 29 May 2023 14:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD18408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpFgQbq5UcmS; Mon, 29 May 2023 14:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FF95405B5;
	Mon, 29 May 2023 14:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FF95405B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDA81BF3C0
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 14:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BA7040396
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 14:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA7040396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4V-mZTmMBqk for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 14:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A6E4010C
 for <buildroot@buildroot.org>; Mon, 29 May 2023 14:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A6E4010C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9102D86A3E; Mon, 29 May 2023 14:57:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 May 2023 16:56:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 971cabfd917627b5d7a3c11e5342126b0e351cf6
X-Git-Newrev: e453fbe0e688d328a05bb0787560a6b4258fa5e7
X-Patchwork-Hint: ignore
Message-Id: <20230529145749.9102D86A3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 2, 3}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=e453fbe0e688d328a05bb0787560a6b4258fa5e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c27bf8881d94b3973b5bf00f414321a6ee7db819)
[Peter: drop 6.2.x / 6.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9e34c6981e..6337e098b4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.27" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.30" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c4052f7933..19066fcbdb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
+sha256  1bf254c4ca9ebccb25328296584fb5e87ad635ae0c1cc1deb0b5bb37a4608813  linux-6.1.30.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9829fcc77b9978dce97a26980dec445caf2410024696625dbb2314ead4830b5b  linux-5.15.110.tar.xz
-sha256  1bbd445c154b053eea46acc883be548a98179988a9ed3a0b81bddfbf30a37e29  linux-5.10.179.tar.xz
-sha256  142f9aed1c9f2e409dd72c5c490ad824dddf31f955ed2097d5989c4b5074fc28  linux-5.4.242.tar.xz
+sha256  4a4e98d21149d781867a6d44855f708b02f03cfe233d8026a0af9c9841b3b9ca  linux-5.15.113.tar.xz
+sha256  da839a4bf1f6c964b9bde593bd58928f106f53690ff677e226bc50cf368b0c29  linux-5.10.180.tar.xz
+sha256  c3cf664feeeee47e0f0c45c53705568f73692c37a3ff7f11c1b15e59610feb04  linux-5.4.243.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  43a514997d3a9052b765a9e1c8fbf7f5a810771937f8754a529ed09e0e02e20b  linux-4.19.282.tar.xz
-sha256  876c01f0d12ad0147b5c9ee2de919bedc7ffb7c2714dbfb7ccf44426f6f49153  linux-4.14.314.tar.xz
+sha256  047316d20c6c97ad41c40477c7e1ab0bea434243e17bfc72155801b123cc51f4  linux-4.19.283.tar.xz
+sha256  a346c5c34c06caeb28063b6379a28ec1f4111fa438ecd933a55f696fe362c99d  linux-4.14.315.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d9e74c6e73..98e60d74f8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.314"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.110"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.27"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.315"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.283"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.243"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.180"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.113"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.30"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
