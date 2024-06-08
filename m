Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B6C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E0283298;
	Sat,  8 Jun 2024 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3YxA6JFfgli; Sat,  8 Jun 2024 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87C682640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87C682640;
	Sat,  8 Jun 2024 13:01:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9EE1BF47E
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A5A3606B3
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7aOFWKSw8We for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD54606A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DD54606A9
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7797887DCE; Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 13:49:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 72b0c440e8914357b9a699ad9b9ed34c38f91041
X-Git-Newrev: ab0d9104e924847eacb1759a304d545b48ae1bda
X-Patchwork-Hint: ignore
Message-Id: <20240608130122.7797887DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 8}.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab0d9104e924847eacb1759a304d545b48ae1bda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a28bc67ce5f37661275c90904db7929c2416dc88)
[Peter: drop 6.8.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0a73bb9d67..696eac327e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.27" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.30" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ff681acbaf..e9ca02101c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  639e50060e3c8f23ed017cb10cfeacc6ba88ff5583812bb76859b4cc6a128291  linux-6.6.27.tar.xz
-sha256  d3d3c8c44f0f0a870a95bd2823f9d91979d1aa6f266da5d8cccd0c4b15e3115b  linux-6.1.86.tar.xz
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  83a3d72e764fceda2c1fc68a4ea6b91253a28da56a688a2b61776b0d19788e1d  linux-6.1.90.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c85859b86d2e6d1fc91ca1be8b44f24a9b5bb9f86869b04a8665a3a6559126e4  linux-5.15.155.tar.xz
-sha256  879ca159c34ea9d3a6775f292cc59c2d3931d57dca00f0bebe2675ea0c82c6a9  linux-5.10.215.tar.xz
-sha256  eac7b421a43cd46a3dbebf7c85d075faa7e164d80d215d31fcd35544b6f79ed4  linux-5.4.274.tar.xz
+sha256  f9071c83a4fd8b80af026b48cfc1869bfa25883f9148b92b5dc1e1e1e26dd5c6  linux-5.15.158.tar.xz
+sha256  e310588c4b23f0959614e60f007afc20e9b1a8f296d682b041fa129f96fbe151  linux-5.10.216.tar.xz
+sha256  dad2b068946f0ca0026130d7ab17601d5074d90b381379c4479314d4edf4304c  linux-5.4.275.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  a394fa5ffe321ee43dae9cccc724572f49fbb289875d39ea695adf712e51f74a  linux-4.19.312.tar.xz
+sha256  a8145e2ecf8437b6d06400c3358a595c47a74443b164890cf12a07d8722539c8  linux-4.19.313.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 70e4493a64..17f5d8b999 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.312"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.274"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.215"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.155"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.86"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.27"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.313"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.275"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.216"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.158"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.90"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.30"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
