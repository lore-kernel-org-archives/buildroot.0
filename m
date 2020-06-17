From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 17 Jun 2020 19:28:48 +0200
Subject: [Buildroot] [PATCH 6/6] package/qt5: Enable cups support when
 BR2_PACKAGE_CUPS
In-Reply-To: <20200617172848.2601-1-angelo@amarulasolutions.com>
References: <20200617172848.2601-1-angelo@amarulasolutions.com>
Message-ID: <20200617172848.2601-7-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cups support should be enabled in Qt if CUPS is available system wide.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
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
-- 
2.25.1
