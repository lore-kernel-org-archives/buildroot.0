Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188BBCD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F4460743;
	Sat, 31 Aug 2024 21:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6D1DiJ5MvAc; Sat, 31 Aug 2024 21:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE7ED60708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7ED60708;
	Sat, 31 Aug 2024 21:49:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4D71BF867
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4862A80D3B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sE_D4AqYy1Mj for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 21:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED4C80D0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED4C80D0E
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 21:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 379D986823; Sat, 31 Aug 2024 21:49:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 23:40:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b85e841e1df829dd714798425fbc14af8c016349
X-Git-Newrev: d6ccd591137bc226158c8186c115f0a10e46c118
X-Patchwork-Hint: ignore
Message-Id: <20240831214953.379D986823@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 9}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6ccd591137bc226158c8186c115f0a10e46c118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b5e2f8287a73f33ac82da78f4b75c6289612510e)
[Peter: drop 6.9.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ddaaa8d2a7..f0ae89bcc7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.37" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.41" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 376de08642..bae766e0e5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f3976e77708694fe4a1f8d1307c315c8a36cbc58f038a38e006b91e29a1f3214  linux-6.6.37.tar.xz
-sha256  890b845f36452328716e62dd893b634584f607cdd44b4e685392d302d3be41af  linux-6.1.97.tar.xz
+sha256  9ec99c578158ab85d99b37791a76643d2ea4c3f72ecbef7b5eb6d60f3de032ef  linux-6.6.41.tar.xz
+sha256  b9aa6ec1a00f234d6c6f2d428fbb0a6bf459606c259263df978f86685b65a8b9  linux-6.1.100.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
-sha256  da1dd47febac4f7856654038a47703666da3afba348b8e96e39584e0972e2725  linux-5.10.221.tar.xz
-sha256  b298436b26395b5c3ace6963836ba70d57cd61e01cff254b0e5443636c324a5e  linux-5.4.279.tar.xz
+sha256  025fc7d8b1560cf456ccae50591fe1ca21c990645df9791aed25820fe78db302  linux-5.15.163.tar.xz
+sha256  7b2d06803b5abb03c85f171100ca9d7acd6ba245036fe9a16eb998f088b150cb  linux-5.10.222.tar.xz
+sha256  a976c67eb8270cac310faf1acc61305d1f9967955aca38fbdfcb0bc77d033d42  linux-5.4.280.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  062b70cc132378e1c685df44ddf7e05bab4752b690ada17b080655a63f993581  linux-4.19.317.tar.xz
+sha256  0d5fa562a3c53f524f02fc11abe502c01096df73dd27d57736875e8590007493  linux-4.19.318.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a71eeb141b..4f485d5188 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.317"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.279"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.221"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.162"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.97"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.37"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.318"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.280"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.222"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.163"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.100"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.41"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
