From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Dec 2018 09:00:08 +0100
Subject: [Buildroot] [PATCH 1/2] webkitgtk: remove an old workaround
Message-ID: <20181225080009.25780-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixed upstream by https://trac.webkit.org/changeset/220007/webkit

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/webkitgtk/webkitgtk.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 4cfddd1eb..e03fd969e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -39,13 +39,9 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_WEB_AUDIO=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
 else
-# ENABLE_MEDIA_STREAM has to be explicitly disabled because there is a missing
-# feature dependency in the WebKitGTK+ CMake files. This can be removed once
-# https://bugs.webkit.org/show_bug.cgi?id=174940 makes it into a release.
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF \
-	-DENABLE_MEDIA_STREAM=OFF
+	-DENABLE_WEB_AUDIO=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
-- 
2.17.1
