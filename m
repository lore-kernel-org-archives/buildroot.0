Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5938C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1114B400C1;
	Wed, 17 Jul 2024 20:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKBiLbYwjcG0; Wed, 17 Jul 2024 20:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF47E40BE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF47E40BE2;
	Wed, 17 Jul 2024 20:55:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 788041BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64AC081341
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8OE3Xbs0qG5 for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85E3D81327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E3D81327
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 20:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7025E86CDF; Wed, 17 Jul 2024 20:55:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 22:51:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f761a8c4516d88d70ae6f5d192fdb99cafa761a6
X-Git-Newrev: 7d9ada3c7cd8fb30fa1f98fb464421bce7d082eb
X-Patchwork-Hint: ignore
Message-Id: <20240717205505.7025E86CDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6opcua: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d9ada3c7cd8fb30fa1f98fb464421bce7d082eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add qt6 version of qtopcua from git as it's not contained in the
official qt release submodule directory.

Fulfill the mandatory dependency on qt6base, and qt6base-network in
particular, as well as the need for host tool qopcuaxmldatatypes2cpp
which is provided by host-qt6opcua.
For host-qt6opcua set the dependency on host-qt6base-network as well.

Existence of the optional dependency openssl enables
FEATURE_open62541_security. (This has changed from qt5opcua where
mbedtls was supported.)

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/qt6/Config.in              |  1 +
 package/qt6/qt6opcua/Config.in     | 14 ++++++++++++
 package/qt6/qt6opcua/qt6opcua.hash |  9 ++++++++
 package/qt6/qt6opcua/qt6opcua.mk   | 44 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b39df9bae2..9462fe0459 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2384,6 +2384,7 @@ F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
+F:	package/qt6/qt6opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index e84806d5e4..29c1c25c7f 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -48,6 +48,7 @@ source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
+source "package/qt6/qt6opcua/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
new file mode 100644
index 0000000000..84a51f544f
--- /dev/null
+++ b/package/qt6/qt6opcua/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT6OPCUA
+	bool "qt6opcua"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+        # qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
+        # network support in qt6base.
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
+
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6opcua module.
+
+	  https://doc.qt.io/qt-6/qtopcua-index.html
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
new file mode 100644
index 0000000000..cf54bef98e
--- /dev/null
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -0,0 +1,9 @@
+sha256  653597e2926ddb512f078bab1e5d2a059202ba1bc1f68ff0b4a0e053ab1272b2  qt6opcua-6.7.2-git4.tar.gz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
new file mode 100644
index 0000000000..6c8ff7af89
--- /dev/null
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# qt6opcua
+#
+################################################################################
+
+QT6OPCUA_VERSION = $(QT6_VERSION)
+QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
+QT6OPCUA_SITE_METHOD = git
+QT6OPCUA_INSTALL_STAGING = YES
+QT6OPCUA_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6OPCUA_CMAKE_BACKEND = ninja
+
+QT6OPCUA_LICENSE = \
+	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
+	GFDL-1.3 no invariants (docs), \
+	BSD-3-Clause (examples + buildsystem)
+
+QT6OPCUA_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt
+
+QT6OPCUA_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF
+
+HOST_QT6OPCUA_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF
+
+QT6OPCUA_DEPENDENCIES = \
+	qt6base \
+	host-qt6opcua
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+QT6OPCUA_DEPENDENCIES += openssl
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
