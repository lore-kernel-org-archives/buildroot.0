Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5D0EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 19:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E6C160AFD;
	Sat,  1 Jul 2023 19:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E6C160AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JWwWWx25bJ1; Sat,  1 Jul 2023 19:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A351E60C2B;
	Sat,  1 Jul 2023 19:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A351E60C2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38D6B1BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DED0417A1
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DED0417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYOgP9ntehtK for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 19:42:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C14F241684
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14F241684
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACB5D86093; Sat,  1 Jul 2023 19:42:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 21:41:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8467289111843e070816c9ffb2004baa74ffead
X-Git-Newrev: 1c7d497f414210688130054cf78c949b4a1a8d82
X-Patchwork-Hint: ignore
Message-Id: <20230701194249.ACB5D86093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6svg: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c7d497f414210688130054cf78c949b4a1a8d82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in          |  1 +
 package/qt6/qt6svg/Config.in   | 11 +++++++++
 package/qt6/qt6svg/qt6svg.hash | 10 +++++++++
 package/qt6/qt6svg/qt6svg.mk   | 51 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 655fa8392a..3788caa6a3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -46,5 +46,6 @@ if BR2_PACKAGE_QT6
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
+source "package/qt6/qt6svg/Config.in"
 
 endif
diff --git a/package/qt6/qt6svg/Config.in b/package/qt6/qt6svg/Config.in
new file mode 100644
index 0000000000..179101c97f
--- /dev/null
+++ b/package/qt6/qt6svg/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6SVG
+	bool "qt6svg"
+	select BR2_PACKAGE_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt SVG provides classes for rendering and displaying SVG
+	  drawings in widgets and on other paint devices.
+
+	  https://doc.qt.io/qt-6/qtsvg-index.html
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
new file mode 100644
index 0000000000..bb239cb012
--- /dev/null
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
+sha256  88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a  qtsvg-everywhere-src-6.4.3.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
new file mode 100644
index 0000000000..be0addbd0d
--- /dev/null
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# qt6svg
+#
+################################################################################
+
+QT6SVG_VERSION = $(QT6_VERSION)
+QT6SVG_SITE = $(QT6_SITE)
+QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
+QT6SVG_INSTALL_STAGING = YES
+QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SVG_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	BSD-3-Clause
+
+QT6SVG_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6SVG_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SVG_DEPENDENCIES = \
+	host-pkgconf \
+	host-ninja \
+	qt6base
+
+define QT6SVG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SVG_BUILDDIR)
+endef
+
+define QT6SVG_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
+endef
+
+define QT6SVG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
