Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1E1C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED12740919;
	Mon, 24 Mar 2025 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SF4rJzOrLgzM; Mon, 24 Mar 2025 20:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1115340B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1115340B6E;
	Mon, 24 Mar 2025 20:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA59E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F3DF60BDD
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJmuDDg7KQo5 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8135360C28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8135360C28
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:21:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9F76827B3; Mon, 24 Mar 2025 20:21:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 21:18:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b4048c132254717a9ffc2428afe798b8d8b8dfd
X-Git-Newrev: 7491f5fabcf7b8192cd689c352eccc04e5c72188
X-Patchwork-Hint: ignore
Message-Id: <20250324202108.C9F76827B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12,
 13}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=7491f5fabcf7b8192cd689c352eccc04e5c72188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c2f730709b..cdcf7e8c23 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.13.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.13.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a8f37fd097..10aaed1d3f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3a39b62038b7ac2f43d26a1f84b4283e197804e1e817ad637e9a3d874c47801d  linux-6.13.7.tar.xz
-sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
-sha256  894bbbe63b7484a0bc576a1e11a8dbc090fbd476d6424431bdc8435e03c2c208  linux-6.6.83.tar.xz
+sha256  259afa59d73d676bec2ae89beacd949e08d54d3f70a7f8b0a742315095751abb  linux-6.13.8.tar.xz
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
+sha256  7fd20721551a61db347c5ac6ca05818e24058682be4e4389dc51e88d4ac17ba7  linux-6.6.84.tar.xz
 sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9be5957596..0a07d657b2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -440,9 +440,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.235"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.179"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.83"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.19"	if BR2_KERNEL_HEADERS_6_12
-	default "6.13.7"	if BR2_KERNEL_HEADERS_6_13
+	default "6.6.84"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.20"	if BR2_KERNEL_HEADERS_6_12
+	default "6.13.8"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
