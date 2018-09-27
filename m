From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 23:13:32 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] qt5webengine: rename
 chromium.inc to chromium-latest.inc
Message-ID: <20180927211559.F2F5989054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d44bf68326268fe6aec147581e10fbd615f62d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

For consistency with chromium-lts.inc, rename chromium.inc to
chromium-latest.inc.

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b36fd21f2c55f73b36e262816a8f5c5cfe81236c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webengine/{chromium.inc => chromium-latest.inc} | 0
 package/qt5/qt5webengine/qt5webengine.mk                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/chromium.inc b/package/qt5/qt5webengine/chromium-latest.inc
similarity index 100%
rename from package/qt5/qt5webengine/chromium.inc
rename to package/qt5/qt5webengine/chromium-latest.inc
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 0940fa5269..14ddcdfedc 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -13,7 +13,7 @@ QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
 QT5WEBENGINE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-include package/qt5/qt5webengine/chromium.inc
+include package/qt5/qt5webengine/chromium-latest.inc
 else
 include package/qt5/qt5webengine/chromium-lts.inc
 endif
