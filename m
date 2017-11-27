From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 12:03:04 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] qt5webkit: fix URL for
 5.6 download
Message-ID: <20171127105851.639DE802B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f97e36db9155dbd00fe6a8ce3a54dc2c3b9ac77a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

The Qt community releases are not stored under submodules path
component.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7780cef53540b59816852bfb89aa0c0012a36fbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 77075f6..e88ef15 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -8,7 +8,7 @@ QT5WEBKIT_VERSION = $(QT5_VERSION)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_SITE = $(QT5_SITE)
 else
-QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)/submodules
+QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)
 endif
 
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
