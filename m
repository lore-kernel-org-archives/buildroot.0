From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2020 23:10:05 +0100
Subject: [Buildroot] [git commit] package/mpv: add libv4l support
Message-ID: <20200119220028.819F9829F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22f4c826ca2c7edca7761394a5175b45a4fc22b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 2150f7e9aa..8619de5a8e 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -23,7 +23,6 @@ MPV_CONF_OPTS = \
 	--disable-cocoa \
 	--disable-coreaudio \
 	--disable-cuda-hwaccel \
-	--disable-libv4l2 \
 	--disable-opensles \
 	--disable-rsound \
 	--disable-rubberband \
@@ -129,6 +128,16 @@ else
 MPV_CONF_OPTS += --disable-drm
 endif
 
+# libv4l
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+MPV_CONF_OPTS += \
+	--enable-libv4l2 \
+	--enable-tv
+MPV_DEPENDENCIES += libv4l
+else
+MPV_CONF_OPTS += --disable-libv4l2
+endif
+
 # libvdpau
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
 MPV_CONF_OPTS += --enable-vdpau
