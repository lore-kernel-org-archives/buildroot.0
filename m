Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C8C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 14:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDE86080A;
	Tue, 14 Mar 2023 14:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDE86080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zX_C_xGhCjE; Tue, 14 Mar 2023 14:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7664960AA3;
	Tue, 14 Mar 2023 14:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7664960AA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11AC21BF329
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 14:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFAEE81499
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 14:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFAEE81499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-nnw60Pps3t for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 14:03:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 039DA8146D
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 14:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039DA8146D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3CD68730B; Tue, 14 Mar 2023 14:03:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 15:00:57 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 43562c0f2e3b6e4f889fd85c5a36b20060da4ea6
X-Git-Newrev: bd6c387ddba9b3d6216d466b6bf0d70b2f430bbf
X-Patchwork-Hint: ignore
Message-Id: <20230314140313.E3CD68730B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd6c387ddba9b3d6216d466b6bf0d70b2f430bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 159df6a531676021607ea26309b994c68e5e501d)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 629cabf9be..214d2b0e96 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.93" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.96" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c5f0cdff8b..5b37005f29 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-5.15.93.tar.xz
-sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
-sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
+sha256  348d974c143fdef8517ec703fdaa24bade12a49047848be92cb9e3253b19ef98  linux-5.15.96.tar.xz
+sha256  a2b51876befb8cc35724ed62820845f2b387d471a6cf46e8eedd0b6cb595825f  linux-5.10.170.tar.xz
+sha256  5a1e5754b4f2a4fe73b119d810ecda2ce07ecfb6f6cbbd16547c9ecd30b97627  linux-5.4.233.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
-sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
+sha256  4e1c1555c306874e0477d1af282d04a4efb285121456ab3f79519c92e406b701  linux-4.14.307.tar.xz
+sha256  64a265a193c9e3e14d1397278e2348386ef6d6043af76d693c0fbbafed345ca8  linux-4.19.274.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0b00721221..3284b8e0ce 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -380,11 +380,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.305"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.272"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.167"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.93"	if BR2_KERNEL_HEADERS_5_15
+	default "4.14.307"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.274"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.233"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.170"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.96"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
