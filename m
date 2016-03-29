From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Mar 2016 14:18:55 +0200
Subject: [Buildroot] [PATCH v1] qwt: needs qt5 widgets/printsupport
Message-ID: <1459253935-21951-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  Project ERROR: Unknown module(s) in QT: printsupport

[1] http://autobuild.buildroot.net/results/b9a/b9adbc61922c89ad7a0e5dd13cd2ce3bde864ede

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qwt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 04b6922..3f54509 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QWT
 	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
 	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
 	help
 	  Qwt is a graphics extension to the Qt GUI application
-- 
2.1.4
