From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 May 2020 12:57:30 +0200
Subject: [Buildroot] [PATCH/next v2] package/qt5quicktimeline: new package
Message-ID: <20200509105730.13490-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix license info/hashes
---
 package/qt5/Config.in                            |  1 +
 package/qt5/qt5quicktimeline/Config.in           | 12 ++++++++++++
 .../qt5/qt5quicktimeline/qt5quicktimeline.hash   |  5 +++++
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/qt5/qt5quicktimeline/Config.in
 create mode 100644 package/qt5/qt5quicktimeline/qt5quicktimeline.hash
 create mode 100644 package/qt5/qt5quicktimeline/qt5quicktimeline.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index c716919476..5c544ecec4 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,6 +48,7 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5quicktimeline/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5scxml/Config.in"
 source "package/qt5/qt5sensors/Config.in"
diff --git a/package/qt5/qt5quicktimeline/Config.in b/package/qt5/qt5quicktimeline/Config.in
new file mode 100644
index 0000000000..6d7d31a812
--- /dev/null
+++ b/package/qt5/qt5quicktimeline/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5QUICKTIMELINE
+	bool "qt5quicktimeline"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5quicktimeline module.
+
+	  https://doc.qt.io/qt-5/qtquicktimeline-index.html
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
new file mode 100644
index 0000000000..a81bec0d66
--- /dev/null
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtquicktimeline-everywhere-src-5.14.2.tar.xz.sha256
+sha256  83a45d0998cbc77f8094854a477ab1ac0838ae7fd822563d995df40149893a9e  qtquicktimeline-everywhere-src-5.14.2.tar.xz
+
+# Hashes for license files:
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
new file mode 100644
index 0000000000..ef6927f928
--- /dev/null
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# qt5quicktimeline
+#
+################################################################################
+
+QT5QUICKTIMELINE_VERSION = $(QT5_VERSION)
+QT5QUICKTIMELINE_SITE = $(QT5_SITE)
+QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKTIMELINE_VERSION).tar.xz
+QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
+QT5QUICKTIMELINE_INSTALL_STAGING = YES
+
+QT5QUICKTIMELINE_LICENSE = GPL-3.0, GFDL-1.3 (docs)
+QT5QUICKTIMELINE_LICENSE_FILES = LICENSE.GPL3
+
+$(eval $(qmake-package))
-- 
2.26.2
