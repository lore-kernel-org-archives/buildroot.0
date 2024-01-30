Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C9BC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED2783DD2;
	Tue, 30 Jan 2024 22:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED2783DD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZgDIrPQ_vwq; Tue, 30 Jan 2024 22:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF16283C19;
	Tue, 30 Jan 2024 22:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF16283C19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7BB1BF275
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 059DD83C19
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 059DD83C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ut1cbWHjd-S6 for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:17:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3391583DD2
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3391583DD2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CF0186781; Tue, 30 Jan 2024 22:17:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 23:15:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b83d96145cd627c806f9002987da956f5ec4d96
X-Git-Newrev: 44292dabc09bc14df033e7be9d12429353ceaac7
X-Patchwork-Hint: ignore
Message-Id: <20240130221705.1CF0186781@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=44292dabc09bc14df033e7be9d12429353ceaac7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
index 6067b595ac..d7082aa629 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  88b89e7dd41ead4e3ab1e411c8bb8d592575acf815cf1df3c0dc57e2e882c0bc  linux-6.6.13.tar.xz
-sha256  b7fbd1d79faed2ce3570ef79dc1223e4e19c868b86326b14a435db56ebbb2022  linux-6.1.74.tar.xz
+sha256  fbe96b2db3f962cd2a96a849d554300e7a4555995160082d4f323c2a1dfa1584  linux-6.6.14.tar.xz
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
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9845ef7c2b..bf55c8714a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.305"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.267"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.208"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.147"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.74"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.13"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.306"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.75"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.14"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
