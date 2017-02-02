From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:35 +0100
Subject: [Buildroot] [PATCH 17/38] package/kodi: add optional support for
	lcms2
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added by
https://github.com/xbmc/xbmc/commit/4a635240ae5a6a3a03750efba0f30b65b5de7c2d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ed51833f9..6f8e9a1cc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -134,6 +134,12 @@ config BR2_PACKAGE_KODI_DBUS
 	help
 	  Enable D-Bus support
 
+config BR2_PACKAGE_KODI_LCMS2
+	bool "lcms2"
+	select BR2_PACKAGE_LCMS2
+	help
+	  Enable lcms2 support
+
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 28d58bfe3..08ed68b14 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -198,6 +198,13 @@ else
 KODI_CONF_OPTS += --disable-nfs
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LCMS2),y)
+KODI_DEPENDENCIES += lcms2
+KODI_CONF_OPTS += --enable-lcms2
+else
+KODI_CONF_OPTS += --disable-lcms2
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_LIBBLURAY),y)
 KODI_DEPENDENCIES += libbluray
 KODI_CONF_OPTS += --enable-libbluray
-- 
2.11.0
