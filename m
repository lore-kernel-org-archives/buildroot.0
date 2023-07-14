Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D77EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F382560A9F;
	Fri, 14 Jul 2023 10:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F382560A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rEptgaGhV7d; Fri, 14 Jul 2023 10:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271FB61435;
	Fri, 14 Jul 2023 10:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271FB61435
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F02521BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA2EA83BBD
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA2EA83BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6dpCioW45pI for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0414583B47
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0414583B47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E86BA8706F; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:03:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b9451cd75f3897cad35e7fd29d82939fc06a50a
X-Git-Newrev: a0ca839ab193a46ed215df9235554458b6c81f21
X-Patchwork-Hint: ignore
Message-Id: <20230714101440.E86BA8706F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{3,
 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0ca839ab193a46ed215df9235554458b6c81f21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 17bf808cdc..cd0a6a38f6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a4542b94b6..c8e72d31a8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a326ab224176c5b17c73c9ccad85f32e49b6e4e764861d57595727b7ef10062c  linux-6.4.2.tar.xz
-sha256  cb7fdefc207dd4e8ef947fccd687126425edce0138ca11191bc0590c678e6cd7  linux-6.3.12.tar.xz
+sha256  7134ed29360df6f37a26410630283f0592c91a6d2178a9648226d30ddf8c88a1  linux-6.4.3.tar.xz
+sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
 sha256  f9a4f91b609f7d332a5f2be01ab86336fa00149fae6bdc19f16fa19f78802d43  linux-6.1.38.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1944d47e4e..d886a4659b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -410,8 +410,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.38"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.12"	if BR2_KERNEL_HEADERS_6_3
-	default "6.4.2"		if BR2_KERNEL_HEADERS_6_4
+	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
+	default "6.4.3"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
