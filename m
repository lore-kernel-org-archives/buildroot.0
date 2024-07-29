Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD74C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C543E60862;
	Mon, 29 Jul 2024 17:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0K4GUp_8fuKK; Mon, 29 Jul 2024 17:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C2F60647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C2F60647;
	Mon, 29 Jul 2024 17:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9991BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F16404D2
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K78veB3FhsWu for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5293A4033A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5293A4033A
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D10C82BD0; Mon, 29 Jul 2024 17:58:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 19:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddbdd3584264900b6d5818c1cf0a0a444d298f56
X-Git-Newrev: e08708451be9e964b5a8e3a5a6f0959ad5e7c6a0
X-Patchwork-Hint: ignore
Message-Id: <20240729175834.4D10C82BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 9, 10}.x series
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e08708451be9e964b5a8e3a5a6f0959ad5e7c6a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9da1db16d1..4bdca6fafe 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 2d2b6d3546..d1d0132c96 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  70109dfd1cd1c5f8a58eb1cb37122b9bf93f9c6a6280bf91019263c7339cf76b  linux-6.10.1.tar.xz
-sha256  efd12e335fa67d13a3eae30e4b7b7546e74b8ccc90682e4c3fffab0b22654da1  linux-6.9.10.tar.xz
-sha256  9ec99c578158ab85d99b37791a76643d2ea4c3f72ecbef7b5eb6d60f3de032ef  linux-6.6.41.tar.xz
-sha256  b9aa6ec1a00f234d6c6f2d428fbb0a6bf459606c259263df978f86685b65a8b9  linux-6.1.100.tar.xz
+sha256  73d8520dd9cba5acfc5e7208e76b35d9740b8aae38210a9224e32ec4c0d29b70  linux-6.10.2.tar.xz
+sha256  5ae7cc4e0e2f6b9ba630f643985ba0522c7d5e5b9571ba478a3cb513edd4cf22  linux-6.9.12.tar.xz
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
index 707f2ad026..d745e31155 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -427,14 +427,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.318"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.280"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.222"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.163"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.100"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.41"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.10"	if BR2_KERNEL_HEADERS_6_9
-	default "6.10.1"	if BR2_KERNEL_HEADERS_6_10
+	default "4.19.319"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.102"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.43"	if BR2_KERNEL_HEADERS_6_6
+	default "6.9.12"	if BR2_KERNEL_HEADERS_6_9
+	default "6.10.2"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
