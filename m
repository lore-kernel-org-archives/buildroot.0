Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784DDC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 14:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2101C610DC;
	Tue, 14 Mar 2023 14:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2101C610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6Ykt8AoGty5; Tue, 14 Mar 2023 14:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42220610DD;
	Tue, 14 Mar 2023 14:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42220610DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34C2A1BF95E
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 14:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E29881D5C
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 14:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E29881D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhfTykqZIYhP for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 14:04:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 302B981494
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 14:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 302B981494
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 202EC8730B; Tue, 14 Mar 2023 14:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 14:58:59 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 79faa6aa2a576b2c95d74dd9592d4dc20213aa45
X-Git-Newrev: 6f7baf456fcc43f019677e4cdecc512019d06d86
X-Patchwork-Hint: ignore
Message-Id: <20230314140416.202EC8730B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f7baf456fcc43f019677e4cdecc512019d06d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 159df6a531676021607ea26309b994c68e5e501d)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index e496164444..394417be63 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,13 +2,13 @@
 sha256  abe37eb0e2e331bdc7c4110115664e180e7d43b7336de6b4cd2bd1b123d30207  linux-6.0.19.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
-sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-5.15.93.tar.xz
-sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
-sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
+sha256  348d974c143fdef8517ec703fdaa24bade12a49047848be92cb9e3253b19ef98  linux-5.15.96.tar.xz
+sha256  a2b51876befb8cc35724ed62820845f2b387d471a6cf46e8eedd0b6cb595825f  linux-5.10.170.tar.xz
+sha256  5a1e5754b4f2a4fe73b119d810ecda2ce07ecfb6f6cbbd16547c9ecd30b97627  linux-5.4.233.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
-sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
+sha256  4e1c1555c306874e0477d1af282d04a4efb285121456ab3f79519c92e406b701  linux-4.14.307.tar.xz
+sha256  64a265a193c9e3e14d1397278e2348386ef6d6043af76d693c0fbbafed345ca8  linux-4.19.274.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bbd798f029..94b431e0ed 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -390,11 +390,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
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
 	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
 	default "6.0.19"	if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
