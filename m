Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E7CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCABD417F4;
	Thu, 25 Sep 2025 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYNj-sxXpvqF; Thu, 25 Sep 2025 20:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0706D41850
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0706D41850;
	Thu, 25 Sep 2025 20:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0234F177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE50441609
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygW3CDY9KeBH for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE7F415F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE7F415F1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8703A86433; Thu, 25 Sep 2025 20:30:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 14:56:14 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: efdc54b8343223cfe02145e1bc8e1fa6a67dc827
X-Git-Newrev: 758e9121a091dbb7e65bb48c1c0c368ba34a2a51
X-Patchwork-Hint: ignore
Message-Id: <20250925203021.8703A86433@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] {linux,
 linux-headers}: bump 6.16.x, 6.12.x, 6.6.x, 6.1.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=758e9121a091dbb7e65bb48c1c0c368ba34a2a51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Update the latest kernel releases to:
 - 6.16.7 -> 6.16.8
 - 6.12.47 -> 6.12.48
 - 6.6.106 -> 6.6.107
 - 6.1.152 -> 6.1.153

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f1c014ba2..c5f01f81c1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8a02b43a67..a2dee7e596 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81  linux-6.16.7.tar.xz
-sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
-sha256  0c3180e2d8dcd0b70fe83554d9c440e31bab17873e360b89c4ab62a4fd26a8a0  linux-6.6.106.tar.xz
-sha256  1a173be2a9cc886698b8205e639e4482b6cd84ba0be988d519415c7d2bb5b7d9  linux-6.1.152.tar.xz
+sha256  231311bd7084dc3129944d26bb43be6ff837da82fb2104a67704aebca8bfa69f  linux-6.16.8.tar.xz
+sha256  5bf9eb676751bf48978e38363c772298b41a75336d5038ed6d37012399471db2  linux-6.12.48.tar.xz
+sha256  c9b73017d3c7867b9c69a542e5318620cf2b14ed23d52f6aeaaee8aded9ee447  linux-6.6.107.tar.xz
+sha256  76ebbde05899ff712856ae9b06413d71ab7162771e7bc6df4d4ab335e1fc9e48  linux-6.1.153.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
 sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d0555ccde4..3a2f0dd798 100644
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
+	default "6.1.153"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.107"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.48"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.8"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
