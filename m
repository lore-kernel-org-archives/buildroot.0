From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:05 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 gst1-plugins-base
Message-ID: <20180907111513.896B380DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74255f8339cbe3106ede9eb145ca18d698c6cfc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 91e96516ac..6643d6fd8d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -59,7 +59,6 @@ VLC_CONF_OPTS += \
 	--disable-fluidsynth \
 	--disable-gme \
 	--disable-goom \
-	--disable-gst-decode \
 	--disable-harfbuzz \
 	--disable-jack \
 	--disable-jpeg \
@@ -181,6 +180,13 @@ else
 VLC_CONF_OPTS += --disable-freerdp
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+VLC_CONF_OPTS += --enable-gst-decode
+VLC_DEPENDENCIES += gst1-plugins-base
+else
+VLC_CONF_OPTS += --disable-gst-decode
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 VLC_DEPENDENCIES += libgl
 endif
