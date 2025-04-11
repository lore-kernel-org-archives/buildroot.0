Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52ABC369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8632B6FA2E;
	Fri, 11 Apr 2025 10:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vXn4bLF1NQU; Fri, 11 Apr 2025 10:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 583E76FBE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583E76FBE3;
	Fri, 11 Apr 2025 10:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19563108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6471B60733
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snWziYngf71e for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B31660BEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B31660BEA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876588439F; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:31 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 1c2bf818aa16abbbe8bfcbc588a595e20d28ccf9
X-Git-Newrev: b60166acf16e24d6369d2ae8085d54fec96fd4c2
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.876588439F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] {linux,
 linux-headers}: bump 6.6.x series
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b60166acf16e24d6369d2ae8085d54fec96fd4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7491f5fabcf7b8192cd689c352eccc04e5c72188)
[Thomas: don't update 6.{12,13}.x, not in 2024.11.x]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ba6853d84c..277ab8617f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
-sha256  894bbbe63b7484a0bc576a1e11a8dbc090fbd476d6424431bdc8435e03c2c208  linux-6.6.83.tar.xz
+sha256  7fd20721551a61db347c5ac6ca05818e24058682be4e4389dc51e88d4ac17ba7  linux-6.6.84.tar.xz
 sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f1d9bcfd78..48d7f9f4ca 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -433,7 +433,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.235"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.179"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.83"	if BR2_KERNEL_HEADERS_6_6
+	default "6.6.84"	if BR2_KERNEL_HEADERS_6_6
 	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
