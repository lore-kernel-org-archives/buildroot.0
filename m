From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 13:36:33 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to libnfs
Message-ID: <20180816113141.C5D078B709@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02091bcc25385c7699ea610d45d8fb4df7b6649d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index d34ab2a9e0..fab08b950d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -71,7 +71,6 @@ VLC_CONF_OPTS += \
 	--disable-mmal \
 	--disable-mpg123 \
 	--disable-mtp \
-	--disable-nfs \
 	--disable-notify \
 	--disable-projectm \
 	--disable-schroedinger \
@@ -311,6 +310,13 @@ else
 VLC_CONF_OPTS += --disable-libmpeg2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNFS),y)
+VLC_CONF_OPTS += --enable-nfs
+VLC_DEPENDENCIES += libnfs
+else
+VLC_CONF_OPTS += --disable-nfs
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 VLC_CONF_OPTS += --enable-png
 VLC_DEPENDENCIES += libpng
