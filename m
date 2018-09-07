From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:30 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 mpg123
Message-ID: <20180907111515.85324800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=108181bfe3dc67e64e43ab2ee469efdfc87f5966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index af500cba33..3dbaac1757 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -68,7 +68,6 @@ VLC_CONF_OPTS += \
 	--disable-mfx \
 	--disable-microdns \
 	--disable-mmal \
-	--disable-mpg123 \
 	--disable-mtp \
 	--disable-notify \
 	--disable-projectm \
@@ -453,6 +452,13 @@ ifeq ($(BR2_PACKAGE_MINIZIP),y)
 VLC_DEPENDENCIES += minizip
 endif
 
+ifeq ($(BR2_PACKAGE_MPG123),y)
+VLC_CONF_OPTS += --enable-mpg123
+VLC_DEPENDENCIES += mpg123
+else
+VLC_CONF_OPTS += --disable-mpg123
+endif
+
 ifeq ($(BR2_PACKAGE_MUSEPACK),y)
 VLC_CONF_OPTS += --enable-mpc
 VLC_DEPENDENCIES += musepack
