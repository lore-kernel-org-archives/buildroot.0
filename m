Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975A5C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 09:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B0161317;
	Sat, 27 May 2023 09:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B0161317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gOamHirqeaCc; Sat, 27 May 2023 09:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED99611DE;
	Sat, 27 May 2023 09:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED99611DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 770251BF86C
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E87384544
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E87384544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34PGzN_FFaKv for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 09:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF9B84535
 for <buildroot@buildroot.org>; Sat, 27 May 2023 09:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AF9B84535
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 567D08639A; Sat, 27 May 2023 09:55:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 11:47:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad4775fb2f6a51e1d88110c520e98147deb752ab
X-Git-Newrev: c27bf8881d94b3973b5bf00f414321a6ee7db819
X-Patchwork-Hint: ignore
Message-Id: <20230527095536.567D08639A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 2, 3}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=c27bf8881d94b3973b5bf00f414321a6ee7db819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index abb4bf922f..1967919431 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fbc166afa2..5b860d4aa1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b612ecf282ca3f7989ff6d9f39082833b7dc2d522cb969a05334d3614e9c5328  linux-6.3.2.tar.xz
-sha256  9ffa34921044660c6adb3eb5fd996192e322b15bbf532fe4e4e7a47079ed8fc1  linux-6.2.15.tar.xz
-sha256  7a094c1428b20fef0b5429e4effcc6ed962a674ac6f04e606d63be1ddcc3a6f0  linux-6.1.28.tar.xz
+sha256  d8627528ed6b3ae607d00b1ef5a46e0e7051ae40b285fd4e82f4ff0bb72b68e8  linux-6.3.4.tar.xz
+sha256  06ff0d780a6934b46140f6d8c1a15792c78aa337d8b2411bf90747371d358713  linux-6.2.16.tar.xz
+sha256  1bf254c4ca9ebccb25328296584fb5e87ad635ae0c1cc1deb0b5bb37a4608813  linux-6.1.30.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  77ceea259c0158dd624304871170d09b2e59ed612f3a4d436fe0f07362dcaec2  linux-5.15.111.tar.xz
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
index 6f9c3b9418..ba7cf49455 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,14 +400,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.314"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.111"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.28"	if BR2_KERNEL_HEADERS_6_1
-	default "6.2.15"	if BR2_KERNEL_HEADERS_6_2
-	default "6.3.2"		if BR2_KERNEL_HEADERS_6_3
+	default "4.14.315"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.283"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.243"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.180"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.113"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.30"	if BR2_KERNEL_HEADERS_6_1
+	default "6.2.16"	if BR2_KERNEL_HEADERS_6_2
+	default "6.3.4"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
