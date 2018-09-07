From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:30 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 libva
Message-ID: <20180907111515.0C8CD80DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1ff252506735a4e97cb846ccc87528ab2d65678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a15bda3204..af500cba33 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -64,7 +64,6 @@ VLC_CONF_OPTS += \
 	--disable-kate \
 	--disable-kva \
 	--disable-libplacebo \
-	--disable-libva \
 	--disable-linsys \
 	--disable-mfx \
 	--disable-microdns \
@@ -378,6 +377,14 @@ else
 VLC_CONF_OPTS += --disable-upnp
 endif
 
+# libva support depends on ffmpeg
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBVA),yy)
+VLC_CONF_OPTS += --enable-libva
+VLC_DEPENDENCIES += libva
+else
+VLC_CONF_OPTS += --disable-libva
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
 VLC_CONF_OPTS += --enable-vnc
 VLC_DEPENDENCIES += libvncserver
