From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:29 +0100
Subject: [Buildroot] [PATCH v3 16/38] package/kodi: libxslt is an optional
	package
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-17-bernd.kuhls@t-online.de>
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
index f880153f6..ed51833f9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -73,8 +73,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 2b53d94a1..28d58bfe3 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -36,8 +36,6 @@ KODI_DEPENDENCIES = \
 	libgcrypt \
 	libplist \
 	libsamplerate \
-	libxml2 \
-	libxslt \
 	lzo \
 	ncurses \
 	openssl \
@@ -124,6 +122,13 @@ else
 KODI_CONF_OPTS += --disable-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+KODI_CONF_OPTS += --enable-libxslt
+KODI_DEPENDENCIES += libxslt
+else
+KODI_CONF_OPTS += --disable-libxslt
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_BLUEZ),y)
 KODI_CONF_OPTS += --enable-libbluetooth
 KODI_DEPENDENCIES += bluez5_utils
-- 
2.11.0
