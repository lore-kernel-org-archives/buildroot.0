Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11917C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6C849EDB;
	Fri, 28 Feb 2025 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vgKp2L7c1Ak; Fri, 28 Feb 2025 16:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07BC64F237
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07BC64F237;
	Fri, 28 Feb 2025 16:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1114468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01B2442DE7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlKdeotL6ACU for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752144256D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 752144256D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F45581793; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 23:24:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64525c4969727ff78f9a7b525749d70e245d6405
X-Git-Newrev: 36925cb53d9e13d63089c84cc027b08c79a1f8e9
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.6F45581793@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6quick3d: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=36925cb53d9e13d63089c84cc027b08c79a1f8e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6quick3d/Config.in       | 10 ++++++
 package/qt6/qt6quick3d/qt6quick3d.hash | 14 ++++++++
 package/qt6/qt6quick3d/qt6quick3d.mk   | 62 ++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b1616495a6..2a5f5a4511 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -50,6 +50,7 @@ source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
diff --git a/package/qt6/qt6quick3d/Config.in b/package/qt6/qt6quick3d/Config.in
new file mode 100644
index 0000000000..c4b8148039
--- /dev/null
+++ b/package/qt6/qt6quick3d/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6QUICK3D
+	bool "qt6quick3d"
+	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT # Host Quick3DRuntimeRender
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	help
+	  This package corresponds to the Qt Quick 3D module:
+
+	  https://doc.qt.io/qt-6/qtquick3d-index.html
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
new file mode 100644
index 0000000000..960cda69ad
--- /dev/null
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -0,0 +1,14 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
+sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  c3ed04bcbea49f521e4ab32c638fa86b13ebc7b8e1a8972807265079fcd1e6b9  src/3rdparty/assimp/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/embree/LICENSE.txt
+sha256  063805e3b8e24ceab4c5dea358b03245ee41c31be87cf65c61d836636cb494bb  src/3rdparty/meshoptimizer/LICENSE.md
+sha256  2af9d14c7cd67f13c3e7e91dcfe15ec5c8af42923635441e0f5a75bcadadeb33  src/3rdparty/tinyexr/LICENSE
+sha256  2c16d5b1c2808277fe975b4f70f0fd9afc9b3bcf04e6c676665a82cb2d5579e3  src/3rdparty/xatlas/LICENSE
+sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/helpers/GODOT_LICENSE.txt
+sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/runtimerender/GODOT_LICENSE.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.mk b/package/qt6/qt6quick3d/qt6quick3d.mk
new file mode 100644
index 0000000000..246bd2d82d
--- /dev/null
+++ b/package/qt6/qt6quick3d/qt6quick3d.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# qt6quick3d
+#
+################################################################################
+
+QT6QUICK3D_VERSION = $(QT6_VERSION)
+QT6QUICK3D_SITE = $(QT6_SITE)
+QT6QUICK3D_SOURCE = qtquick3d-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6QUICK3D_VERSION).tar.xz
+QT6QUICK3D_INSTALL_STAGING = YES
+QT6QUICK3D_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6QUICK3D_CMAKE_BACKEND = ninja
+QT6QUICK3D_LICENSE = GPL-3.0
+
+QT6QUICK3D_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/MIT.txt \
+	src/3rdparty/assimp/LICENSE \
+	src/3rdparty/embree/LICENSE.txt \
+	src/3rdparty/meshoptimizer/LICENSE.md \
+	src/3rdparty/tinyexr/LICENSE \
+	src/3rdparty/xatlas/LICENSE \
+	src/helpers/GODOT_LICENSE.txt \
+	src/runtimerender/GODOT_LICENSE.txt
+
+QT6QUICK3D_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6QUICK3D_DEPENDENCIES = \
+	host-qt6quick3d \
+	host-qt6shadertools \
+	qt6base \
+	qt6declarative
+
+ifeq ($(BR2_PACKAGE_ASSIMP),y)
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_assimp=ON
+QT6QUICK3D_DEPENDENCIES += assimp
+else
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_assimp=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6QUICKTIMELINE),y)
+QT6QUICK3D_DEPENDENCIES += qt6quicktimeline
+endif
+
+ifeq ($(BR2_PACKAGE_QT6SHADERTOOLS),y)
+QT6QUICK3D_DEPENDENCIES += qt6shadertools
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_zlib=ON
+QT6QUICK3D_DEPENDENCIES += zlib
+else
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_zlib=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
