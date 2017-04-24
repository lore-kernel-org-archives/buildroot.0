From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Apr 2017 23:32:01 +0200
Subject: [Buildroot] [PATCH v6 26/31] package/kodi: add optional support for
	lcms2
In-Reply-To: <20170424213206.26247-1-bernd.kuhls@t-online.de>
References: <20170424213206.26247-1-bernd.kuhls@t-online.de>
Message-ID: <20170424213206.26247-27-bernd.kuhls@t-online.de>
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
index af88aa334f..662dd89f25 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -151,6 +151,12 @@ config BR2_PACKAGE_KODI_LIBCEC
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
index 7d8adcd2b9..245b8bfbe6 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -290,6 +290,13 @@ else
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
