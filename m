From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 22:14:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5sensors: disable on microblaze
 with gcc < 8
Message-ID: <20190514201443.24645-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/3ba494a3341301cb71d1346aefc28f884479f912

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5sensors/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
index 4846a3f95f..488027875b 100644
--- a/package/qt5/qt5sensors/Config.in
+++ b/package/qt5/qt5sensors/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_QT5SENSORS
 	bool "qt5sensors"
+	# internal compiler error: in do_output_reload, at reload1.c:7978
+	depends on !BR2_microblaze || BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
-- 
2.20.1
