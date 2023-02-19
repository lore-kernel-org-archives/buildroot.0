Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DE5C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E416125C;
	Tue, 21 Feb 2023 01:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3E416125C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6nFdEMrqHB1; Tue, 21 Feb 2023 01:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB3A6129E;
	Tue, 21 Feb 2023 01:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB3A6129E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F72D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBF474182F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF474182F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5tGiQO3Vupw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6D6841805
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6D6841805
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1B728648F; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 21:57:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8
X-Git-Newrev: b3a462e85a786401964d522124e4f431d79339e5
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.D1B728648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/catch2: bump to
 version 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3a462e85a786401964d522124e4f431d79339e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

raise the minimum gcc to 5 as stated in release notes for 3.1.0 [0].

[0] https://github.com/catchorg/Catch2/releases/tag/v3.1.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/catch2/Config.in   | 6 +++---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/catch2/Config.in b/package/catch2/Config.in
index 2f53d197b2..40d2d12434 100644
--- a/package/catch2/Config.in
+++ b/package/catch2/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_CATCH2
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_USE_MMU # fork()
 	help
 	  Catch2 is mainly a unit testing framework for C++, but it
@@ -21,8 +21,8 @@ config BR2_PACKAGE_CATCH2
 
 	  https://github.com/catchorg/Catch2
 
-comment "catch2 needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "catch2 needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 664164fd76..b533792f8f 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2106bccfec18c8ce673623d56780220e38527dd8f283ccba26aa4b8758737d0e  catch2-3.1.1.tar.gz
+sha256  d90351cdc55421f640c553cfc0875a8c834428679444e8062e9187d05b18aace  catch2-3.3.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index ab62cc943b..6e4af3d670 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.1.1
+CATCH2_VERSION = 3.3.1
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
