From: Mister Benjamin <mb@mbno.org>
Date: Sun, 12 Apr 2020 23:23:28 +0200
Subject: [Buildroot] [PATCH v2] package/qt5: add qt5remoteobjects module
In-Reply-To: <20200409154435.8222-1-mb@mbno.org>
References: <20200409154435.8222-1-mb@mbno.org>
Message-ID: <20200412212328.8843-1-mb@mbno.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mister Benjamin <mb@mbno.org>
---
 package/qt5/Config.in                          |  1 +
 package/qt5/qt5remoteobjects/Config.in         | 14 ++++++++++++++
 .../qt5/qt5remoteobjects/qt5remoteobjects.hash |  8 ++++++++
 .../qt5/qt5remoteobjects/qt5remoteobjects.mk   | 18 ++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/qt5/qt5remoteobjects/Config.in
 create mode 100644 package/qt5/qt5remoteobjects/qt5remoteobjects.hash
 create mode 100644 package/qt5/qt5remoteobjects/qt5remoteobjects.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 77dce16038..4d9044bb22 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,6 +48,7 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5remoteobjects/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5scxml/Config.in"
 source "package/qt5/qt5sensors/Config.in"
diff --git a/package/qt5/qt5remoteobjects/Config.in b/package/qt5/qt5remoteobjects/Config.in
new file mode 100644
index 0000000000..87791dea7c
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT5REMOTEOBJECTS
+	bool "qt5remoteobjects"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Remote Objects is an Inter-Process Communication
+	  module developed for Qt. This module extends Qt's
+	  existing functionalities to enable information exchange
+	  between processes or computers.
+
+	  http://doc.qt.io/qt-5/qtremoteobjects-index.html
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
new file mode 100644
index 0000000000..79b78a47d3
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -0,0 +1,8 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtremoteobjects-everywhere-src-5.14.2.tar.xz.sha256
+sha256 a6a601c4f4aab6fe41a462dae57033819f697e3317240a382cee45c08be614d6 qtremoteobjects-everywhere-src-5.14.2.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
new file mode 100644
index 0000000000..2cc86c0217
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qt5remoteobjects
+#
+################################################################################
+
+QT5REMOTEOBJECTS_VERSION = $(QT5_VERSION)
+QT5REMOTEOBJECTS_SITE = $(QT5_SITE)
+QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5REMOTEOBJECTS_VERSION).tar.xz
+QT5REMOTEOBJECTS_INSTALL_STAGING = YES
+QT5REMOTEOBJECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
+QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5REMOTEOBJECTS_LICENSE += , BSD-3-Clause (examples)
+endif
+
+$(eval $(qmake-package))
-- 
2.20.1
