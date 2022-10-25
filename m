Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EF0FA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 19:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 347BC4014D;
	Tue, 25 Oct 2022 19:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 347BC4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsStsSdhii8D; Tue, 25 Oct 2022 19:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A0D400CE;
	Tue, 25 Oct 2022 19:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A0D400CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D050E1BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 19:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB586605AD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 19:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB586605AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jaoh8vYobMT9 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 19:02:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 322A5600BB
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 322A5600BB
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 19:02:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A8A11814B9; Tue, 25 Oct 2022 21:02:15 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 21:01:09 +0200
Message-Id: <20221025190109.320525-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1666724536; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2Jpl9YVDW8Of9vl1l3rmLhy0WuirW3FNulquR3cfZjI=;
 b=DcgtbplPxko8VIk28zltyU7R1SkP4Bix8eMlAXEnQcIITBwqgKItBpstWm3jRmRIT/Twl7
 ls2zc4r2COCrdd+V6YSyO5BF0/xeqWJXnQXHhvdOj45LhW2VRO2b+2aIS0Vol6qJ1T41ha
 mZfGAJLSXG0UEIv7VNDM5ORnKbJeFcI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=DcgtbplP
Subject: [Buildroot] [PATCH v3] package/catch2: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Catch2 is a modern C++ unit testing framework which is
increasing in popularity.
This package is staging only and allows to build tests
to be run on the target.

- https://github.com/catchorg/Catch2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
--

v2:
 - fix name in Config.in comment

v3:
 - bump to version 3.1.1
 - build as static lib as shared lib is not really supported [0]
 - drop host package

[0] https://github.com/catchorg/Catch2/blob/devel/docs/faq.md
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/catch2/Config.in   | 28 ++++++++++++++++++++++++++++
 package/catch2/catch2.hash |  3 +++
 package/catch2/catch2.mk   | 19 +++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/catch2/Config.in
 create mode 100644 package/catch2/catch2.hash
 create mode 100644 package/catch2/catch2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e0b765ba1..7da9dc48c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2098,6 +2098,7 @@ F:	package/gnuplot/
 F:	package/sdl2/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
+F:	package/catch2/
 F:	package/grpc/
 F:	package/gtest/
 F:	package/libabseil-cpp/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..9e7a68d8e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1968,6 +1968,7 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
+	source "package/catch2/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
 	source "package/clang/Config.in"
diff --git a/package/catch2/Config.in b/package/catch2/Config.in
new file mode 100644
index 0000000000..2f53d197b2
--- /dev/null
+++ b/package/catch2/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_CATCH2
+	bool "catch2"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_USE_MMU # fork()
+	help
+	  Catch2 is mainly a unit testing framework for C++, but it
+	  also provides basic micro-benchmarking features, and simple
+	  BDD macros.
+
+	  Catch2's main advantage is that using it is both simple and
+	  natural. Tests autoregister themselves and do not have to
+	  be named with valid identifiers, assertions look like
+	  normal C++ code, and sections provide a nice way to share
+	  set-up and tear-down code in tests.
+
+	  This package allows running testsuites on the target which
+	  might be advantageous in certain cases.
+
+	  https://github.com/catchorg/Catch2
+
+comment "catch2 needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
new file mode 100644
index 0000000000..76f6aea150
--- /dev/null
+++ b/package/catch2/catch2.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  2106bccfec18c8ce673623d56780220e38527dd8f283ccba26aa4b8758737d0e  v3.1.1.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
new file mode 100644
index 0000000000..b38f88e4da
--- /dev/null
+++ b/package/catch2/catch2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# catch2
+#
+################################################################################
+
+CATCH2_VERSION = 3.1.1
+CATCH2_SOURCE = v$(CATCH2_VERSION).tar.gz
+CATCH2_SITE = https://github.com/catchorg/Catch2/archive
+CATCH2_INSTALL_STAGING = YES
+CATCH2_INSTALL_TARGET = NO
+CATCH2_LICENSE = BSL-1.0
+CATCH2_LICENSE_FILES = LICENSE.txt
+CATCH2_SUPPORTS_IN_SOURCE_BUILD = NO
+
+CATCH2_CONF_OPTS = -DCATCH_INSTALL_DOCS=OFF \
+					-DBUILD_SHARED_LIBS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
