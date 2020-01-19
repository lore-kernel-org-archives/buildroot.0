From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Jan 2020 10:51:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: add libv4l support
Message-ID: <20200119095102.1564028-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.1
