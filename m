From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Jul 2015 20:50:53 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/kodi: Remove hyperflous option
	--disable-dvdcss
Message-ID: <1435863053-23943-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option is controlled later on inside this if-clause

ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Rebased local repo against upstream (Yann)

 package/kodi/kodi.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 28fece7..cc42df4 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -34,7 +34,6 @@ KODI_CONF_ENV = \
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
 	--disable-crystalhd \
-	--disable-dvdcss \
 	--disable-hal \
 	--disable-joystick \
 	--disable-openmax \
-- 
1.7.10.4
