From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue,  3 Mar 2015 19:32:05 -0800
Subject: [Buildroot] [PATCH 1/1] kodi: allow mysql to be used
Message-ID: <1425439925-13290-1-git-send-email-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/kodi/kodi.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 01c7e80..0a6fe7c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -37,7 +37,6 @@ KODI_CONF_OPTS +=  \
 	--disable-dvdcss \
 	--disable-hal \
 	--disable-joystick \
-	--disable-mysql \
 	--disable-openmax \
 	--disable-projectm \
 	--disable-pulse \
@@ -46,6 +45,14 @@ KODI_CONF_OPTS +=  \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+KODI_CONF_OPTS += --enable-mysql
+KODI_CONF_ENV += ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
+KODI_DEPENDENCIES += mysql
+else
+KODI_CONF_OPTS += --disable-mysql
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
 KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
-- 
2.3.1
