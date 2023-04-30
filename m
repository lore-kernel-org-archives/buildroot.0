Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F232DC77B60
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 20:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F4A405C6;
	Sun, 30 Apr 2023 20:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F4A405C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fbn1tVgvXAU8; Sun, 30 Apr 2023 20:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B885C404B9;
	Sun, 30 Apr 2023 20:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B885C404B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 055951BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D17400D8
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 20:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D17400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id en-HWezQAslU for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 20:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8DA740490
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 20:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8DA740490
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A82844DC; Sun, 30 Apr 2023 20:44:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Apr 2023 22:41:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d89fdaea2b795ea0e06c3b7ed092d50950559fa8
X-Git-Newrev: d79fce3edd69f0a92495042ca8ed2f777006f2f6
X-Patchwork-Hint: ignore
Message-Id: <20230430204406.D4A82844DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=d79fce3edd69f0a92495042ca8ed2f777006f2f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5cbef197ab..690ee9c339 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.26" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f45b244e6b..43c9314a23 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a27076011efec7ad11e9ed0644f512c34cab4c5ed5ba42cfe71c83fabebe810d  linux-6.1.14.tar.xz
+sha256  dfdcc143a879d64a5ee99213b2b4b05b5dccd566c144df93bca1e204df64c110  linux-6.1.26.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  348d974c143fdef8517ec703fdaa24bade12a49047848be92cb9e3253b19ef98  linux-5.15.96.tar.xz
-sha256  a2b51876befb8cc35724ed62820845f2b387d471a6cf46e8eedd0b6cb595825f  linux-5.10.170.tar.xz
-sha256  5a1e5754b4f2a4fe73b119d810ecda2ce07ecfb6f6cbbd16547c9ecd30b97627  linux-5.4.233.tar.xz
+sha256  066c4bbcbe3c480068a2e302f52b1708f340ecaaf633ec43d7f791bbeac5771a  linux-5.15.109.tar.xz
+sha256  1bbd445c154b053eea46acc883be548a98179988a9ed3a0b81bddfbf30a37e29  linux-5.10.179.tar.xz
+sha256  142f9aed1c9f2e409dd72c5c490ad824dddf31f955ed2097d5989c4b5074fc28  linux-5.4.242.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  4e1c1555c306874e0477d1af282d04a4efb285121456ab3f79519c92e406b701  linux-4.14.307.tar.xz
-sha256  64a265a193c9e3e14d1397278e2348386ef6d6043af76d693c0fbbafed345ca8  linux-4.19.274.tar.xz
+sha256  43a514997d3a9052b765a9e1c8fbf7f5a810771937f8754a529ed09e0e02e20b  linux-4.19.282.tar.xz
+sha256  876c01f0d12ad0147b5c9ee2de919bedc7ffb7c2714dbfb7ccf44426f6f49153  linux-4.14.314.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae40520c51..e102369395 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.307"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.274"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.233"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.170"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.96"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.14"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.314"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.109"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.26"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
