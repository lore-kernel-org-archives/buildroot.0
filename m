From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:19 +0100
Subject: [Buildroot] [PATCH 04/10] package/qt5multimedia: drop gstreamer
 0.10.x support
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming removal of gstreamer 0.10, the logic for building
qt5multimeda with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1
