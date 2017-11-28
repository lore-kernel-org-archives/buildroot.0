From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 27 Nov 2017 20:05:17 -0500
Subject: [Buildroot] [PATCH 1/1] qt5: remove unused QT5_SNAPSHOTS_SITE
Message-ID: <20171128010517.26420-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable QT5_SNAPSHOTS_SITE was introduced in commit 9d5ac9698 to
fetch sources of obsolete modules. It was used to download qt5webkit
tarballs.

The variable is not referenced anymore since the qt5webkit tarballs are
downloaded from the Qt community release site.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 0e49c6b58b..5d63433666 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -7,13 +7,11 @@
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.9
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
-QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 endif
+QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
-- 
2.15.0
