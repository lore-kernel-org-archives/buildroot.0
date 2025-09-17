Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7190ECAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6BE82283;
	Fri, 19 Sep 2025 12:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kj68A7_CCAvX; Fri, 19 Sep 2025 12:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56796822A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56796822A4;
	Fri, 19 Sep 2025 12:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DFA71290
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8C8D40C27
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIcyUIHmq9sf for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C34B40C14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C34B40C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C08D85E81; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 16:24:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7be8dd89cee2d5a28a21e2d4a06db9b4e6f41829
X-Git-Newrev: 4c6327cc644801f4b61231a621a4ad8f4d9f7766
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.5C08D85E81@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c6327cc644801f4b61231a621a4ad8f4d9f7766
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update the latest kernel releases to:
 - 6.12.44 -> 6.12.47
 - 6.6.103 -> 6.6.106
 - 6.1.149 -> 6.1.152
 - 5.15.190 -> 5.15.193
 - 5.10.241 -> 5.10.244
 - 5.4.297 -> 5.4.299

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 160dd471a7..d5fb71771b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.44" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.47" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8d2b2129ef..8e6506774a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b650210ed3027b224969d148aa377452a9aad3ae7f2851abedd31adfef16bdae  linux-6.12.44.tar.xz
-sha256  d288dd38c3e62ba576ba6b3ad2a84cfba65cd43b702f6c50d1f701aee942b18e  linux-6.6.103.tar.xz
-sha256  c4e906b8d39a5866d25e06371d4de4454fbfaaeb67979a04e4137e807877be39  linux-6.1.149.tar.xz
+sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
+sha256  0c3180e2d8dcd0b70fe83554d9c440e31bab17873e360b89c4ab62a4fd26a8a0  linux-6.6.106.tar.xz
+sha256  1a173be2a9cc886698b8205e639e4482b6cd84ba0be988d519415c7d2bb5b7d9  linux-6.1.152.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  62b814f1a48e1d67764a28611f23ca1f1ce1084ad7f1d319acc05720a9a68604  linux-5.15.190.tar.xz
-sha256  08c1e982064c81f8445a8fff2293d430c716c11fd3185606b8275718d696d8d6  linux-5.10.241.tar.xz
-sha256  f10cfcea7acf7588087d7cc17ebeeb7d3ff783c040536698c544eed7c5e8a841  linux-5.4.297.tar.xz
+sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
+sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
+sha256  88de95aeeb8d941fe61497f5e2e886bed25a79d509aa71ba25a2727fd7f0bf2d  linux-5.4.299.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 38f4863621..4084a36436 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.297"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.241"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.190"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.149"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.103"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.44"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.152"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.106"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.47"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
