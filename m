Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF11EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2066F60812;
	Thu, 20 Jul 2023 21:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2066F60812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdi85RtBS9_7; Thu, 20 Jul 2023 21:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4959C612C1;
	Thu, 20 Jul 2023 21:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4959C612C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDA361BF980
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B78B360812
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B78B360812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HAQP5r0gFam for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:30:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B4F607C9
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B4F607C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C461E874F3; Thu, 20 Jul 2023 21:30:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:30:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5037426d2bd12b78f52270164158f423e20ccc85
X-Git-Newrev: cd8028b2201816db11ad9f55b34fea459de81a04
X-Patchwork-Hint: ignore
Message-Id: <20230720213037.C461E874F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.3.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd8028b2201816db11ad9f55b34fea459de81a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.3.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5c7e13fd5d..2678e0ca70 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_KERNEL_HEADERS_6_3
+	bool "kernel headers version 6.3.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.3.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_TOVID
 	bool "tovid removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 1d63d4226b..7541ae9123 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  9cbc4a2be714a4d154e1312c9f33ded91174907c8b15ee936ad27002ac75ff2a  linux-6.4.4.tar.xz
-sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
 sha256  4cddee22fdf657138a06af653492f67cd3a4762c04a34725534bd200d99085b8  linux-6.1.39.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9c8bbbe2c0..6eb7b3577b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
-config BR2_KERNEL_HEADERS_6_3
-	bool "Linux 6.3.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3
-
 config BR2_KERNEL_HEADERS_6_4
 	bool "Linux 6.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
@@ -410,7 +406,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.39"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default "6.4.4"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
