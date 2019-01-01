From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 16:59:10 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/webkitgtk: remove
 an old workaround
Message-ID: <20190101155617.5D954803FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e840698dd178703757e4ae8c1b68e10d3e539b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

fixed upstream by https://trac.webkit.org/changeset/220007/webkit

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd52bed3a43126a83f5cc4d1aba462c6cc85d9de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f86c073d65..9a1b392bb5 100644
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
