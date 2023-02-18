Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC18C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D95341624;
	Sat, 18 Feb 2023 11:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D95341624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzD0wxR4qbUN; Sat, 18 Feb 2023 11:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A33741606;
	Sat, 18 Feb 2023 11:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A33741606
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 821AC1BF2F0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69FB141605
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FB141605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asjdEoFYBHyd for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:25:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E12F541600
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E12F541600
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A06051814B9; Sat, 18 Feb 2023 12:25:21 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 12:24:45 +0100
Message-Id: <20230218112449.1753677-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676719521; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=fxI347IZFFygCm4RKVIzzXco83nOKxMjJYi0EeyWM5Q=;
 b=e6brSyzWnBbnKYWXRXjaUqlIvc6BsHO3Xt0aMpoSKJMbjTWEt9KibrBu/OVvkP8eVD6j2X
 +94VwsUaUmmecVW6YYdkomiUY1CI3lcG0PLFWyR2pHj4zswo+WhZLwgDYL8a/fX4e3hWWb
 PlLi4m63mcsk9GUjlpezy7B1XUaOBy4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=e6brSyzW
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.3.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

raise the minimum gcc to 5 as stated in release notes for 3.1.0 [0].

[0] https://github.com/catchorg/Catch2/releases/tag/v3.1.0
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
