From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 19:44:30 +0100
Subject: [Buildroot] [git commit] kodi: allow mysql to be used
Message-ID: <20150304184442.2670A8041C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e89fba08b888a4f7d5ea797019787866f04e4404
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

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
