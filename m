Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A2CDD543
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AA81411B1;
	Wed, 18 Sep 2024 16:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEuV4405pES7; Wed, 18 Sep 2024 16:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A376408C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A376408C0;
	Wed, 18 Sep 2024 16:12:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6071BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644F94059D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coVA1wVb3R67 for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39CBC408C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39CBC408C0
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3450B83B0C; Wed, 18 Sep 2024 16:12:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:07:40 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 452bfb9e86f282f561ec853fae9a94725b0da51f
X-Git-Newrev: 9425e2f72317f7f51568af7d5351caffccc6ea10
X-Patchwork-Hint: ignore
Message-Id: <20240918161219.3450B83B0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=9425e2f72317f7f51568af7d5351caffccc6ea10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ebef582bd28fa183818ab973b58e167c75548a07)
[Peter: drop 6.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a5be12bc5e..aacb933b06 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.44" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.47" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6ca30145db..6596d0171c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
-sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
+sha256  d43376c9e9eaa92bb1b926054bd160d329c58a62d64bd65fe1222c11c6564f50  linux-6.6.47.tar.xz
+sha256  3773c9052c7ba7432e8337ca84bee115c1a94ccef9d62b72b99ae30c4cd5f80f  linux-6.1.106.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ec6098faed64b8a47ba1772e812a6eb444385f7aa3c60d3e4739ab2fd3b29186  linux-5.15.164.tar.xz
-sha256  ca09d86a6b79706c33382d3f8606f476eb07918417a87fb1815f6a4aa81f2ba1  linux-5.10.223.tar.xz
-sha256  44a0c3e76031f7513ce43e22e2a9dcbf7d6a6dee065dca9b8001843a075272b2  linux-5.4.281.tar.xz
+sha256  a36dd3e82ceb634afded31f2656568f57c4d9c4b399859f298b18116df11c6fe  linux-5.15.165.tar.xz
+sha256  19b099c67324bba6378e22dc51ad3906e4dcd6a908d137766b4bfa9174ddd11a  linux-5.10.224.tar.xz
+sha256  5582770976d33bb7bf9494e0fa0c49f449aa02b0133d00a5a198b6c208dd7de0  linux-5.4.282.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  544ddc7339cf1b1d1ead1992e67d11a0834ad3bc77faa063e06b5d18c682eb30  linux-4.19.319.tar.xz
+sha256  9d671a12b00301b7ce63022d4e4afa3e40aa318f8f7f25a1147e602fdb1047a1  linux-4.19.320.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 842df6e394..f5a185fbe7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.319"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.320"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.282"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.224"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.165"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.106"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.47"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
