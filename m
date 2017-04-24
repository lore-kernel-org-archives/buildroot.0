From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Apr 2017 23:32:00 +0200
Subject: [Buildroot] [PATCH v6 25/31] package/kodi: add optional support for
	event clients
In-Reply-To: <20170424213206.26247-1-bernd.kuhls@t-online.de>
References: <20170424213206.26247-1-bernd.kuhls@t-online.de>
Message-ID: <20170424213206.26247-26-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details read
https://github.com/xbmc/xbmc/blob/master/tools/EventClients/README.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 7 +++++++
 package/kodi/kodi.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4693b69ea7..af88aa334f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -126,6 +126,13 @@ config BR2_PACKAGE_KODI_DBUS
 	help
 	  Enable D-Bus support
 
+config BR2_PACKAGE_KODI_EVENTCLIENTS
+	bool "eventclients"
+	help
+	  Enable event clients support
+
+	  https://github.com/xbmc/xbmc/blob/master/tools/EventClients/README.txt
+
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7a0080216e..7d8adcd2b9 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -205,6 +205,12 @@ else
 KODI_CONF_OPTS += -DENABLE_DBUS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_EVENTCLIENTS),y)
+KODI_CONF_OPTS += -DENABLE_EVENTCLIENTS=ON
+else
+KODI_CONF_OPTS += -DENABLE_EVENTCLIENTS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_ALSA_LIB),y)
 KODI_CONF_OPTS += -DENABLE_ALSA=ON
 KODI_DEPENDENCIES += alsa-lib
-- 
2.11.0
