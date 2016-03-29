From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 15:02:08 +0200
Subject: [Buildroot] [git commit] qwt: needs qt5 widgets/printsupport
Message-ID: <20160329130214.4A20C80337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a013afae45f131401348d51233e2066c158185cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  Project ERROR: Unknown module(s) in QT: printsupport

[1] http://autobuild.buildroot.net/results/b9a/b9adbc61922c89ad7a0e5dd13cd2ce3bde864ede

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
