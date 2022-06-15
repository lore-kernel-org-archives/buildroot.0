Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE8C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 12:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448BB6102A;
	Wed, 15 Jun 2022 12:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nStxQN9d7gS0; Wed, 15 Jun 2022 12:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4913760B93;
	Wed, 15 Jun 2022 12:25:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE0BD1BF5A1
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 12:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE8D41908
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 12:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Dq4x0tQfOEI for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 12:25:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 391EC410C7
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 12:25:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AC941820C3; Wed, 15 Jun 2022 14:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1655295927; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ArWRRAUasnE1c1Ziy5jpSaCIy5BZhiddOzklfxMFdKs=;
 b=u5gso4CNSzN8ZzMW5wrdJUebtPu1WbnfvIrBhoZkevY/qLPIia6jFrSIDmVeZqRl6V8Xf6
 FY3/79VaNEEnMlmMClqKVpWe86hc06EMQU9aeSVLdLdcAd3wWxdtt7NPSGu5bkHHwlUxiK
 pQJ1R9o1ussYfvVb+wamgCObu/BeDlQ=
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 14:25:04 +0200
Message-Id: <20220615122512.3310535-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2] package/catch2: new package
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

Further it can also be built as host package (similar to
gtest)

- https://github.com/catchorg/Catch2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
--

v2:
  fix name in Config.in comment
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
index 86755bfe18..211e876e16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2027,6 +2027,7 @@ F:	package/gnuplot/
 F:	package/sdl2/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
+F:	package/catch2/
 F:	package/grpc/
 F:	package/gtest/
 F:	package/libabseil-cpp/
diff --git a/package/Config.in b/package/Config.in
index 3b089166da..77ada20db9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1929,6 +1929,7 @@ menu "Other"
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
index 0000000000..8d47257abe
--- /dev/null
+++ b/package/catch2/catch2.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  8c4173c68ae7da1b5b505194a0c2d6f1b2aef4ec1e3e7463bde451f26bbaf4e7  v3.0.1.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
new file mode 100644
index 0000000000..e04b8a6b0a
--- /dev/null
+++ b/package/catch2/catch2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# catch2
+#
+################################################################################
+
+CATCH2_VERSION = 3.0.1
+CATCH2_SOURCE = v$(CATCH2_VERSION).tar.gz
+CATCH2_SITE = https://github.com/catchorg/Catch2/archive
+CATCH2_INSTALL_STAGING = YES
+CATCH2_INSTALL_TARGET = NO
+CATCH2_LICENSE = BSL-1.0
+CATCH2_LICENSE_FILES = LICENSE.txt
+CATCH2_SUPPORTS_IN_SOURCE_BUILD = NO
+
+CATCH2_CONF_OPTS = -DCATCH_INSTALL_DOCS=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
