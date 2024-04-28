Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BDFC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6F3B60679;
	Sun, 28 Apr 2024 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN_g0D5lBqwU; Sun, 28 Apr 2024 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D6CD6074A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6CD6074A;
	Sun, 28 Apr 2024 18:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F15201BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C717340105
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QefQhwtNtM5Y for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B3F4016F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B3F4016F
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3CD6861F6; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:12:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a2a1c3831fc8b6224097e2e1ecc299da3516c34
X-Git-Newrev: 9c592ecd3e599598856668736468b3ee54d8ceee
X-Patchwork-Hint: ignore
Message-Id: <20240428182741.C3CD6861F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 8}.x series
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c592ecd3e599598856668736468b3ee54d8ceee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2767b709d4..e8dc79c822 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d66bb54b5e..7154fc75bf 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
-sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
-sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
+sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
+sha256  639e50060e3c8f23ed017cb10cfeacc6ba88ff5583812bb76859b4cc6a128291  linux-6.6.27.tar.xz
+sha256  d3d3c8c44f0f0a870a95bd2823f9d91979d1aa6f266da5d8cccd0c4b15e3115b  linux-6.1.86.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f0805225f4a5b24d0bba9302c2c2f261c04f737ac5dd931da9b112e9f3e4a47e  linux-5.15.152.tar.xz
-sha256  84cf30223239ec3333a5f7b2a7fba2042bba70d1582a139f7543956af871ad80  linux-5.10.213.tar.xz
-sha256  3599d5959a403e64be407d7f05e56cb270d6ddd154e89a596609919ab1e2e366  linux-5.4.272.tar.xz
+sha256  c85859b86d2e6d1fc91ca1be8b44f24a9b5bb9f86869b04a8665a3a6559126e4  linux-5.15.155.tar.xz
+sha256  879ca159c34ea9d3a6775f292cc59c2d3931d57dca00f0bebe2675ea0c82c6a9  linux-5.10.215.tar.xz
+sha256  eac7b421a43cd46a3dbebf7c85d075faa7e164d80d215d31fcd35544b6f79ed4  linux-5.4.274.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  95ec94c4ab8f46d8a54430893f9bd653c46b0f1587d216818aa8f52fd313de69  linux-4.19.310.tar.xz
+sha256  a394fa5ffe321ee43dae9cccc724572f49fbb289875d39ea695adf712e51f74a  linux-4.19.312.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 78ba644c95..5fe34456de 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -415,13 +415,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.310"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.272"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.213"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.152"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.22"	if BR2_KERNEL_HEADERS_6_6
-	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
+	default "4.19.312"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.274"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.215"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.155"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.86"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.27"	if BR2_KERNEL_HEADERS_6_6
+	default "6.8.6"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
