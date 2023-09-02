Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7A1C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 12:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37544159C;
	Sat,  2 Sep 2023 12:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37544159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQJxLhIrF7-5; Sat,  2 Sep 2023 12:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78DC4174D;
	Sat,  2 Sep 2023 12:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D78DC4174D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6927D1BF41B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D494174D
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D494174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8CYiok0J91a for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 12:45:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4429D4159C
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 12:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4429D4159C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FF3986892; Sat,  2 Sep 2023 12:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 14:45:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d44a888c320bd5fc850bccf5a1e09facb9fdad0d
X-Git-Newrev: 99674f64ba8f87b7489b5380d0e6bafa25930341
X-Patchwork-Hint: ignore
Message-Id: <20230902124529.2FF3986892@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=99674f64ba8f87b7489b5380d0e6bafa25930341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index de08f755f6..90ab048055 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 066edd9a7d..d62fc7de09 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5e5511b50bc9fd358bb5d7746fab3c5ea396d42c6bd7a54b2555ede0de5ac8e5  linux-6.4.13.tar.xz
-sha256  b27ac1443eea563bc546ee1f67d9802bc8d6c0f6f18707407fba01f9f78c488c  linux-6.1.50.tar.xz
+sha256  75eae323747ae37b05086c5a51326a744eb611b0e890e7ebe77de362b30450e6  linux-6.4.14.tar.xz
+sha256  58b0446d8ea4bc0b26a35e2e3509bd53efcdeb295c9e4f48d33a23b1cdaa103b  linux-6.1.51.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  750ec97ce4f1473e392b367a55eca4ea7a6b1e9e65ca2fb3bbca2eaa64802b66  linux-5.15.129.tar.xz
-sha256  bd4036da47612d0d8c5f8c43e7700e8c996ae3b51084aa8fc6530c9d00f1ded0  linux-5.10.193.tar.xz
-sha256  34d5ed902f47d90f27b9d5d6b8db0d3fa660834111f9452e166d920968a4a061  linux-5.4.255.tar.xz
+sha256  ab464e4107329ff5262f1c585c40fc29dc68f17687a9a918f3e90faba5303d62  linux-5.15.130.tar.xz
+sha256  240d5e47bb378c6813ecd07704fb887651ea7617159d2771071fd70bf33cd995  linux-5.10.194.tar.xz
+sha256  c7a4086ba23507b8539d18534565de0d6591138bfa2e449e93964fd5132e353a  linux-5.4.256.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  cd95a8cb8fefb749e32359b8a915c036abc37e80746285da6535cb5a0776b3f0  linux-4.19.293.tar.xz
-sha256  24e8b21647a0f270291ea56d9123d59c511fa10efc23f5d28b5cb51611e1d9f0  linux-4.14.324.tar.xz
+sha256  ccadbde939a788934436125a1ecd4464175b68ebe6c18072fbc90c8596eea00f  linux-4.19.294.tar.xz
+sha256  5b69e182ced5190a1fca117682cf7967c5bab24c4cf1364733ee14055b0df784  linux-4.14.325.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0c0b365473..7e67dfad5c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,13 +400,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.324"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.293"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.255"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.193"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.129"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.50"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.13"	if BR2_KERNEL_HEADERS_6_4
+	default "4.14.325"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.294"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.256"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.194"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.130"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.51"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.14"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
