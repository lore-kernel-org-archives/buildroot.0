From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 22:13:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5location: disable on microblaze
 with gcc < 8
Message-ID: <20190514201352.24579-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a43820c328a5444fe35086d099df2676b03cba9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5location/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index 7c39979eff..f50113d942 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
+	# internal compiler error: in do_output_reload, at reload1.c:7978
+	depends on !BR2_microblaze || BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
-- 
2.20.1
