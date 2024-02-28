Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97352C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 11:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45841608CB;
	Wed, 28 Feb 2024 11:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1oMM6s92oeW; Wed, 28 Feb 2024 11:46:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB2660908
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB2660908;
	Wed, 28 Feb 2024 11:46:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B89F51BF337
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A9F608CB
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5STWFSEZ5Yi6 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 11:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 070DB60593
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 070DB60593
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 11:46:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E80CF8730B; Wed, 28 Feb 2024 11:46:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 12:45:07 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 33d1faaa6d27c4d1b725ed463aeaefab4aed9e3b
X-Git-Newrev: 8c37a00e2d740d981d722c268805d8336d36c5b4
X-Patchwork-Hint: ignore
Message-Id: <20240228114602.E80CF8730B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c37a00e2d740d981d722c268805d8336d36c5b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02692b723a0140196f40e00f47c6a307954c09dd)
[Peter: drop 6.6.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e9f5ffe9e4..a410b1395d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.72" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.74" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ec86d5fe5c..a0d8a5769f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  98dce69077c35cffca799dcdbbd32a02242aad6b0950eb931936bb2ef69f0926  linux-6.1.72.tar.xz
+sha256  b7fbd1d79faed2ce3570ef79dc1223e4e19c868b86326b14a435db56ebbb2022  linux-6.1.74.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  5a807a5fa2a80ada957d8079681dfb5cc196ec26f43244d1c8a4fd7af592d192  linux-5.15.146.tar.xz
-sha256  86ace9892296bf1534d574894edd27614b68de4085c03fd3f60121751a334f1b  linux-5.10.207.tar.xz
-sha256  da072f7e6fe719c01e517cac1fa9988b2f5fa87d62a8501b7dc16d3b62b2acb6  linux-5.4.266.tar.xz
+sha256  56c1e65625d201db431efda7a3816e7b424071e7cb0245b2ba594d15b1fdfcd4  linux-5.15.147.tar.xz
+sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-5.10.208.tar.xz
+sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  cdc6a5d51aaff7c50bfe4ac4adf5cc3727043a24641145dc268e858db2a4b598  linux-4.19.304.tar.xz
+sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8c30ce2e78..a3e9659d5c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -385,11 +385,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.304"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.266"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.207"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.72"	if BR2_KERNEL_HEADERS_6_1
+	default "4.19.305"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.267"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.208"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.147"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.74"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
