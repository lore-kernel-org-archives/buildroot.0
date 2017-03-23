From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:28:41 +0100
Subject: [Buildroot] [PATCH v4 20/39] package/kodi: add optional support for
	event clients
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details read
https://github.com/xbmc/xbmc/blob/master/tools/EventClients/README.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 5 +++++
 package/kodi/kodi.mk   | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 835af932c..6c76773bb 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -135,6 +135,11 @@ config BR2_PACKAGE_KODI_DBUS
 	help
 	  Enable D-Bus support
 
+config BR2_PACKAGE_KODI_EVENTCLIENTS
+	bool "eventclients"
+	help
+	  Enable event clients support
+
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 3fba83aa9..2dd1f7be2 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -190,6 +190,12 @@ else
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
