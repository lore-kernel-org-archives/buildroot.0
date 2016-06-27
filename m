From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Jun 2016 07:29:11 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/kodi: Add suboption to control
	UPnP support
In-Reply-To: <1467005352-14070-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467005352-14070-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467005352-14070-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 5 +++++
 package/kodi/kodi.mk   | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 281de24..984f7bb 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -232,6 +232,11 @@ config BR2_PACKAGE_KODI_LIBVA
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
