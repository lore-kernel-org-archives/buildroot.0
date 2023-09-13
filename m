Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30071EE020C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1414802EE;
	Wed, 13 Sep 2023 20:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1414802EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhwYfmSyGJ_2; Wed, 13 Sep 2023 20:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D1578300C;
	Wed, 13 Sep 2023 20:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D1578300C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6B91BF98E
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4398F60ED5
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4398F60ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2o586gRs1fjV for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BBA360B46
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBA360B46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BBC586E9C; Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 22:02:10 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 05027604e52cda323a5dda61fdda41d0f2314b7f
X-Git-Newrev: 74ebf46e43dc9d3f2c23fcbc082c2897561bc51f
X-Patchwork-Hint: ignore
Message-Id: <20230913201426.3BBC586E9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
 linux-headers}: bump 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=74ebf46e43dc9d3f2c23fcbc082c2897561bc51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9a4c8a0564dd5dcdaa9aa82a1e5830acd5ff08c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 8b5f0d24ab..aedc13aa1f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  c606cbd0353e677df6fae73cc16ba3c9244b98372ed7771d551024016f55ac31  linux-6.1.48.tar.xz
+sha256  c9ea14231ca4ca6e3882a9339a8c3c414e4c91519d3e50af6822f47e99057a0f  linux-6.1.49.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0f2eca845183fd76f53b0c867c97f12b9ace2d7e8ee2cdeec7eb2897651b80de  linux-5.15.128.tar.xz
 sha256  c40d11ee56e50a132429badbd1ba1c53e42b3312590b2a39be34c241d1b0b5b9  linux-5.10.192.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6ab91cf375..4891934a1f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -401,7 +401,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.48"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.49"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
