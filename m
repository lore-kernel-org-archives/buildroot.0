From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:06:10 +0200
Subject: [Buildroot] [git commit] package/kodi: add optional support for
	event clients
Message-ID: <20170429101427.40CEB827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ac0b448b92f6335bf6b2d575611ad6ad828ab21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details read
https://github.com/xbmc/xbmc/blob/master/tools/EventClients/README.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 7 +++++++
 package/kodi/kodi.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index cd58cf2..36d2563 100644
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
index 4c7a2e8..3521999 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -202,6 +202,12 @@ else
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
