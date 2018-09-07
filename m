From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:21 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 harfbuzz
Message-ID: <20180907111513.D79E6800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=556ed7c3fd0d0f6206ffcadc0f3f5b94a7053062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6643d6fd8d..7ce1f57cd8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -59,7 +59,6 @@ VLC_CONF_OPTS += \
 	--disable-fluidsynth \
 	--disable-gme \
 	--disable-goom \
-	--disable-harfbuzz \
 	--disable-jack \
 	--disable-jpeg \
 	--disable-kai \
@@ -191,6 +190,13 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 VLC_DEPENDENCIES += libgl
 endif
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+VLC_CONF_OPTS += --enable-harfbuzz
+VLC_DEPENDENCIES += harfbuzz
+else
+VLC_CONF_OPTS += --disable-harfbuzz
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 VLC_CONF_OPTS += --enable-gles2
 VLC_DEPENDENCIES += libgles
