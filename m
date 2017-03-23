From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:28:39 +0100
Subject: [Buildroot] [PATCH v4 18/39] package/kodi: libxslt is an optional
	package
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After this commit
https://github.com/xbmc/xbmc/commit/bad3902b4a2538a433f858c97b2cf91c44c7feff
libxslt is an optional package

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 2 --
 package/kodi/kodi.mk   | 9 +++++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2d3faf562..9537c0f7e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -74,8 +74,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index b903dd979..af8836992 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -37,8 +37,6 @@ KODI_DEPENDENCIES = \
 	libgcrypt \
 	libplist \
 	libsamplerate \
-	libxml2 \
-	libxslt \
 	lzo \
 	ncurses \
 	openssl \
@@ -171,6 +169,13 @@ else
 KODI_CONF_OPTS += -DENABLE_CAP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+KODI_CONF_OPTS += -DENABLE_XSLT=ON
+KODI_DEPENDENCIES += libxslt
+else
+KODI_CONF_OPTS += -DENABLE_XSLT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
 KODI_CONF_OPTS += -DENABLE_BLUETOOTH=ON
 KODI_DEPENDENCIES += bluez5_utils
-- 
2.11.0
