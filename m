Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F822C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE91418CE;
	Fri, 12 Jul 2024 10:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_p8HrRiuDEJ; Fri, 12 Jul 2024 10:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8097541813
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8097541813;
	Fri, 12 Jul 2024 10:26:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3061BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 255A541813
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOikMPrjnDk3 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF3214180F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF3214180F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:26:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C935A85CCA; Fri, 12 Jul 2024 10:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 12:25:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e514277a53ca997d0567754035e8b453396e173b
X-Git-Newrev: 70a319f7f9aba2d44ed7548d7ac3cb42b6b216b3
X-Patchwork-Hint: ignore
Message-Id: <20240712102609.C935A85CCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6tools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=70a319f7f9aba2d44ed7548d7ac3cb42b6b216b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Network module is explicitly required by qt6tools:

  Failed to find required Qt component "Network".

We need host-qt6base with Sql support for host-qt6tools to build the
qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator
is not available:

  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in              |  1 +
 package/qt6/qt6tools/Config.in     | 17 ++++++++++++++
 package/qt6/qt6tools/qt6tools.hash | 12 ++++++++++
 package/qt6/qt6tools/qt6tools.mk   | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 69ce0b3f6a..48366f5fd1 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,6 +51,7 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
new file mode 100644
index 0000000000..5f52c5644f
--- /dev/null
+++ b/package/qt6/qt6tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT6TOOLS
+	bool "qt6tools"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	# qt6tools needs host-qt6tools, and host-qt6tools needs
+	# network support in qt6base. In addition, we also need
+	# host-qt6base with Sql support to build the qhelpgenerator
+	# tool, if target support for Sql is present
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Tools provides tools facilitate the development
+	  and design of applications.
+
+	  https://github.com/qt/qttools
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
new file mode 100644
index 0000000000..622df4a00f
--- /dev/null
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -0,0 +1,12 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qttools-everywhere-src-6.7.2.tar.xz.sha256
+sha256  58e855ad1b2533094726c8a425766b63a04a0eede2ed85086860e54593aa4b2a  qttools-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
new file mode 100644
index 0000000000..d996f75b34
--- /dev/null
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# qt6tools
+#
+################################################################################
+
+QT6TOOLS_VERSION = $(QT6_VERSION)
+QT6TOOLS_SITE = $(QT6_SITE)
+QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
+QT6TOOLS_INSTALL_STAGING = YES
+QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6TOOLS_CMAKE_BACKEND = ninja
+
+QT6TOOLS_LICENSE = \
+	BSD-3-Clause (examples), \
+	BSD-3-Clause (corecon), \
+	BSL-1.0 (catch), \
+	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
+	GPL-3.0 WITH Qt-GPL-exception-1.0
+
+QT6TOOLS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6TOOLS_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6TOOLS_DEPENDENCIES = \
+	qt6base \
+	host-qt6tools
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6TOOLS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
