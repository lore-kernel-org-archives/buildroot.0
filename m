From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 19:10:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5serialbus: disable on microblaze
Message-ID: <20190514171058.22604-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/3482bd950c7ab5608666807a7ab7ea857c767333

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5serialbus/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
index 2882d50644..cdaed32475 100644
--- a/package/qt5/qt5serialbus/Config.in
+++ b/package/qt5/qt5serialbus/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_QT5SERIALBUS
 	bool "qt5serialbus"
+	# internal compiler error: in do_output_reload, at reload1.c:7978
+	depends on !BR2_microblaze
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5SERIALPORT
@@ -15,4 +17,5 @@ config BR2_PACKAGE_QT5SERIALBUS
 	  http://doc.qt.io/qt-5/qtserialbus-index.html
 
 comment "qt5serialbus needs headers >= 3.6"
+	depends on !BR2_microblaze
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
-- 
2.20.1
