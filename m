Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14622C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB52141E62;
	Wed, 30 Aug 2023 11:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB52141E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvdKEoJThMzO; Wed, 30 Aug 2023 11:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8418741BD8;
	Wed, 30 Aug 2023 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8418741BD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16F891BF282
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6511641C49
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6511641C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQv3b77iu961 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A88A402AD
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A88A402AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 679F686587; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:00:49 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: b703a2b860acca4c3cc61089754963886bf7f78f
X-Git-Newrev: a8ce33440d9bf17c6fba50432a3b3c324809fcb4
X-Patchwork-Hint: ignore
Message-Id: <20230830110347.679F686587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
 linux-headers}: bump 5.{4, 10, 15}.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8ce33440d9bf17c6fba50432a3b3c324809fcb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0a4a689e9688120787092286b202fdf5fe89d5bf)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 882d2c93f0..5e4779668a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  312809a78eea052a08a6580f47b2ed8dd28e5633461d6731febaf3cb1e570bb7  linux-6.1.41.tar.xz
+sha256  aaf8261b551c8b76b81eab8780b446e88cea4d551ae517ac3a9b2dbdbd381ed3  linux-6.1.42.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  38755801cd1ce229a8c0a0536d29aa37acea8a8aa13fa438e19fbf9d6293342d  linux-5.15.122.tar.xz
-sha256  f69454210b3e9e00e8b8368aaa897d4ca59f8be3b85399a2fcaecbf17af98bbb  linux-5.10.187.tar.xz
-sha256  0f5b8876526062bf5e346f6b9dde88be873761ee33cf3b8a1586d7d109a091fb  linux-5.4.250.tar.xz
+sha256  2de69544a12e6a059163c58fc901c13bcf22e8cac39c66b56f8fbb633399bf93  linux-5.15.123.tar.xz
+sha256  c9558bab35e23ae67661bfb3192c609c857f78582a035449ae63e33d04ab6112  linux-5.10.188.tar.xz
+sha256  bcb4953ed68131ef17f9f1ba52cac8b9d70007f5ab600bf3dee1fbf8beb218ca  linux-5.4.251.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  118f7411793868db8dcb043cdc82e9ac6f722fbec8dcdde30b07889d941aa3b3  linux-4.19.289.tar.xz
 sha256  ed82679c0c6e600db80050d09e2294fb28b61cf27dc98657296c7eb5250a7625  linux-4.14.320.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c5a4f880c7..b7c695953e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -398,10 +398,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.320"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.289"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.250"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.187"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.122"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.41"	if BR2_KERNEL_HEADERS_6_1
+	default "5.4.251"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.188"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.123"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.42"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
