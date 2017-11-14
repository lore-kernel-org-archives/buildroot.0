From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 14 Nov 2017 17:30:27 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: depends also on qt5quickcontrols
Message-ID: <1510677027-24076-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5cinex failed to build if qt5quickcontrols is not selected
add qt5quickcontrols to qt5cinex dependencies in .mk
select BR2_PACKAGE_QT5QUICKCONTROLS in Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5cinex/Config.in   | 1 +
 package/qt5cinex/qt5cinex.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index 5adf6c3..7cc459a 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_QT5CINEX
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
+	select BR2_PACKAGE_QT5QUICKCONTROLS
 	help
 	  This application demonstrates the power of Qt5 and few of the new
 	  additions available in QtQuick 2.0.
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index d9254f5..44c53a1 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -12,7 +12,7 @@ QT5CINEX_HD = "rpi_"
 endif
 
 QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_HD)$(QT5CINEX_VERSION).tgz
-QT5CINEX_DEPENDENCIES = qt5base qt5declarative
+QT5CINEX_DEPENDENCIES = qt5base qt5declarative qt5quickcontrols
 
 QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
-- 
2.7.4
