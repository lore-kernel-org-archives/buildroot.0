Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8E5C77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5267405EE;
	Tue,  2 May 2023 07:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5267405EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmU34t7z0Xey; Tue,  2 May 2023 07:28:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B790041605;
	Tue,  2 May 2023 07:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B790041605
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0A91BF860
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0862260BFA
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0862260BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uL6yw86kDDoT for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C39E60BA8
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C39E60BA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF142854A7; Tue,  2 May 2023 07:27:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 09:21:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5c6e53db58d5739d1ebe2fe83ba267debf6a8962
X-Git-Newrev: 16ed3610754864464b26fb7a8015013bafd13d62
X-Patchwork-Hint: ignore
Message-Id: <20230502072742.EF142854A7@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=16ed3610754864464b26fb7a8015013bafd13d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d79fce3edd69f0a92495042ca8ed2f777006f2f6)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 214d2b0e96..6febf90316 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.96" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.109" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5b37005f29..451e0fbb56 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  348d974c143fdef8517ec703fdaa24bade12a49047848be92cb9e3253b19ef98  linux-5.15.96.tar.xz
-sha256  a2b51876befb8cc35724ed62820845f2b387d471a6cf46e8eedd0b6cb595825f  linux-5.10.170.tar.xz
-sha256  5a1e5754b4f2a4fe73b119d810ecda2ce07ecfb6f6cbbd16547c9ecd30b97627  linux-5.4.233.tar.xz
+sha256  066c4bbcbe3c480068a2e302f52b1708f340ecaaf633ec43d7f791bbeac5771a  linux-5.15.109.tar.xz
+sha256  1bbd445c154b053eea46acc883be548a98179988a9ed3a0b81bddfbf30a37e29  linux-5.10.179.tar.xz
+sha256  142f9aed1c9f2e409dd72c5c490ad824dddf31f955ed2097d5989c4b5074fc28  linux-5.4.242.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  4e1c1555c306874e0477d1af282d04a4efb285121456ab3f79519c92e406b701  linux-4.14.307.tar.xz
-sha256  64a265a193c9e3e14d1397278e2348386ef6d6043af76d693c0fbbafed345ca8  linux-4.19.274.tar.xz
+sha256  876c01f0d12ad0147b5c9ee2de919bedc7ffb7c2714dbfb7ccf44426f6f49153  linux-4.14.314.tar.xz
+sha256  43a514997d3a9052b765a9e1c8fbf7f5a810771937f8754a529ed09e0e02e20b  linux-4.19.282.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3284b8e0ce..826c371570 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -380,11 +380,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.307"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.274"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.233"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.170"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.96"	if BR2_KERNEL_HEADERS_5_15
+	default "4.14.314"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.109"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
