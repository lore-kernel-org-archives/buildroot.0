Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792B5CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6290C80F94;
	Fri, 19 Sep 2025 12:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UVLnlcIf7LV; Fri, 19 Sep 2025 12:54:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 869D880E4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 869D880E4A;
	Fri, 19 Sep 2025 12:54:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED37F1D74
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE0940C34
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kk6Tbo0h_Ok2 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B67E40C23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B67E40C23
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE02385FD5; Fri, 19 Sep 2025 12:54:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 16:26:12 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 3386677f0a4d1c0150e772eb07cede05e88a2d6d
X-Git-Newrev: 88c3dac5dd4411a7cd484749a234d4df1ba68f18
X-Patchwork-Hint: ignore
Message-Id: <20250919125410.EE02385FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] {linux,
 linux-headers}: bump 6.16.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x,
 5.4.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=88c3dac5dd4411a7cd484749a234d4df1ba68f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Update the latest kernel releases to:
 - 6.16.5 -> 6.16.7
 - 6.12.45 -> 6.12.47
 - 6.6.104 -> 6.6.106
 - 6.1.150 -> 6.1.152
 - 5.15.191 -> 5.15.193
 - 5.10.242 -> 5.10.244
 - 5.4.298 -> 5.4.299

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e5c08d91c6..1f1c014ba2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bd876d5ee8..8a02b43a67 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  76bffbae7eab2a1de1ed05692bef709f43b02a52fe95ae655cacf0fa252213f3  linux-6.16.5.tar.xz
-sha256  8f95a8549cfbdfb89c1181a1f55a971f04dfcd629508a2ed70b777ab92f9db3e  linux-6.12.45.tar.xz
-sha256  2a772f9d661afabaaddcdfd1116239acb2d943377aceab9e0baed2b7a915e36a  linux-6.6.104.tar.xz
-sha256  001bffcc08e2b544fb507c0588f9270f8b5b1138508a4be1205492e3c57824ef  linux-6.1.150.tar.xz
+sha256  5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81  linux-6.16.7.tar.xz
+sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
+sha256  0c3180e2d8dcd0b70fe83554d9c440e31bab17873e360b89c4ab62a4fd26a8a0  linux-6.6.106.tar.xz
+sha256  1a173be2a9cc886698b8205e639e4482b6cd84ba0be988d519415c7d2bb5b7d9  linux-6.1.152.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7a2db3ac34a3edb6f497204cc287497c29bb3218fdb7876951f8bceac46e924e  linux-5.15.191.tar.xz
-sha256  bc3ae7003174e26c9a39534cfb8d66cee1a0ba6e1dd0381a9fe092f9de6ba9cd  linux-5.10.242.tar.xz
-sha256  01163bed1abadc1e5e6480f0d694c360281cbff3446023c2e015f1e24504e4e6  linux-5.4.298.tar.xz
+sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
+sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
+sha256  88de95aeeb8d941fe61497f5e2e886bed25a79d509aa71ba25a2727fd7f0bf2d  linux-5.4.299.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f8a259b2c0..d0555ccde4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,13 +454,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.298"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.242"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.191"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.150"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.104"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.45"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.5"	if BR2_KERNEL_HEADERS_6_16
+	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.152"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.106"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.47"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.7"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
