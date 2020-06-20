From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:46:55 +0200
Subject: [Buildroot] [git commit] package/qt5: add optional CUPS support
Message-ID: <20200620204523.610DA81FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=128839e1c8edaa120a761164b0cd8e0e30e9cd80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 42d77306cc..c6b459a0e1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -23,7 +23,6 @@ QT5BASE_INSTALL_STAGING = YES
 #     feature enabled
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
-	-no-cups \
 	-no-iconv \
 	-system-zlib \
 	-system-pcre \
@@ -108,6 +107,13 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 QT5BASE_DEPENDENCIES += udev
 endif
 
+ifeq ($(BR2_PACKAGE_CUPS), y)
+QT5BASE_DEPENDENCIES += cups
+QT5BASE_CONFIGURE_OPTS += -cups
+else
+QT5BASE_CONFIGURE_OPTS += -no-cups
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
