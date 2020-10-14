From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:33:20 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5lottie: new package
Message-ID: <20201014212204.9DBA783C05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca960f3857af07c2f0f4b8626e8ed6f1dba56ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/Config.in                |  1 +
 package/qt5/qt5lottie/Config.in      | 12 ++++++++++++
 package/qt5/qt5lottie/qt5lottie.hash |  6 ++++++
 package/qt5/qt5lottie/qt5lottie.mk   | 16 ++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index c31f8267f3..fc0e68e8b7 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -46,6 +46,7 @@ source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
+source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
diff --git a/package/qt5/qt5lottie/Config.in b/package/qt5/qt5lottie/Config.in
new file mode 100644
index 0000000000..de5f16d5ea
--- /dev/null
+++ b/package/qt5/qt5lottie/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5LOTTIE
+	bool "qt5lottie"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5lottie module.
+
+	  https://doc.qt.io/qt-5/qtlottieanimation-index.html
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
new file mode 100644
index 0000000000..3af1c6de31
--- /dev/null
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -0,0 +1,6 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtlottie-everywhere-src-5.15.1.tar.xz.sha256
+sha256  845987860c7990035a7cd9a0e7581d210f786e551882df8b5be69f08987f2ba0  qtlottie-everywhere-src-5.15.1.tar.xz
+
+# Hashes for license files:
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
new file mode 100644
index 0000000000..1423a629b9
--- /dev/null
+++ b/package/qt5/qt5lottie/qt5lottie.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# qt5lottie
+#
+################################################################################
+
+QT5LOTTIE_VERSION = $(QT5_VERSION)
+QT5LOTTIE_SITE = $(QT5_SITE)
+QT5LOTTIE_SOURCE = qtlottie-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5LOTTIE_VERSION).tar.xz
+QT5LOTTIE_DEPENDENCIES = qt5declarative
+QT5LOTTIE_INSTALL_STAGING = YES
+
+QT5LOTTIE_LICENSE = GPL-3.0
+QT5LOTTIE_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
+
+$(eval $(qmake-package))
