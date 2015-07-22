From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:27 +0200
Subject: [Buildroot] [PATCH 05/47] package/kodi: Add option for lirc support
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/xbmc/xbmc/commit/b641e1eea54b4b9ab7f1b95092ab0a755abc63be

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in |    5 +++++
 package/kodi/kodi.mk   |    6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 62553d4..7d4b068 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -166,6 +166,11 @@ comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic
 	depends on !BR2_GCC_VERSION_4_5_X
 	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
+config BR2_PACKAGE_KODI_LIRC
+	bool "lirc"
+	help
+	  Enable lirc support
+
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
 	select BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0ab3114..f62f1a5 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -185,6 +185,12 @@ else
 KODI_CONF_OPTS += --disable-libcec
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
+KODI_CONF_OPTS += --enable-lirc
+else
+KODI_CONF_OPTS += --disable-lirc
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_WAVPACK),y)
 KODI_DEPENDENCIES += wavpack
 endif
-- 
1.7.10.4
