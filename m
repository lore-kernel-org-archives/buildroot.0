Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B9C64EC4
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 14:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB0281959;
	Fri, 17 Feb 2023 14:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB0281959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5rkZjlrfz_I; Fri, 17 Feb 2023 14:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556A181852;
	Fri, 17 Feb 2023 14:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 556A181852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCC81BF28E
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69D81605AD
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D81605AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0A3rvfydC1L for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 14:59:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A97060034
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 14:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A97060034
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7793585FED; Fri, 17 Feb 2023 14:59:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 15:57:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a850f632b9f76b8526f807468548c570b1dc2bd6
X-Git-Newrev: c5b597d5d839486e82a80f1c59c2a91a5af87c06
X-Patchwork-Hint: ignore
Message-Id: <20230217145951.7793585FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5b597d5d839486e82a80f1c59c2a91a5af87c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Catch2 is a modern C++ unit testing framework which is increasing in
popularity.

This package is staging only and allows to build tests to be run on
the target.

- https://github.com/catchorg/Catch2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/catch2/Config.in   | 28 ++++++++++++++++++++++++++++
 package/catch2/catch2.hash |  3 +++
 package/catch2/catch2.mk   | 22 ++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d9c51a094..7894b10e38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2035,6 +2035,7 @@ F:	package/sdl2/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
+F:	package/catch2/
 F:	package/fmt/
 F:	package/grpc/
 F:	package/gtest/
diff --git a/package/Config.in b/package/Config.in
index 523cf7cbdf..6c5238a9b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2012,6 +2012,7 @@ menu "Other"
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
index 0000000000..664164fd76
--- /dev/null
+++ b/package/catch2/catch2.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  2106bccfec18c8ce673623d56780220e38527dd8f283ccba26aa4b8758737d0e  catch2-3.1.1.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
new file mode 100644
index 0000000000..ab62cc943b
--- /dev/null
+++ b/package/catch2/catch2.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# catch2
+#
+################################################################################
+
+CATCH2_VERSION = 3.1.1
+CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
+CATCH2_INSTALL_STAGING = YES
+CATCH2_INSTALL_TARGET = NO
+CATCH2_LICENSE = BSL-1.0
+CATCH2_LICENSE_FILES = LICENSE.txt
+CATCH2_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# We force building a static library only as building a dynamic
+# library is not really supported officially:
+# https://github.com/catchorg/Catch2/blob/devel/docs/faq.md#can-i-compile-catch2-into-a-dynamic-library
+CATCH2_CONF_OPTS = \
+	-DCATCH_INSTALL_DOCS=OFF \
+	-DBUILD_SHARED_LIBS=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
