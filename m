Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3156AEE020A
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E147F82303;
	Wed, 13 Sep 2023 19:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E147F82303
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhx7rppsJXxq; Wed, 13 Sep 2023 19:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 030A5832E7;
	Wed, 13 Sep 2023 19:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 030A5832E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DFBF1BF283
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D08E611A4
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D08E611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlGKJ3ofEoJP for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75E4A60ED3
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E4A60ED3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6048E86E74; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 20:57:58 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6d4e69b9f59c521eb41c756b175dc57a0ebc3784
X-Git-Newrev: 547eb202b830dda7a56681eec17eb054ed1ead3f
X-Patchwork-Hint: ignore
Message-Id: <20230913193023.6048E86E74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
 linux-headers}: bump 5.{10, 15}.x / 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=547eb202b830dda7a56681eec17eb054ed1ead3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 19da04471599cac8eba272242b43bcff8e9ee9db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index aca9041688..8b5f0d24ab 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  93d58b6af007a5f44dd26831ff310707deb1ab9380c5136a534287eb3fddfcab  linux-6.1.47.tar.xz
+sha256  c606cbd0353e677df6fae73cc16ba3c9244b98372ed7771d551024016f55ac31  linux-6.1.48.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
-sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
+sha256  0f2eca845183fd76f53b0c867c97f12b9ace2d7e8ee2cdeec7eb2897651b80de  linux-5.15.128.tar.xz
+sha256  c40d11ee56e50a132429badbd1ba1c53e42b3312590b2a39be34c241d1b0b5b9  linux-5.10.192.tar.xz
 sha256  51608da961b5e34d6a9452a7b302699e109633f769a4253c74b1048abba8d9c7  linux-5.4.254.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  349728d3d143fcee484b34e34e536fe48dfb8bb71263f81a66fd572cc9162137  linux-4.19.292.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index abd4013da2..6ab91cf375 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -399,9 +399,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.47"	if BR2_KERNEL_HEADERS_6_1
+	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.48"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
