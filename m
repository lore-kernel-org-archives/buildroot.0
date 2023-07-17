Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F73C001DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 12:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB88240A58;
	Mon, 17 Jul 2023 12:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB88240A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTpcR7LYbyVf; Mon, 17 Jul 2023 12:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B78E40A65;
	Mon, 17 Jul 2023 12:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B78E40A65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32ADD1BF860
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A10440A66
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A10440A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czH8qlDHDhNo for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 12:15:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4243740A5E
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 12:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4243740A5E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31E868717F; Mon, 17 Jul 2023 12:15:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 14:08:50 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cd4e89f76d25749cd654cb115e5112ba0878a19d
X-Git-Newrev: ed716fc0c656ea4bf1d468c46b5992ba911f0663
X-Patchwork-Hint: ignore
Message-Id: <20230717121528.31E868717F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 3}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed716fc0c656ea4bf1d468c46b5992ba911f0663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3512b76f2ec3612a3329bad6da5e82064fd06e6a)
[Peter: drop 6.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0e92e6446a..5dccc7fe8b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.35" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.36" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f18592d0a0..d2f71da15b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  be368143bc5d0dc73dd3e8c6191630c1620520379baf6f47c16116b2c0bc26ac  linux-6.1.35.tar.xz
+sha256  d8ca0e300f30b9ff70c6e1497c638a1dac1407f45d3655e9c62c6e45a08afe6b  linux-6.1.36.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4e6bf4dadb04d5d11d1d4cc37c0eabcf33bc333b7dd3dc2143c3099a823eb5b3  linux-5.15.118.tar.xz
-sha256  280662ec8dc8738cf947ad66e748141abd58cbe3b5ed66b7f2b153222b7c7090  linux-5.10.185.tar.xz
-sha256  3abed132e76c6575733acba39eaa54f6d8f4b1dc951b0e601a33959743b13e35  linux-5.4.248.tar.xz
+sha256  7aa5a0fd3520947e5599e811d28acdc30e36446c016c7dcee3793e6d1cbecfcf  linux-5.15.119.tar.xz
+sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
+sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  286a9b8c75bff7bdf66985e12a3a650b2bd638a776a5a6e93415930855662a73  linux-4.19.287.tar.xz
-sha256  aca4750f02f4090b753c1445db44dfa90de535eca73a7b0a7aa4453f65ba1ff9  linux-4.14.319.tar.xz
+sha256  33ebd0c445b58c814428558496b65a192410f000096b0e2e6f5d813ecd95e3eb  linux-4.19.288.tar.xz
+sha256  ed82679c0c6e600db80050d09e2294fb28b61cf27dc98657296c7eb5250a7625  linux-4.14.320.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e05a9e12b7..cc3cd16d12 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.319"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.287"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.248"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.185"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.118"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.35"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.320"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.119"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.36"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
