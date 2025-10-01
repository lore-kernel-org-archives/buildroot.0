Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB1CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CBEB83BB8;
	Wed,  1 Oct 2025 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1CZ-p4mIhHd; Wed,  1 Oct 2025 16:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850B383BF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 850B383BF6;
	Wed,  1 Oct 2025 16:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09DCC2A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF772411DE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEaBxjTZtjES for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB95411DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB95411DC
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:43:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D39BC866C3; Wed,  1 Oct 2025 16:43:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Oct 2025 18:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e28e8d34d2ab2b6ba2c37ebcdce4428af8d9015
X-Git-Newrev: 507653a74a0f9c1f7cb0ad0ecba5958f376f0ab5
X-Patchwork-Hint: ignore
Message-Id: <20251001164334.D39BC866C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1, 6, 12,
 16}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=507653a74a0f9c1f7cb0ad0ecba5958f376f0ab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f1c014ba2..4526676432 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8a02b43a67..3e0dff74ee 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81  linux-6.16.7.tar.xz
-sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
-sha256  0c3180e2d8dcd0b70fe83554d9c440e31bab17873e360b89c4ab62a4fd26a8a0  linux-6.6.106.tar.xz
-sha256  1a173be2a9cc886698b8205e639e4482b6cd84ba0be988d519415c7d2bb5b7d9  linux-6.1.152.tar.xz
+sha256  7ac8c8a3cf05476375deaaa85dfcee095a826ffe557b437f43774fc3b64ce58d  linux-6.16.9.tar.xz
+sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
+sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
+sha256  6f1aba92c3d0d21299eebb73161a2056c7c78c6ee77462a7cb705bd8cca8b198  linux-6.1.154.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
 sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d0555ccde4..05e1c7ae90 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -457,10 +457,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.152"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.106"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.47"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.7"	if BR2_KERNEL_HEADERS_6_16
+	default "6.1.154"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.9"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
