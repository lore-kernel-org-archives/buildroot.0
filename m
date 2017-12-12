From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 07:12:38 +0100
Subject: [Buildroot] [git commit] qt5charts: fix qt5base widgets/gui
 selection
Message-ID: <20171212060519.2E44182838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b09fe60d9ca812b75f62b090853258fc5924ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Selection of BR2_PACKAGE_QT5BASE_WIDGETS needs BR2_PACKAGE_QT5BASE_GUI too.

Fixes qt5base configure failure ([1]):

  ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.
[1] http://autobuild.buildroot.net/results/69c4385b2fd484d16f749b4cde6967f5cabea8b2

and buildroot warning:

  warning: (... && BR2_PACKAGE_QT5CHARTS && ...) selects BR2_PACKAGE_QT5BASE_WIDGETS
  which has unmet direct dependencies (BR2_PACKAGE_QT5 && BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5BASE_GUI)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5charts/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5charts/Config.in b/package/qt5/qt5charts/Config.in
index 993f4db..0967f6a 100644
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
