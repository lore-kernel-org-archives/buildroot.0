Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0CDCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10AA7404E6;
	Thu,  4 Sep 2025 16:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJlLPinKs_Dd; Thu,  4 Sep 2025 16:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318CA404CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318CA404CC;
	Thu,  4 Sep 2025 16:15:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0F9106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9734080783
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgxR1HCYnDtU for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB0080795
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EB0080795
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE7687F0E; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4a2f2973e33eb4eedda903f253975fb70b2c7884
X-Git-Newrev: d63f8ad6ad548e6e73d384918f212cbed1a7d332
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.4CE7687F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 5.4.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=d63f8ad6ad548e6e73d384918f212cbed1a7d332
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update the latest kernel releases to:
 - 6.12.41 -> 6.12.44
 - 6.6.101 -> 6.6.103
 - 6.1.147 -> 6.1.149
 - 5.15.189 -> 5.15.190
 - 5.10.240 -> 5.10.241
 - 5.4.296 -> 5.4.297

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b36f926c18..e3a7fb1e4c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.41" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.44" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9c39093397..8d2b2129ef 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
-sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
-sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
+sha256  b650210ed3027b224969d148aa377452a9aad3ae7f2851abedd31adfef16bdae  linux-6.12.44.tar.xz
+sha256  d288dd38c3e62ba576ba6b3ad2a84cfba65cd43b702f6c50d1f701aee942b18e  linux-6.6.103.tar.xz
+sha256  c4e906b8d39a5866d25e06371d4de4454fbfaaeb67979a04e4137e807877be39  linux-6.1.149.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
-sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
-sha256  3d63614e58bf1befaba3f5713145200d09f26e564832c8948094fdf5b11fa73a  linux-5.4.296.tar.xz
+sha256  62b814f1a48e1d67764a28611f23ca1f1ce1084ad7f1d319acc05720a9a68604  linux-5.15.190.tar.xz
+sha256  08c1e982064c81f8445a8fff2293d430c716c11fd3185606b8275718d696d8d6  linux-5.10.241.tar.xz
+sha256  f10cfcea7acf7588087d7cc17ebeeb7d3ff783c040536698c544eed7c5e8a841  linux-5.4.297.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cece9858dd..38f4863621 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.297"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.241"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.190"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.149"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.103"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.44"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
