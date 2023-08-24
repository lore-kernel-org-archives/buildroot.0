Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CB8C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1074402E1;
	Thu, 24 Aug 2023 21:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1074402E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9Ngp4kNP1iB; Thu, 24 Aug 2023 21:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 827AA40583;
	Thu, 24 Aug 2023 21:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827AA40583
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D15791BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6849415ED
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6849415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MX8ZmyfH1ASY for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:17:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7CA7405ED
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7CA7405ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C41D286276; Thu, 24 Aug 2023 21:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:08:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 037133271495159ccaeed9e9d53c4829b164ea9e
X-Git-Newrev: abbf59f643b5f67eb36fa3e0eadf52bc86802f6c
X-Patchwork-Hint: ignore
Message-Id: <20230824211744.C41D286276@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6core5compat:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=abbf59f643b5f67eb36fa3e0eadf52bc86802f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/qt6/Config.in                          |  1 +
 package/qt6/qt6core5compat/Config.in           | 12 ++++++++
 package/qt6/qt6core5compat/qt6core5compat.hash | 10 +++++++
 package/qt6/qt6core5compat/qt6core5compat.mk   | 39 ++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c643469f17..6fd1021e98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3257,6 +3257,7 @@ F:	package/libusb-compat/
 F:	package/proj/
 F:	package/python-iniparse/
 F:	package/qjson/
+F:	package/qt6/qt6core5compat/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 3788caa6a3..126bc22180 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,5 +47,6 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6core5compat/Config.in"
 
 endif
diff --git a/package/qt6/qt6core5compat/Config.in b/package/qt6/qt6core5compat/Config.in
new file mode 100644
index 0000000000..9d9e087601
--- /dev/null
+++ b/package/qt6/qt6core5compat/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT6CORE5COMPAT
+	bool "qt6core5compat"
+	select BR2_PACKAGE_QT6BASE_XML
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt 5 Core Compat module contains the Qt 5 Core APIs that
+	  were removed in Qt 6. The module facilitates the transition
+	  to Qt 6.
+
+	  https://doc.qt.io/qt-6/qtcore5-index.html
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
new file mode 100644
index 0000000000..0735df3af2
--- /dev/null
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
+sha256  d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a  qt5compat-everywhere-src-6.4.3.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.mk b/package/qt6/qt6core5compat/qt6core5compat.mk
new file mode 100644
index 0000000000..0b6d9369cb
--- /dev/null
+++ b/package/qt6/qt6core5compat/qt6core5compat.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# qt6core5compat
+#
+################################################################################
+
+QT6CORE5COMPAT_VERSION = $(QT6_VERSION)
+QT6CORE5COMPAT_SITE = $(QT6_SITE)
+QT6CORE5COMPAT_SOURCE = qt5compat-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CORE5COMPAT_VERSION).tar.xz
+QT6CORE5COMPAT_INSTALL_STAGING = YES
+QT6CORE5COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6CORE5COMPAT_CMAKE_BACKEND = ninja
+
+QT6CORE5COMPAT_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	BSD-3-Clause
+
+QT6CORE5COMPAT_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6CORE5COMPAT_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6CORE5COMPAT_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
