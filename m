From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Dec 2019 22:48:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: select
 BR2_PACKAGE_QT5BASE_GUI
Message-ID: <20191230214842.1485805-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gui is a mandatory dependency of python-pyqt5 as "-gui" option is used
internally by the configure.py script

Fixes:
 - http://autobuild.buildroot.org/results/ea0c8db44aacf1ce76f75e8288969fe5da6690d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.0
