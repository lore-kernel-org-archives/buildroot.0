From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:45 +0200
Subject: [Buildroot] [PATCH v7 25/31] package/kodi: add optional support for
	event clients
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-26-bernd.kuhls@t-online.de>
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
index 6768533d0c..e30a57b33d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -125,6 +125,13 @@ config BR2_PACKAGE_KODI_DBUS
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
index 483f798b2e..330ae43c00 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -204,6 +204,12 @@ else
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
