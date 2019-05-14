From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 22:01:47 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/qt5serialbus: disable on microblaze with gcc <= 7
Message-ID: <20190514200147.23066-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/3482bd950c7ab5608666807a7ab7ea857c767333

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Disable only with gcc < 8

 package/qt5/qt5serialbus/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
index 2882d50644..3de83c5978 100644
--- a/package/qt5/qt5serialbus/Config.in
+++ b/package/qt5/qt5serialbus/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_QT5SERIALBUS
 	bool "qt5serialbus"
+	# internal compiler error: in do_output_reload,@reload1.c:7978
+	depends on !BR2_microblaze || BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5SERIALPORT
@@ -15,4 +17,5 @@ config BR2_PACKAGE_QT5SERIALBUS
 	  http://doc.qt.io/qt-5/qtserialbus-index.html
 
 comment "qt5serialbus needs headers >= 3.6"
+	depends on !BR2_microblaze || BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
-- 
2.20.1
