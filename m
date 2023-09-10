Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4315BEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F163E40A06;
	Sun, 10 Sep 2023 21:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F163E40A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fy5OFAg-jn0; Sun, 10 Sep 2023 21:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DB594049E;
	Sun, 10 Sep 2023 21:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB594049E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3057B1BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F246605AC
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F246605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ds3qa0SqLxC6 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8125C60737
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8125C60737
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7116186BC6; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:43:08 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3bf2318584f46f9951e95ce07d4f3cc6b7b56ae7
X-Git-Newrev: bf06180dc8718b755dc2347d30cdd76508d2acc2
X-Patchwork-Hint: ignore
Message-Id: <20230910214330.7116186BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf06180dc8718b755dc2347d30cdd76508d2acc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 95116bc65e53f58b1dfbd35e5156b46f9e6b9a51)
[Peter: Drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8b4c867d98..c975c5caea 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.42" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.43" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 83d4c2ca5f..6daafb73ef 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  aaf8261b551c8b76b81eab8780b446e88cea4d551ae517ac3a9b2dbdbd381ed3  linux-6.1.42.tar.xz
+sha256  245248470a62d4e94b46f753afc01e19e45b9e6f3a0fa06e7f5da21fe845a808  linux-6.1.43.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2de69544a12e6a059163c58fc901c13bcf22e8cac39c66b56f8fbb633399bf93  linux-5.15.123.tar.xz
+sha256  00036a0260ad012aa832a8698a4afcf23b2410091527738ce48ce3fcc23f22ed  linux-5.15.124.tar.xz
 sha256  c9558bab35e23ae67661bfb3192c609c857f78582a035449ae63e33d04ab6112  linux-5.10.188.tar.xz
 sha256  bcb4953ed68131ef17f9f1ba52cac8b9d70007f5ab600bf3dee1fbf8beb218ca  linux-5.4.251.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dbcc09a46d..4f7934ff5e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -388,8 +388,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.289"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.251"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.188"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.123"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.42"	if BR2_KERNEL_HEADERS_6_1
+	default "5.15.124"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.43"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
