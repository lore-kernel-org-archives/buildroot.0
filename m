From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:28:42 +0100
Subject: [Buildroot] [PATCH v4 21/39] package/kodi: add optional support for
	lcms2
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-22-bernd.kuhls@t-online.de>
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
index 6c76773bb..b7b284058 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -158,6 +158,12 @@ config BR2_PACKAGE_KODI_LIBCEC
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
index 2dd1f7be2..7c4695668 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -286,6 +286,13 @@ else
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
