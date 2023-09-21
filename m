Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37881E71069
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 13:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCE3B83C2C;
	Thu, 21 Sep 2023 13:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE3B83C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-FwhiCuA0UA; Thu, 21 Sep 2023 13:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198C083B46;
	Thu, 21 Sep 2023 13:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198C083B46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D941E1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFBE783AA8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBE783AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eixy-W-ZepZM for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 13:04:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC4783B46
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 13:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC4783B46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC1BA87490; Thu, 21 Sep 2023 13:04:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 14:59:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f9d6e07f2f333ee3feb5bf1e6966a83ef36f40f
X-Git-Newrev: 00e23b82b4b13a5c4603c3e813f82aa8e9ce248c
X-Patchwork-Hint: ignore
Message-Id: <20230921130413.CC1BA87490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: bump to version 1.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=00e23b82b4b13a5c4603c3e813f82aa8e9ce248c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- tag prefix changed from 'release-' to 'v'
- C++14 is now required which gcc5 already provides
  (tested with bootlin toolchain armv7-eabihf--glibc--stable-2017.05-toolchains-1-1)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtest/Config.in  | 2 +-
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 4591cb5e48..25d756f72c 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index a6dd15a8d2..5b1dcf44a8 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  81964fe578e9bd7c94dfdb09c8e4d6e6759e19967e397dbea48d1c10e45d0df2  gtest-1.12.1.tar.gz
+sha256  8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7  gtest-1.14.0.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index a53253228e..c252ede818 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.12.1
-GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
+GTEST_VERSION = 1.14.0
+GTEST_SITE = $(call github,google,googletest,v$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
