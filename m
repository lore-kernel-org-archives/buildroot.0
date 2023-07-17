Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C461EC0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 13:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E8AF60F21;
	Mon, 17 Jul 2023 13:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E8AF60F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00NfuatpcOoD; Mon, 17 Jul 2023 13:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04B760F3B;
	Mon, 17 Jul 2023 13:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A04B760F3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CAFA1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A7F40139
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A7F40139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXJ9X414MpIj for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 13:18:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B62B3400C5
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 13:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B62B3400C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A65E987316; Mon, 17 Jul 2023 13:18:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 15:13:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9d355495f8097fb9f7aef6ecf6c4b5e6cd3c8d0e
X-Git-Newrev: eb62b3fc914621a84c616a72de27549f33427511
X-Patchwork-Hint: ignore
Message-Id: <20230717131816.A65E987316@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 3, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb62b3fc914621a84c616a72de27549f33427511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88a2e0c473fe78ba571bf48fb4e9cc94c86a3df4)
[Peter: drop 6.3.x/6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5dccc7fe8b..352fa76379 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.36" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.38" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d2f71da15b..0446640630 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d8ca0e300f30b9ff70c6e1497c638a1dac1407f45d3655e9c62c6e45a08afe6b  linux-6.1.36.tar.xz
+sha256  f9a4f91b609f7d332a5f2be01ab86336fa00149fae6bdc19f16fa19f78802d43  linux-6.1.38.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7aa5a0fd3520947e5599e811d28acdc30e36446c016c7dcee3793e6d1cbecfcf  linux-5.15.119.tar.xz
+sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
 sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
 sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cc3cd16d12..7b054a2e41 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -388,8 +388,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.119"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.36"	if BR2_KERNEL_HEADERS_6_1
+	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.38"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
