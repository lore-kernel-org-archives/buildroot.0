Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E71C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 16:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D7A410AC;
	Sat, 15 Oct 2022 16:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D7A410AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvla5H1Szuzx; Sat, 15 Oct 2022 16:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25945410A3;
	Sat, 15 Oct 2022 16:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25945410A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89E261BF3E8
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 16:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6452A410A4
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 16:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6452A410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4NlMXPYuPfo for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 16:50:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30BC94109F
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30BC94109F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CD1C82A98; Sat, 15 Oct 2022 16:50:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 18:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d07e6b7071cf9496aa67b2459d0574bc5ffd9c46
X-Git-Newrev: 716b8c4e7bac4f39b7a2297f39858f5c4bfbcab6
X-Patchwork-Hint: ignore
Message-Id: <20221015165016.1CD1C82A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x / 6.0.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=716b8c4e7bac4f39b7a2297f39858f5c4bfbcab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 17 ++++++++---------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f9caa3c652..ee59761f33 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.0" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 07963f185e..c4ee15c37b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,15 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5c2443a5538de52688efb55c27ab0539c1f5eb58c0cfd16a2b9fbb08fd81788e  linux-6.0.tar.xz
+sha256  8ede745a69351ea0f27fe0c48780d4efa37ff086135e129358ce09694957e8f9  linux-6.0.1.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4ecdb8b59c6f6f258d89cbf22eede210e0a55c09db884988fe706efe2fe8f148  linux-5.19.13.tar.xz
-sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
-sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz
-sha256  3f47ebdb9afe152a0c32c1157336ef13fa5cc08ac6d884dfc1f6ddc2b7dba268  linux-5.10.142.tar.xz
-sha256  09c72e3dd85df773eb52e53e25c556d132958bd775b0ed6985a6b1ac21c9cfc2  linux-5.4.212.tar.xz
+sha256  4686e33847db3ec58e1043bc0c806472aae694b2c413bb7d8da91a5c9a55eb1b  linux-5.19.15.tar.xz
+sha256  a822f09525ae8803453939a91e73f18097a3ba2aec73be4fe9ab314a0131715d  linux-5.15.73.tar.xz
+sha256  85253abf097eb5013b988a400eb022eed0e0626e7e0a7daa3ab4b6bcabbced9a  linux-5.10.147.tar.xz
+sha256  2bb826cdf9b2cfce385fb5d51fc8070fe428e467bd3df4ae2a7eb6f0c0cc2e63  linux-5.4.217.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  2283c1af5373c43e79adca6987174d932989a8b2551405e83e2e39ebe31e06d2  linux-4.9.327.tar.xz
-sha256  70f4df21901a654632ebbb533884ccaf117a29b14e6f2b672f0c36613c3e897d  linux-4.14.292.tar.xz
-sha256  eadd13aa70f37cdf50eef45c5964bd7146d353b61a1fd026d4fa0b2a68a3ea47  linux-4.19.257.tar.xz
+sha256  bf021936a450e9292e10cc7db9909cd0d336406191d22aadd22bdcc51ca2595f  linux-4.9.330.tar.xz
+sha256  62ccb9ba94a7da5115bc923eebf8dffee9229801da02be87d90ae68ab9a76a6b  linux-4.14.295.tar.xz
+sha256  bec33298bd0470b5e725c7dc29a2dd4daf02065cb01cd4a54f6adee6ff582cb2  linux-4.19.261.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7aee67de56..8679241a2c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -392,14 +392,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.327"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.292"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.257"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.212"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.142"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
-	default "5.19.13"	if BR2_KERNEL_HEADERS_5_19
-	default "6.0"		if BR2_KERNEL_HEADERS_6_0
+	default "4.9.330"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.295"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.261"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.217"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.147"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.73"	if BR2_KERNEL_HEADERS_5_15
+	default "5.19.15"	if BR2_KERNEL_HEADERS_5_19
+	default "6.0.1"		if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
