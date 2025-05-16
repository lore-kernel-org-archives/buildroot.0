Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B16C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 12:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C589060E22;
	Fri, 16 May 2025 12:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZK_3JzL7xWD; Fri, 16 May 2025 12:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7523606B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7523606B1;
	Fri, 16 May 2025 12:33:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FDF0185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E37840A86
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v4G4X2PIWBB for <buildroot@buildroot.org>;
 Fri, 16 May 2025 12:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A8384044F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A8384044F
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A8384044F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:33:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58D6A1814B9; Fri, 16 May 2025 14:33:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 14:33:35 +0200
Message-ID: <20250516123337.799148-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1747398833; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=DCP4fj75PIA34GGk7eviP0uyZ8qjMNvkm/pj0W9ZcnI=;
 b=KuYFDzD4LM15RFAz7p2tJtelpGRZbrOtMCNoVdAImANE2hy0dVSz8ynwzfCpPDe4iCQavD
 7RnqDfEiaNqir7+ShJBb2Un7RqV6fjI98NKUs7iVgVZ8nxpTlPCSgxgcrlmQ5fTjc3VTEW
 mSh81BYCLv6atoUlzk+V0rGpMsjaNPM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=KuYFDzD4
Subject: [Buildroot] [PATCH] package/gtest: bump to version 1.17.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

- bump gcc minimum to 7 as C++17 support is mandatory

Release Notes: https://github.com/google/googletest/releases

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/gtest/Config.in  | 6 +++---
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 25d756f72c..695e504aa2 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
@@ -44,7 +44,7 @@ config BR2_PACKAGE_GTEST_GMOCK
 
 endif # BR2_PACKAGE_GTEST
 
-comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
+comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index d7c1c15921..95cd4adc85 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  78c676fc63881529bf97bf9d45948d905a66833fbfa5318ea2cd7478cb98f399  gtest-1.16.0.tar.gz
+sha256  65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c  gtest-1.17.0.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 77b2c7aa0e..1eab9371a1 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.16.0
+GTEST_VERSION = 1.17.0
 GTEST_SITE = $(call github,google,googletest,v$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
