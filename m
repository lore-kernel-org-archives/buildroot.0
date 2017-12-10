From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Dec 2017 23:01:31 +0100
Subject: [Buildroot] [PATCH v1] qt5charts: fix qt5base widgets/gui selection
Message-ID: <20171210220131.29440-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Selection of BR2_PACKAGE_QT5BASE_WIDGETS needs BR2_PACKAGE_QT5BASE_GUI too.

Fixes qt5base configure failure ([1]):

  ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.
[1] http://autobuild.buildroot.net/results/69c4385b2fd484d16f749b4cde6967f5cabea8b2

and buildroot warning:

  warning: (... && BR2_PACKAGE_QT5CHARTS && ...) selects BR2_PACKAGE_QT5BASE_WIDGETS
  which has unmet direct dependencies (BR2_PACKAGE_QT5 && BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5BASE_GUI)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5charts/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5charts/Config.in b/package/qt5/qt5charts/Config.in
index 993f4db4ce..0967f6a2df 100644
--- a/package/qt5/qt5charts/Config.in
+++ b/package/qt5/qt5charts/Config.in
@@ -4,6 +4,7 @@ comment "qt5charts needs at least qt-5.7"
 config BR2_PACKAGE_QT5CHARTS
 	bool "qt5charts"
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	help
-- 
2.15.0
