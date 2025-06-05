Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA9C5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 08:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2868840C29;
	Thu,  5 Jun 2025 08:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gr4Ya2IKvpyT; Thu,  5 Jun 2025 08:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2945F40B7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2945F40B7C;
	Thu,  5 Jun 2025 08:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63342DA
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6005960A71
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz44_AE_wDZz for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 08:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BCE26062E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BCE26062E
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 08:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 868DC87943; Thu,  5 Jun 2025 08:54:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jun 2025 10:52:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b674736ae20c61089cf580db2fe96ffc52d96bfa
X-Git-Newrev: 34b847933e9be109aba328fcbc571efe9b361547
X-Patchwork-Hint: ignore
Message-Id: <20250605085441.868DC87943@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 14}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=34b847933e9be109aba328fcbc571efe9b361547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7552aa4d6c..ddd6515446 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.14.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.14.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 104d42288f..b69793bf63 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  62b12ecd3075a357eb320935657de84e01552803717dad383fa7cc3aa4aa2905  linux-6.14.8.tar.xz
-sha256  df046a48971e40ce0b2e003e7e55b6b1e7da2912120eb216d5d6c8450c9cf82e  linux-6.12.30.tar.xz
-sha256  1d82a82642d281c31d86f7301bc55e12a8a9f9c04532e249ef8ae6fe7dc237ec  linux-6.6.92.tar.xz
-sha256  5779f9caca77f7bfe3c3923b4d760041318db0303de93b2d4691d60e4d41eb74  linux-6.1.140.tar.xz
+sha256  de8b97cfeae74c22f832ee4ca2333c157cc978d98baa122f0ee9c01796a2fe43  linux-6.14.10.tar.xz
+sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
+sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
+sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9c3e98c6dcc7dca7c2e9dd51423eaf0581f5e100d0f04c23bc29f21913dac1d9  linux-5.15.184.tar.xz
-sha256  1fc82737e0e4f0ae0b40f91a00c68f3cb75362e6ae54623ec64b41a51cde0f25  linux-5.10.237.tar.xz
-sha256  34589340c7d76c0de91965e5242f61e9f9f3bacd03e8e34239e5d4660d45372d  linux-5.4.293.tar.xz
+sha256  3d03eb798910f32929f7fda5a56e4bb1a121f10bde320d6f3063639c009313dc  linux-5.15.185.tar.xz
+sha256  07c852940dc2dc03fe84f7fcf697648d7cba11c62d20504380492ba07aa46bb6  linux-5.10.238.tar.xz
+sha256  c879d0ba817aaa0fde318d58d7e1f141d9c29bd8569a96b73159ebc448077b99  linux-5.4.294.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ccaad58e44..efe50f98df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -440,13 +440,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.293"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.237"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.184"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.140"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.92"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.30"	if BR2_KERNEL_HEADERS_6_12
-	default "6.14.8"	if BR2_KERNEL_HEADERS_6_14
+	default "5.4.294"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.238"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.32"	if BR2_KERNEL_HEADERS_6_12
+	default "6.14.10"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
