Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842D2C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53F8E416DC;
	Wed, 28 Feb 2024 21:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzgFpu_h6Auu; Wed, 28 Feb 2024 21:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ABF141765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ABF141765;
	Wed, 28 Feb 2024 21:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235921BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBC0381AF6
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gp8VlfNCWQUG for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA6F817C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA6F817C3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD3B987CDC; Wed, 28 Feb 2024 21:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 21:59:19 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 8ab2a93204968e939f3345f4c867b203afbf6a4d
X-Git-Newrev: f24d68dde05e83f3baa5e56c50fcd6cfaf699caa
X-Patchwork-Hint: ignore
Message-Id: <20240228212551.DD3B987CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=f24d68dde05e83f3baa5e56c50fcd6cfaf699caa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 44292dabc09bc14df033e7be9d12429353ceaac7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ed865c6f5b..662bd09162 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f41ed0a270..8bdead2a5e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  88b89e7dd41ead4e3ab1e411c8bb8d592575acf815cf1df3c0dc57e2e882c0bc  linux-6.6.13.tar.xz
+sha256  fbe96b2db3f962cd2a96a849d554300e7a4555995160082d4f323c2a1dfa1584  linux-6.6.14.tar.xz
 sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
-sha256  b7fbd1d79faed2ce3570ef79dc1223e4e19c868b86326b14a435db56ebbb2022  linux-6.1.74.tar.xz
+sha256  6cd19410330c13ec4c18fd28a83d3e40fc12a152815fb7c3e1b0764329093a56  linux-6.1.75.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  56c1e65625d201db431efda7a3816e7b424071e7cb0245b2ba594d15b1fdfcd4  linux-5.15.147.tar.xz
-sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-5.10.208.tar.xz
-sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
+sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
+sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
+sha256  afc8aca6cb56fea489f6508bc24357df1cf8a8f3d7dcfbcccd94b7f968492620  linux-5.4.268.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz
+sha256  b91be40fa61ff7d42958e2154a4b7602dc071982128b9b58b6d911dec111be19  linux-4.19.306.tar.xz
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1fad05b899..3aaff00a0f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -413,13 +413,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.305"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.267"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.208"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.147"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.74"	if BR2_KERNEL_HEADERS_6_1
+	default "4.19.306"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.75"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6.13"	if BR2_KERNEL_HEADERS_6_6
+	default "6.6.14"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
