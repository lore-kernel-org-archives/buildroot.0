Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C62EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12E2841802;
	Fri, 12 Jul 2024 09:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLvsPYgt9aK0; Fri, 12 Jul 2024 09:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B56244180F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B56244180F;
	Fri, 12 Jul 2024 09:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4028E1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DDD5845D2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzxYlDv4fIWE for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C8D3845C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C8D3845C4
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:53:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BE7785D38; Fri, 12 Jul 2024 09:53:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:52:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d72cea4e6c87bde09b8857946ad688e8e74bc2ba
X-Git-Newrev: e514277a53ca997d0567754035e8b453396e173b
X-Patchwork-Hint: ignore
Message-Id: <20240712095316.1BE7785D38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6wayland: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e514277a53ca997d0567754035e8b453396e173b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-qt6wayland as dependency to build the qtwaylandscanner host
tool:

  Failed to find the host tool "Qt6::qtwaylandscanner".  It is part of the
  Qt6WaylandScannerTools package, but the package could not be found.  Make
  sure you have built and installed the host WaylandScanner module, which
  will ensure the creation of the Qt6WaylandScannerTools package.

Select the qt6base and host-qt6base Gui modules to avoid skipping the
build:

  Skipping the build as the condition "TARGET Qt::Gui" is not met.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6wayland/Config.in       | 28 ++++++++++++++++
 package/qt6/qt6wayland/qt6wayland.hash | 11 ++++++
 package/qt6/qt6wayland/qt6wayland.mk   | 61 ++++++++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 16f792cff3..69ce0b3f6a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,6 +51,7 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6wayland/Config.in b/package/qt6/qt6wayland/Config.in
new file mode 100644
index 0000000000..bda13dd12f
--- /dev/null
+++ b/package/qt6/qt6wayland/Config.in
@@ -0,0 +1,28 @@
+comment "qt6wayland needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+config BR2_PACKAGE_QT6WAYLAND
+	bool "qt6wayland"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_QT6BASE_GUI
+	# needed because we build host-qt6wayland
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6wayland module.
+
+	  https://doc.qt.io/qt-6/qtwayland-index.html
+
+if BR2_PACKAGE_QT6WAYLAND
+
+config BR2_PACKAGE_QT6WAYLAND_COMPOSITOR
+	bool "Enable compositor (experimental)"
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  The compositor API is still experimental, and not built by
+	  default.
+
+endif
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
new file mode 100644
index 0000000000..3d0ded7bec
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtwayland-everywhere-src-6.7.2.tar.xz.sha256
+sha256  a2a057e1dd644bd44abb9990fecc194b2e25c2e0f39e81aa9fee4c1e5e2a8a5b  qtwayland-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.mk b/package/qt6/qt6wayland/qt6wayland.mk
new file mode 100644
index 0000000000..29fc25edb0
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt6wayland
+#
+################################################################################
+
+QT6WAYLAND_VERSION = $(QT6_VERSION)
+QT6WAYLAND_SITE = $(QT6_SITE)
+QT6WAYLAND_SOURCE = qtwayland-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WAYLAND_VERSION).tar.xz
+QT6WAYLAND_INSTALL_STAGING = YES
+
+QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WAYLAND_CMAKE_BACKEND = ninja
+
+QT6WAYLAND_LICENSE = \
+	BSD-3-Clause (examples, tests), \
+	GPL-3.0 (compositor), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
+	GPL-3.0 WITH Qt-GPL-exception-1.0 (tests), \
+	GFDL-1.3 no invariants (docs)
+
+QT6WAYLAND_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WAYLAND_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DFEATURE_wayland_client=ON
+
+# host-qt6wayland needed to build the qtwaylandscanner host tool
+QT6WAYLAND_DEPENDENCIES = \
+	qt6base \
+	wayland \
+	host-qt6wayland
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6WAYLAND_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
+QT6WAYLAND_DEPENDENCIES += libxkbcommon
+else
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
+endif
+
+HOST_QT6WAYLAND_CONF_OPTS = \
+	-DFEATURE_wayland_client=OFF \
+	-DFEATURE_wayland_server=OFF
+
+HOST_QT6WAYLAND_DEPENDENCIES = host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
