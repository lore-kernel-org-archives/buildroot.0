From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:30:51 +0200
Subject: [Buildroot] [git commit] package/qt5cinex: fix download
Message-ID: <20180511213035.0B47C8D1F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01b9b56173727989c23bb4828a9088483c3a7de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot dl-wrapper tries to download
Qt5_CinematicExperience_%22rpi_%221.0.tgz, which fails, so this commit
fixes the archive name by removing useless double quotes.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5cinex/qt5cinex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index d9254f53c5..89c38ee3f5 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -8,7 +8,7 @@ QT5CINEX_VERSION = 1.0
 QT5CINEX_SITE = http://quitcoding.com/download
 
 ifeq ($(BR2_PACKAGE_QT5CINEX_HD),y)
-QT5CINEX_HD = "rpi_"
+QT5CINEX_HD = rpi_
 endif
 
 QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_HD)$(QT5CINEX_VERSION).tgz
