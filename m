From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 23:36:29 +0100
Subject: [Buildroot] [git commit] package/python-pyqt5: select
 BR2_PACKAGE_QT5BASE_GUI
Message-ID: <20200123222918.3EEB483928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b0ba1a3c486e5ef649cd231ff1840fccc2767a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though pyqt5 would be perfectly usable with just the core Qt5
modules (QtCore, QtDbus, ...), its configure.py script passes the -gui
option to qmake unconditionally. Therefore, make sure that GUI is built.

Fixes:
 - http://autobuild.buildroot.org/results/ea0c8db44aacf1ce76f75e8288969fe5da6690d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pyqt5/Config.in       | 1 +
 package/python-pyqt5/python-pyqt5.mk | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 20ac988703..9fa7676f98 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
 	bool "python-pyqt5"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_PYTHON_SIP
+	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Python bindings for Qt 5
 
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index b6d559cd5b..260a93af9c 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -12,9 +12,8 @@ PYTHON_PYQT5_LICENSE_FILES = LICENSE
 
 PYTHON_PYQT5_DEPENDENCIES = python-sip host-python-sip qt5base
 PYTHON_PYQT5_MODULES = \
-	QtCore \
+	QtCore QtGui \
 	$(if $(BR2_PACKAGE_QT5BASE_DBUS),QtDBus) \
-	$(if $(BR2_PACKAGE_QT5BASE_GUI),QtGui) \
 	$(if $(BR2_PACKAGE_QT5BASE_NETWORK),QtNetwork) \
 	$(if $(BR2_PACKAGE_QT5BASE_OPENGL_LIB),QtOpenGL) \
 	$(if $(BR2_PACKAGE_QT5BASE_PRINTSUPPORT),QtPrintSupport) \
