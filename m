From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 10 May 2018 16:37:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5cinex: fix download
Message-ID: <1525963046-17540-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien <julien.boibessot@armadeus.com>

BR dl-wrapper tries to get Qt5_CinematicExperience_%22rpi_%221.0.tgz, which fails, so fix archive name...

Signed-off-by: Julien <julien.boibessot@armadeus.com>
---
 package/qt5cinex/qt5cinex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index d9254f5..89c38ee 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -8,7 +8,7 @@ QT5CINEX_VERSION = 1.0
 QT5CINEX_SITE = http://quitcoding.com/download
 
 ifeq ($(BR2_PACKAGE_QT5CINEX_HD),y)
-QT5CINEX_HD = "rpi_"
+QT5CINEX_HD = rpi_
 endif
 
 QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_HD)$(QT5CINEX_VERSION).tgz
-- 
2.7.4
