Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C8C46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 10:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDE561449;
	Mon, 18 Sep 2023 10:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDE561449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DR5kS5dBnygQ; Mon, 18 Sep 2023 10:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA8B60E8D;
	Mon, 18 Sep 2023 10:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA8B60E8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3351BF36C
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 10:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 533A84049A
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 10:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 533A84049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTXT8eddNxcC for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 10:30:56 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D88140494
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 10:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D88140494
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2116C1814B9; Mon, 18 Sep 2023 12:30:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 12:30:35 +0200
Message-Id: <20230918103035.3022611-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1695033053; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Ce0iHbh/uQiXAA1j0r3Dy8bdscgAt7ZEzPSOUd7DwaY=;
 b=ShOzm7MlDgf/POpRw6FDDum67/lzpaUn8iSFvSXf8mooblmRF++X8j5Jij6ejLbMMymaJ4
 rurGODVwbwc7z0hZnGlKHV53F1Hj5fK0lYb85jfABunbWFEu27GWqKo61+/liOtDt7dQ6+
 IT4HhAgOq3ym8zaS2QqZ44Zz0Jz65Ng=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=ShOzm7Ml
Subject: [Buildroot] [PATCH] package/gtest bump to version 1.14.0
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
Cc: Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- tag prefix changed from 'release-' to 'v'
- C++14 is now required which gcc5 already provides
  (tested with bootlin toolchain armv7-eabihf--glibc--stable-2017.05-toolchains-1-1)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
