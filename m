Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AAC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2707A417F8;
	Fri, 12 Jul 2024 09:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMI697NXSsNm; Fri, 12 Jul 2024 09:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCEA417F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DCEA417F9;
	Fri, 12 Jul 2024 09:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2C11BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D2C7845C6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3umYznlQnuP for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D031845C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D031845C2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:53:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2F1885D67; Fri, 12 Jul 2024 09:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:52:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f69f957f289fc715ab913629212448d3799dd168
X-Git-Newrev: b4e6ef2c7ae3c126d7e9af1ddd2be674f382aa06
X-Patchwork-Hint: ignore
Message-Id: <20240712095315.E2F1885D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6declarative: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4e6ef2c7ae3c126d7e9af1ddd2be674f382aa06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-qt6svg to dependencies when qt6svg is available to build the
required svgtoqml host tool:

  Failed to find the host tool "Qt6::svgtoqml".  It is part of the
  Qt6QuickTools package, but the package could not be found.  Make sure you
  have built and installed the host Quick module, which will ensure the
  creation of the Qt6QuickTools package.

Select the host-qt6base Testlib module to build the qmltestrunner host
tool when the qt6base Testlib module is enabled:

  Failed to find the host tool "Qt6::qmltestrunner".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).

Select the host-qt6base Network module to build the qmlprofiler host
tool when the qt6base Network module is enabled:

  Failed to find the host tool "Qt6::qmlprofiler".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).

Add patch to avoid checking for FEATURE_ssl when FEATURE_network
is not available. FEATURE_ssl is defined by the Qt Network module. So
we will get the following build failure if the patch is not applied and
FEATURE_network=ON:

  Attempting to evaluate feature ssl but its definition is missing.  Either
  the feature does not exist or a dependency to the module that defines it is
  missing

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                              |  1 +
 .../0001-Fix-build-with--no-feature-network.patch  | 28 +++++++++
 package/qt6/qt6declarative/Config.in               | 22 +++++++
 package/qt6/qt6declarative/qt6declarative.hash     | 11 ++++
 package/qt6/qt6declarative/qt6declarative.mk       | 67 ++++++++++++++++++++++
 5 files changed, 129 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 81682af476..625134d281 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
+source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
diff --git a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
new file mode 100644
index 0000000000..bef5794229
--- /dev/null
+++ b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
@@ -0,0 +1,28 @@
+From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 2001
+From: Tasuku Suzuki <tasuku.suzuki@signal-slot.co.jp>
+Date: Tue, 21 Nov 2023 23:58:43 +0900
+Subject: Fix build with -no-feature-network
+
+Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93
+Reviewed-by: Ulf Hermann <ulf.hermann@qt.io>
+Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=8377691a0998fd84e6fc8349a5db450bf2d79164
+Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+---
+ src/qml/configure.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake
+index 2d0434643a..d1ff90bd54 100644
+--- a/src/qml/configure.cmake
++++ b/src/qml/configure.cmake
+@@ -82,7 +82,7 @@ qt_feature("qml-ssl" PUBLIC
+     SECTION "QML"
+     LABEL "QML SSL support"
+     PURPOSE "Provides ssl support in QML."
+-    CONDITION QT_FEATURE_ssl
++    CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl
+ )
+ 
+ # On arm and arm64 we need a specialization of cacheFlush() for each OS to be
+-- 
+cgit v1.2.3
diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
new file mode 100644
index 0000000000..0a977ed808
--- /dev/null
+++ b/package/qt6/qt6declarative/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QT6DECLARATIVE
+	bool "qt6declarative"
+	# Enable host test module to ensure that qmltestrunner is built
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6declarative module.
+
+	  https://doc.qt.io/qt-6/qtdeclarative-index.html
+
+if BR2_PACKAGE_QT6DECLARATIVE
+
+config BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	bool "quick module"
+	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT6SHADERTOOLS
+
+endif
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
new file mode 100644
index 0000000000..006b49e4b1
--- /dev/null
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtdeclarative-everywhere-src-6.7.2.tar.xz.sha256
+sha256  4c29cba1af8c42d425d8eb6e01bad24cb80f4b983d71eef566a0542dfdb9b999  qtdeclarative-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
new file mode 100644
index 0000000000..57a89a3b6e
--- /dev/null
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# qt6declaratve
+#
+################################################################################
+
+QT6DECLARATIVE_VERSION = $(QT6_VERSION)
+QT6DECLARATIVE_SITE = $(QT6_SITE)
+QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
+QT6DECLARATIVE_INSTALL_STAGING = YES
+
+QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6DECLARATIVE_CMAKE_BACKEND = ninja
+
+QT6DECLARATIVE_LICENSE = \
+	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
+	BSD-3-Clause (docs), \
+	GFDL-1.3 no invariants (docs), \
+	BSD-3-Clause (examples), \
+	GPL-3.0 (tests), \
+	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)
+
+QT6DECLARATIVE_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6DECLARATIVE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6DECLARATIVE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6DECLARATIVE_DEPENDENCIES = \
+	host-qt6base
+
+QT6DECLARATIVE_DEPENDENCIES = \
+	host-qt6declarative \
+	qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y)
+HOST_QT6DECLARATIVE_DEPENDENCIES += \
+	host-qt6shadertools
+QT6DECLARATIVE_DEPENDENCIES += \
+	host-qt6base \
+	qt6shadertools
+
+# We need host-qt6svg, when qt6svg is available to build the required
+# svgtoqml host tool
+ifeq ($(BR2_PACKAGE_QT6SVG),y)
+HOST_QT6DECLARATIVE_DEPENDENCIES += host-qt6svg
+endif
+
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
