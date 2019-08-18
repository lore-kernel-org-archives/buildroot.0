From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Aug 2019 00:46:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pyqt5: add qt optional
 dependencies
Message-ID: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-pyqt5 optionally depends on qt5enginio, qt5location,
qt5multimedia, qt5quickcontrols, qt5quickcontrols2, qt5sensors,
qt5serialport, qt5svg, qt5webchannel, qt5webengine, qt5webkit,
qt5websockets and qt5x11extras

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12121

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyqt5/python-pyqt5.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 4955936ae3..c2398301f7 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -10,7 +10,23 @@ PYTHON_PYQT5_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-$(P
 PYTHON_PYQT5_LICENSE = GPL-3.0
 PYTHON_PYQT5_LICENSE_FILES = LICENSE
 
-PYTHON_PYQT5_DEPENDENCIES = python-sip host-python-sip qt5base
+PYTHON_PYQT5_DEPENDENCIES = \
+	python-sip \
+	host-python-sip \
+	qt5base \
+	$(if $(BR2_PACKAGE_QT5ENGINIO),qt5enginio) \
+	$(if $(BR2_PACKAGE_QT5LOCATION),qt5location) \
+	$(if $(BR2_PACKAGE_QT5MULTIMEDIA),qt5multimedia) \
+	$(if $(BR2_PACKAGE_QT5QUICKCONTROLS),qt5quickcontrols) \
+	$(if $(BR2_PACKAGE_QT5QUICKCONTROLS2),qt5quickcontrols2) \
+	$(if $(BR2_PACKAGE_QT5SENSORS),qt5sensors) \
+	$(if $(BR2_PACKAGE_QT5SERIALPORT),qt5serialport) \
+	$(if $(BR2_PACKAGE_QT5SVG),qt5svg) \
+	$(if $(BR2_PACKAGE_QT5WEBCHANNEL),qt5webchannel) \
+	$(if $(BR2_PACKAGE_QT5WEBENGINE),qt5webengine) \
+	$(if $(BR2_PACKAGE_QT5WEBKIT),qt5webkit) \
+	$(if $(BR2_PACKAGE_QT5WEBSOCKETS),qt5websockets) \
+	$(if $(BR2_PACKAGE_QT5X11EXTRAS),qt5x11extras)
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
-- 
2.20.1
