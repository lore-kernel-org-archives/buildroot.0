From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Jun 2016 23:00:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: Add suboption to control UPnP
	support
In-Reply-To: <1465938028-8149-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465938028-8149-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465938028-8149-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
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
index 17d20a9..c72c5d1 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -187,6 +187,12 @@ else
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
