Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88757C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5224C4252B;
	Sat, 18 Jan 2025 11:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptCf9Ocmy9S1; Sat, 18 Jan 2025 11:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1063342530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1063342530;
	Sat, 18 Jan 2025 11:54:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51DC669
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31BC560775
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rmDb94fvDoT for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1436076B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E1436076B
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 600CC85D09; Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 12:35:05 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 31462e41696fb7a5e65679fd7c944cde95142da6
X-Git-Newrev: 3609b89f710012202fbb2058f7dd173d39efe354
X-Patchwork-Hint: ignore
Message-Id: <20250118115358.600CC85D09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] {linux,
 linux-headers}: bump 5.{4, 10, 15}.x / 6.{1, 6, 12}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3609b89f710012202fbb2058f7dd173d39efe354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cc2866ccec465623cf6deadc641b879fc61c561b)
[Peter: drop 6.12.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 51832beaba..a37a476b1a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
-sha256  283ff410e3f352ceed161ae30c0020301326059db03e86efcb384d46ac5840e2  linux-6.6.68.tar.xz
-sha256  e892c0b380100b7e6249060282ad07fbded092f0a2ca1d647243d0fbe9ce6e50  linux-6.1.122.tar.xz
+sha256  84d23ee07fb26febbcb6d1295ba15efdc67ac382b4137b2c8853146c10fd2f97  linux-6.6.70.tar.xz
+sha256  ff4ef6d5cc626faa81fc6da7b5270de064924c919be460f114e6ad8cb9589827  linux-6.1.124.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  8fd8bbc80e7aae30aaca3b40576b283010b5e84e70f6fea1573589155ce8a9d0  linux-5.15.175.tar.xz
-sha256  fda44589a438dff8c718082e9a48843b15e5eb82f6cc2f98d48f48226063bef0  linux-5.10.232.tar.xz
-sha256  876fbae303723bcf9e01ab57b1a0a7d38045aacd481ff865dccc2cc89f591afe  linux-5.4.288.tar.xz
+sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
+sha256  239e57280f8c9159187e383d7b730d29f5cc8e1b30be218f004e0c90d1137f52  linux-5.10.233.tar.xz
+sha256  1e3e5fc052c8e15f8eaa37d30bf4f0b3eef7430dd234d9fed0d0005852a06d10  linux-5.4.289.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  607bed7de5cda31a443df4c8a78dbe5e8a9ad31afde2a4d28fe99ab4730e8de1  linux-4.19.325.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2b6c201ae0..592a0f96f4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.19.325"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.288"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.232"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.175"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.122"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.68"	if BR2_KERNEL_HEADERS_6_6
+	default "5.4.289"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.233"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.176"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.124"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.70"	if BR2_KERNEL_HEADERS_6_6
 	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
