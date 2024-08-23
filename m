Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9529FC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56585402DD;
	Fri, 23 Aug 2024 17:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wN7dS86Wn2Mi; Fri, 23 Aug 2024 17:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DD74035B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DD74035B;
	Fri, 23 Aug 2024 17:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59A791BF306
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 462D84035B
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk1seBKv2cf1 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3618D402DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3618D402DD
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 312FA86431; Fri, 23 Aug 2024 17:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:08:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e656625b8a68e15deb9afaeaa4d61de5171288a4
X-Git-Newrev: ebef582bd28fa183818ab973b58e167c75548a07
X-Patchwork-Hint: ignore
Message-Id: <20240823170829.312FA86431@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 10}.x series
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebef582bd28fa183818ab973b58e167c75548a07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 429a7eabef..eab5cb8511 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4e05f4a765..e8a9e0f0eb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fa5f22fd67dd05812d39dca579320c493048e26c4a556048a12385e7ae6fc698  linux-6.10.3.tar.xz
-sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
-sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
+sha256  e0d50d5b74f8599375660e79f187af7493864dba5ff6671b14983376a070b3d1  linux-6.10.6.tar.xz
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
index 83b8d1267e..934f427e4e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -423,13 +423,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.319"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.3"	if BR2_KERNEL_HEADERS_6_10
+	default "4.19.320"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.282"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.224"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.165"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.106"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.47"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.6"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
