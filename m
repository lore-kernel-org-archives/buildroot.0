From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Jul 2016 23:25:32 +0200
Subject: [Buildroot] [PATCH v3 3/6] package/kodi: Add suboption to control
	UPnP support
In-Reply-To: <1467926735-29733-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467926735-29733-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467926735-29733-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: rebased series, no changes to this patch
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 5 +++++
 package/kodi/kodi.mk   | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e57939e..7c8ada0 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -233,6 +233,11 @@ config BR2_PACKAGE_KODI_LIBVA
 	help
 	  Enable libva support.
 
+config BR2_PACKAGE_KODI_UPNP
+	bool "upnp"
+	help
+	  Enable UPnP support
+
 config BR2_PACKAGE_KODI_OPTICALDRIVE
 	bool
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 9d6b966..0d98180 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -228,6 +228,12 @@ else
 KODI_CONF_OPTS += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_UPNP),y)
+KODI_CONF_OPTS += --enable-upnp
+else
+KODI_CONF_OPTS += --disable-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
 KODI_CONF_OPTS += --enable-optical-drive --enable-dvdcss
 else
-- 
2.8.1
