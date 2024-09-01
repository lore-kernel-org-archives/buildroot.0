Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E960C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EDEE810AE;
	Sun,  1 Sep 2024 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yb5CZj0pcegH; Sun,  1 Sep 2024 17:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368E0810B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368E0810B1;
	Sun,  1 Sep 2024 17:07:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26D381BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 212AF402C3
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 17:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_fFYK-3omTq for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 17:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED20F40022
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED20F40022
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 17:07:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2FD886926; Sun,  1 Sep 2024 17:07:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 19:05:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0f1290e907013abf9fb7847b8cfc7e9954cad60a
X-Git-Newrev: 44df2369d302d665f5481c7917f22abd1e3618c5
X-Patchwork-Hint: ignore
Message-Id: <20240901170714.E2FD886926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 9, 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=44df2369d302d665f5481c7917f22abd1e3618c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e08708451be9e964b5a8e3a5a6f0959ad5e7c6a0)
[Peter: Drop 6.9.x / 6.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f0ae89bcc7..844fcb3a6b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.41" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.43" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bae766e0e5..4f4d6a22e8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9ec99c578158ab85d99b37791a76643d2ea4c3f72ecbef7b5eb6d60f3de032ef  linux-6.6.41.tar.xz
-sha256  b9aa6ec1a00f234d6c6f2d428fbb0a6bf459606c259263df978f86685b65a8b9  linux-6.1.100.tar.xz
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
+sha256  1ba5f93b411ead7587fe48b2eec6c656f6796d31f5e406d236913c77512497ec  linux-6.1.102.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  025fc7d8b1560cf456ccae50591fe1ca21c990645df9791aed25820fe78db302  linux-5.15.163.tar.xz
-sha256  7b2d06803b5abb03c85f171100ca9d7acd6ba245036fe9a16eb998f088b150cb  linux-5.10.222.tar.xz
-sha256  a976c67eb8270cac310faf1acc61305d1f9967955aca38fbdfcb0bc77d033d42  linux-5.4.280.tar.xz
+sha256  ec6098faed64b8a47ba1772e812a6eb444385f7aa3c60d3e4739ab2fd3b29186  linux-5.15.164.tar.xz
+sha256  ca09d86a6b79706c33382d3f8606f476eb07918417a87fb1815f6a4aa81f2ba1  linux-5.10.223.tar.xz
+sha256  44a0c3e76031f7513ce43e22e2a9dcbf7d6a6dee065dca9b8001843a075272b2  linux-5.4.281.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  0d5fa562a3c53f524f02fc11abe502c01096df73dd27d57736875e8590007493  linux-4.19.318.tar.xz
+sha256  544ddc7339cf1b1d1ead1992e67d11a0834ad3bc77faa063e06b5d18c682eb30  linux-4.19.319.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4f485d5188..62f10b1827 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.318"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.280"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.222"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.163"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.100"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.41"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.319"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.102"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.43"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
