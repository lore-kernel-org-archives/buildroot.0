Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E3FE7736E
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66EB383D81;
	Sat, 30 Sep 2023 10:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66EB383D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hqV6KyRLTBC; Sat, 30 Sep 2023 10:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C3983D7F;
	Sat, 30 Sep 2023 10:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C3983D7F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A34B1BF471
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64CED404F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64CED404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2zBPChnL-RT for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77CED4010C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77CED4010C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FB9183939; Sat, 30 Sep 2023 10:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 12:23:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: df2c4a2301636a3818f36f37f7361ec89b38f36d
X-Git-Newrev: c4826b9618da4145ed44edab52cf76a457df1e6b
X-Patchwork-Hint: ignore
Message-Id: <20230930104903.5FB9183939@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4826b9618da4145ed44edab52cf76a457df1e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 181cf756ca42422569ed4fa8ac00ea844722208d)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1d9d69603a..731b4288df 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.51" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.55" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 1468eb5f21..99cb880bb7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  58b0446d8ea4bc0b26a35e2e3509bd53efcdeb295c9e4f48d33a23b1cdaa103b  linux-6.1.51.tar.xz
+sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ab464e4107329ff5262f1c585c40fc29dc68f17687a9a918f3e90faba5303d62  linux-5.15.130.tar.xz
-sha256  240d5e47bb378c6813ecd07704fb887651ea7617159d2771071fd70bf33cd995  linux-5.10.194.tar.xz
-sha256  c7a4086ba23507b8539d18534565de0d6591138bfa2e449e93964fd5132e353a  linux-5.4.256.tar.xz
+sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
+sha256  183a4507b0ebec7816a79ceba6253aa7ad345e25b0fcd4e834ee154be9a993ab  linux-5.10.197.tar.xz
+sha256  2e775970521ea7ff6eb613fc85a6e34cec73feaeb67b88a77a2fbd4f75483df0  linux-5.4.257.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  ccadbde939a788934436125a1ecd4464175b68ebe6c18072fbc90c8596eea00f  linux-4.19.294.tar.xz
-sha256  5b69e182ced5190a1fca117682cf7967c5bab24c4cf1364733ee14055b0df784  linux-4.14.325.tar.xz
+sha256  b732c2e4f08576a9dd5bb14213cead3835acbb101a91aaba3d6ace302fd538ac  linux-4.19.295.tar.xz
+sha256  555ce40f1df4c0f4a74cbefcaad0c67108615860968720faabe51cdee2df1478  linux-4.14.326.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 740fd55669..3a2bec1a18 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.325"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.294"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.256"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.194"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.130"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.51"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.326"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
