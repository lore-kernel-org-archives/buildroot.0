From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri, 24 Nov 2017 17:37:37 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: fix URL for 5.6 download
Message-ID: <20171124223737.14510-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt community releases are not stored under submodules path
component.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 592eae908d..7925b114e6 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -10,7 +10,7 @@ QT5WEBKIT_VERSION = 5.9.1
 QT5WEBKIT_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
 else
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)/submodules
+QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)
 endif
 
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-- 
2.11.0
