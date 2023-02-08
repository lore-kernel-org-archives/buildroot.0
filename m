Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABD2C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6BF610E3;
	Wed,  8 Feb 2023 13:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D6BF610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYvgMkRZeVoG; Wed,  8 Feb 2023 13:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433D3610CB;
	Wed,  8 Feb 2023 13:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433D3610CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6431BF3FD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7643540B5A
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7643540B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGtR0TGi2pnh for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:34:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3992640BB5
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3992640BB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 256088469A; Wed,  8 Feb 2023 13:34:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 14:00:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74686296a4a20438f1e94e22a5a3372df2e830cc
X-Git-Newrev: e447f56408f9308cc0e527f97dcc1844f2d6c850
X-Patchwork-Hint: ignore
Message-Id: <20230208133422.256088469A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6serialbus: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e447f56408f9308cc0e527f97dcc1844f2d6c850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                      |  1 +
 package/qt6/qt6serialbus/Config.in         | 15 ++++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash | 11 ++++++++
 package/qt6/qt6serialbus/qt6serialbus.mk   | 45 ++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 831ae72c3c..655fa8392a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -44,6 +44,7 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 
 endif
diff --git a/package/qt6/qt6serialbus/Config.in b/package/qt6/qt6serialbus/Config.in
new file mode 100644
index 0000000000..1f24310e61
--- /dev/null
+++ b/package/qt6/qt6serialbus/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_QT6SERIALBUS
+	bool "qt6serialbus"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
+	select BR2_PACKAGE_QT6SERIALPORT
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6serialbus module.
+
+	  https://doc.qt.io/qt-6/qtserialbus-index.html
+
+comment "qt6serialbus needs headers >= 3.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
new file mode 100644
index 0000000000..be01f13363
--- /dev/null
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialbus-everywhere-src-6.4.2.tar.xz.sha256
+sha256  604013657c7327899aa50748deb4bcb5e545ab37ff4964795b9e6f617d48bf1b  qtserialbus-everywhere-src-6.4.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
new file mode 100644
index 0000000000..0717736387
--- /dev/null
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# qt6serialbus
+#
+################################################################################
+
+QT6SERIALBUS_VERSION = $(QT6_VERSION)
+QT6SERIALBUS_SITE = $(QT6_SITE)
+QT6SERIALBUS_SOURCE = qtserialbus-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALBUS_VERSION).tar.xz
+QT6SERIALBUS_INSTALL_STAGING = YES
+QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SERIALBUS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6SERIALBUS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6SERIALBUS_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SERIALBUS_DEPENDENCIES = \
+	qt6serialport
+
+define QT6SERIALBUS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALBUS_BUILDDIR)
+endef
+
+define QT6SERIALBUS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR)
+endef
+
+define QT6SERIALBUS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR)
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
