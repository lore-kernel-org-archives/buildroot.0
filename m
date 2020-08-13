From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:09:19 +0200
Subject: [Buildroot] [git commit]
 package/{gnuradio|opencv3|python-matplotlib|qt5|qwt|wireshark}: drop
 redundant BR2_PACKAGE_QT5BASE select
Message-ID: <20200813210328.D6EA786300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cac548dbabe2dcf1150e8f06133f81cb643cd64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop redundant BR2_PACKAGE_QT5BASE select as BR2_PACKAGE_QT5 already
implies select BR2_PACKAGE_QT5BASE (see package/qt5/Config.in).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in            | 1 -
 package/opencv3/Config.in             | 1 -
 package/python-matplotlib/Config.in   | 1 -
 package/qt5/qt53d/Config.in           | 1 -
 package/qt5/qt5charts/Config.in       | 1 -
 package/qt5/qt5connectivity/Config.in | 1 -
 package/qt5/qt5declarative/Config.in  | 1 -
 package/qt5/qt5imageformats/Config.in | 1 -
 package/qt5/qt5location/Config.in     | 1 -
 package/qt5/qt5multimedia/Config.in   | 1 -
 package/qt5/qt5script/Config.in       | 1 -
 package/qt5/qt5scxml/Config.in        | 1 -
 package/qt5/qt5sensors/Config.in      | 1 -
 package/qt5/qt5serialbus/Config.in    | 1 -
 package/qt5/qt5serialport/Config.in   | 1 -
 package/qt5/qt5svg/Config.in          | 1 -
 package/qt5/qt5webchannel/Config.in   | 1 -
 package/qt5/qt5webkit/Config.in       | 1 -
 package/qt5/qt5websockets/Config.in   | 1 -
 package/qt5/qt5xmlpatterns/Config.in  | 1 -
 package/qwt/Config.in                 | 1 -
 package/wireshark/Config.in           | 1 -
 22 files changed, 22 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 07a33514d1..cd31ce8864 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -141,7 +141,6 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
 	select BR2_PACKAGE_PYTHON_PYQT5
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
 	select BR2_PACKAGE_QT5BASE_GUI # runtime
 	select BR2_PACKAGE_QT5BASE_WIDGETS # runtime
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index f45d678d22..22dcb67f3a 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -85,7 +85,6 @@ comment "gtk3 support needs libgtk3"
 config BR2_PACKAGE_OPENCV3_WITH_QT5
 	bool "qt5"
 	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index cfa0bc30c3..e7e2804b4f 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 	bool "qt display"
 	depends on BR2_PACKAGE_QT5 # python-pyqt5
 	select BR2_PACKAGE_PYTHON_PYQT5
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index 78602a7287..5126078d09 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_QT53D
 	bool "qt53d"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative_quick
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
diff --git a/package/qt5/qt5charts/Config.in b/package/qt5/qt5charts/Config.in
index db199922db..a72da65e30 100644
--- a/package/qt5/qt5charts/Config.in
+++ b/package/qt5/qt5charts/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5CHARTS
 	bool "qt5charts"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	help
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 182fe3ea9c..51e8978f1f 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5CONNECTIVITY
 	bool "qt5connectivity"
 	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
 	help
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 476cf33f39..3ba9224c22 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5imageformats/Config.in b/package/qt5/qt5imageformats/Config.in
index 44c85c9b38..991f22f514 100644
--- a/package/qt5/qt5imageformats/Config.in
+++ b/package/qt5/qt5imageformats/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5IMAGEFORMATS
 	bool "qt5imageformats"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index 7c39979eff..c68deb1006 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 79d6022141..dd46575d93 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5MULTIMEDIA
 	bool "qt5multimedia"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE_OPENGL
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 034b7d2fcb..1926813e9f 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5SCRIPT
 	bool "qt5script"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
index 5510821d24..24fb2d9c2a 100644
--- a/package/qt5/qt5scxml/Config.in
+++ b/package/qt5/qt5scxml/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5SCXML
 	bool "qt5scxml"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
index 4846a3f95f..5e8ee65324 100644
--- a/package/qt5/qt5sensors/Config.in
+++ b/package/qt5/qt5sensors/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5SENSORS
 	bool "qt5sensors"
-	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
index 2882d50644..bcfec29b49 100644
--- a/package/qt5/qt5serialbus/Config.in
+++ b/package/qt5/qt5serialbus/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5SERIALBUS
 	bool "qt5serialbus"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5SERIALPORT
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5serialport/Config.in b/package/qt5/qt5serialport/Config.in
index 3538c52556..16c2eaa619 100644
--- a/package/qt5/qt5serialport/Config.in
+++ b/package/qt5/qt5serialport/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5SERIALPORT
 	bool "qt5serialport"
-	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
index bc80b62674..e9284913a0 100644
--- a/package/qt5/qt5svg/Config.in
+++ b/package/qt5/qt5svg/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5SVG
 	bool "qt5svg"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
index e3d840584f..436e3abb2b 100644
--- a/package/qt5/qt5webchannel/Config.in
+++ b/package/qt5/qt5webchannel/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5WEBCHANNEL
 	bool "qt5webchannel"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5WEBSOCKETS
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 6933090973..65f08d1c5e 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_QT5WEBKIT
 	# assumes a FPU is available on MIPS
 	depends on !BR2_MIPS_SOFT_FLOAT
 	select BR2_PACKAGE_LEVELDB
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_SQLITE
diff --git a/package/qt5/qt5websockets/Config.in b/package/qt5/qt5websockets/Config.in
index 0cfde91c8b..678fb6fa04 100644
--- a/package/qt5/qt5websockets/Config.in
+++ b/package/qt5/qt5websockets/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5WEBSOCKETS
 	bool "qt5websockets"
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5xmlpatterns/Config.in b/package/qt5/qt5xmlpatterns/Config.in
index dd8b54eba1..2f3eb24f23 100644
--- a/package/qt5/qt5xmlpatterns/Config.in
+++ b/package/qt5/qt5xmlpatterns/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5XMLPATTERNS
 	bool "qt5xmlpatterns"
-	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 2e9cec19d7..736ccc2a5e 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
 	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 383897c5dd..e3a9b01991 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	depends on !BR2_arc # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
 	select BR2_PACKAGE_QT5BASE_PNG # runtime
 	select BR2_PACKAGE_QT5BASE_WIDGETS
