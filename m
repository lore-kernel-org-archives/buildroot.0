From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:42:46 +0100
Subject: [Buildroot] [git commit] package/qt5multimedia: drop gstreamer
 0.10.x support
Message-ID: <20200208214332.0046D8D5CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3069cb706fc909df272053b460ff32a5bb23bcfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the upcoming removal of gstreamer 0.10, the logic for building
qt5multimeda with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 611b41a8c7..e598140a9a 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -18,10 +18,6 @@ QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
-QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
 endif
