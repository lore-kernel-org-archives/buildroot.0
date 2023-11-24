Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8094EC61D97
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 09:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11722613CA;
	Fri, 24 Nov 2023 09:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11722613CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOTYGbU47Adj; Fri, 24 Nov 2023 09:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5439E613D8;
	Fri, 24 Nov 2023 09:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5439E613D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF071BF336
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 09:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9B3E41B8A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 09:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B3E41B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihA9o__ISV-4 for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 09:09:27 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83AF541B68
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 09:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83AF541B68
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8319B1814B9; Fri, 24 Nov 2023 10:09:22 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 10:07:57 +0100
Message-Id: <20231124090758.3299176-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1700816963; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zy52t6lxozVoqqzawDU8LADHwnlBiNehYH97ceO4AOE=;
 b=upcFU96A54wkaMUK9iRUa+jFETTbE04WoQjKe1YbbAureex2VT02k9nWYmbIbF52W+dcHf
 iLjYdP8EYs6wrykfC8eu+jv/mpNXZCmDCTD2aYrbas16WW0bZPyhhIF3XKXFyTruRARx8S
 xytvbHgbPKQo5CrdEIPuTMVB2p6SzQk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=upcFU96A
Subject: [Buildroot] [PATCH] package/re2: bump to version 2023.11.01
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
Cc: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- libabseil-cpp is now a dependency
- raise c++ standard to c++14 (due to abseil) --> requires gcc8
- drop fix for gcc <= 5 introduced in 25fd3b0a523805db14682f7c559cc1c9c366ed55
  (c++ >= 14 is the default for gcc >= 8)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/re2/Config.in |  7 ++++---
 package/re2/re2.hash  |  2 +-
 package/re2/re2.mk    | 13 +++++--------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/re2/Config.in b/package/re2/Config.in
index 64217e8aa2..d3bcad8d1a 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # needs C++14, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
 	  RE2 is a fast, safe, thread-friendly alternative
 	  to backtracking regular expression engines like
@@ -11,7 +12,7 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index a39dece7a9..5f590aba6e 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  cbce8b7803e856827201a132862e41af386e7afd9cc6d9a9bc7a4fa4d8ddbdde  re2-2023-02-01.tar.gz
+sha256  4e6593ac3c71de1c0f322735bc8b0492a72f66ffccfad76e259fa21c41d27d8a  re2-2023-11-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 5587366b1f..b81a64f2e9 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,29 +4,26 @@
 #
 ################################################################################
 
-RE2_VERSION = 2023-02-01
+RE2_VERSION = 2023-11-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
-
-RE2_MAKE_OPTS = \
-	$(TARGET_CONFIGURE_OPTS) \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+RE2_DEPENDENCIES = libabseil-cpp
 
 define RE2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
 endef
 
 define RE2_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
 
 define RE2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
