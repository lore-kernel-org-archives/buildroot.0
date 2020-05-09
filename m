From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 May 2020 12:40:32 +0200
Subject: [Buildroot] [PATCH/next v1] package/qt5quicktimeline: new package
Message-ID: <20200509104032.11221-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in                            |  1 +
 package/qt5/qt5quicktimeline/Config.in           | 12 ++++++++++++
 .../qt5/qt5quicktimeline/qt5quicktimeline.hash   |  7 +++++++
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk | 16 ++++++++++++++++
 4 files changed, 36 insertions(+)
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
index 0000000000..1c57434f10
--- /dev/null
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -0,0 +1,7 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtquicktimeline-everywhere-src-5.14.2.tar.xz.sha256
+sha256  83a45d0998cbc77f8094854a477ab1ac0838ae7fd822563d995df40149893a9e  qtquicktimeline-everywhere-src-5.14.2.tar.xz
+
+# Hashes for license files:
+sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
+sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
new file mode 100644
index 0000000000..5b399dd06c
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
+QT5QUICKTIMELINE_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
+QT5QUICKTIMELINE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+
+$(eval $(qmake-package))
-- 
2.26.2
