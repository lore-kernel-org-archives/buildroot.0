From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:46 +0200
Subject: [Buildroot] [PATCH v7 26/31] package/kodi: add optional support for
	lcms2
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-27-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support was added by https://github.com/xbmc/xbmc/pull/11846

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e30a57b33d..2e1a2ba994 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -150,6 +150,12 @@ config BR2_PACKAGE_KODI_LIBCEC
 comment "hdmi cec support needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
+config BR2_PACKAGE_KODI_LCMS2
+	bool "lcms2"
+	select BR2_PACKAGE_LCMS2
+	help
+	  Enable color management support.
+
 config BR2_PACKAGE_KODI_LIRC
 	bool "lirc"
 	help
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 330ae43c00..dea4d4c97a 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -289,6 +289,13 @@ else
 KODI_CONF_OPTS += -DENABLE_CEC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_LCMS2),y)
+KODI_DEPENDENCIES += lcms2
+KODI_CONF_OPTS += -DENABLE_LCMS2=ON
+else
+KODI_CONF_OPTS += -DENABLE_LCMS2=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
 KODI_CONF_OPTS += -DENABLE_LIRC=ON
 else
-- 
2.11.0
