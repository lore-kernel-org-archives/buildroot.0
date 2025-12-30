Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C135E95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52D06407AD;
	Tue, 30 Dec 2025 11:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsj3FpyA1aeK; Tue, 30 Dec 2025 11:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA4240814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767093298;
	bh=Ry6Re99kqaLhHd8638wYS2uakrDsS7ytiICosBRcg9A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lvd6poMPpJq6tXjaUpXOOIBMgosjYKqfJzx3NwdJ9YWe9bd1a2yS4oJpgS3dfbejm
	 f15T7zqCV9tMl0LxB4jvkw6+Snj+6P+rEpfCuWZrDaZH4pOA6I5rHBKYQscZqMfLpi
	 Kd3NRy6XbRyRCaclyhRpHNCz/Vv1ELIylY+lGiLIFWIVVMNIf/xqpUfGopHkWrmA/J
	 0x9ZgM6/yfJmxXdNq10hgEFZ/hxkNHAFaKZ8YtD7C5ljOy7gW4igpysX4vEK0CBLtD
	 Z9Pd72OftpbSP6lVLcvYNV6wjKywuajFLlXiiEYEE6rvYm0OMECqdX94ib0JemqLCE
	 4W9CQiAnBOWRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA4240814;
	Tue, 30 Dec 2025 11:14:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE4735B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD1CD4026B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPrJax9Z9j-j for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6DB402EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF6DB402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEBDC87C27; Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 12:01:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a2dafb467307035362028f171dc283d54d03153
X-Git-Newrev: 30284242768cc0cc368d4922440a289423fc26cb
X-Patchwork-Hint: ignore
Message-Id: <20251230111444.DEBDC87C27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30284242768cc0cc368d4922440a289423fc26cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Analysis of https://github.com/amzn/hawktracer:
last commit: Aug 2023
last bug report: Nov 2023
last pull request: Nov 2020

The package is broken with cmake 4 and no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/c86/c86d4b2127f09f57c83bbc81bfec847055b67ae7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                   |  6 +++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/hawktracer/Config.in       | 25 --------------------
 package/hawktracer/hawktracer.hash |  3 ---
 package/hawktracer/hawktracer.mk   | 48 --------------------------------------
 6 files changed, 6 insertions(+), 78 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 94d1c4ea08..e0ada2e10d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_HAWKTRACER
+	bool "hawktracer has been removed"
+	select BR2_LEGACY
+	help
+	  hawktracer is unmaintained and has been removed
+
 config BR2_PACKAGE_CONNMAN_GTK
 	bool "connman-gtk has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3a0b2aafa2..44b1e97020 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1262,7 +1262,6 @@ F:	package/cctz/
 F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
-F:	package/hawktracer/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index 06e3782e87..b6e6a31b14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1952,7 +1952,6 @@ endmenu
 
 menu "Logging"
 	source "package/glog/Config.in"
-	source "package/hawktracer/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
deleted file mode 100644
index bee9c27b7d..0000000000
--- a/package/hawktracer/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-config BR2_PACKAGE_HAWKTRACER
-	bool "hawktracer"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	help
-	  HawkTracer is a highly portable, low-overhead, configurable
-	  profiling tool built in Amazon Video for getting performance
-	  metrics from low-end devices.
-
-	  https://hawktracer.github.io/
-
-if BR2_PACKAGE_HAWKTRACER
-
-config BR2_PACKAGE_HAWKTRACER_TCP_LISTENER
-	bool "TCP listener"
-	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-
-comment "TCP listener needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
-
-comment "hawktracer needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
deleted file mode 100644
index 585b612c49..0000000000
--- a/package/hawktracer/hawktracer.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Computed locally
-sha256  12a689a1cfb2ae25ad777b1b2275dbba5cd64905627b0a20d17d6e26de003cef  hawktracer-0.11.0.tar.gz
-sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
deleted file mode 100644
index 8e722080f5..0000000000
--- a/package/hawktracer/hawktracer.mk
+++ /dev/null
@@ -1,48 +0,0 @@
-################################################################################
-#
-# hawktracer
-#
-################################################################################
-
-HAWKTRACER_VERSION = 0.11.0
-HAWKTRACER_SITE = $(call github,amzn,hawktracer,v$(HAWKTRACER_VERSION))
-HAWKTRACER_LICENSE = MIT
-HAWKTRACER_LICENSE_FILES = LICENSE
-HAWKTRACER_INSTALL_STAGING = YES
-
-HAWKTRACER_CONF_OPTS = \
-	-DENABLE_ASAN=OFF \
-	-DENABLE_TESTS=OFF \
-	-DENABLE_CODE_COVERAGE=OFF \
-	-DENABLE_BENCHMARKS=OFF \
-	-DENABLE_DOC=OFF \
-	-DENABLE_PYTHON_BINDINGS=OFF \
-	-DENABLE_MAINTAINER_MODE=OFF \
-	-DENABLE_RELEASE_MODE=OFF \
-	-DENABLE_CLIENT=OFF \
-	-DENABLE_EXAMPLES=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=ON
-else
-HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_HAWKTRACER_TCP_LISTENER),y)
-HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=ON
-else
-HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=OFF
-endif
-
-# Enable threads support if supported by toolchain
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAWKTRACER_CONF_OPTS += \
-	-DENABLE_CPU_USAGE_FEATURE=ON \
-	-DENABLE_THREADS=ON
-else
-HAWKTRACER_CONF_OPTS += \
-	-DENABLE_CPU_USAGE_FEATURE=OFF \
-	-DENABLE_THREADS=OFF
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
