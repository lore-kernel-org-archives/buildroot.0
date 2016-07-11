From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jul 2016 20:08:57 +0200
Subject: [Buildroot] [PATCH v5 3/8] package/kodi: Add suboption to control
	UPnP support
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468260542-7194-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: no changes
v4: no changes
v3: rebased series, no changes to this patch
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 5 +++++
 package/kodi/kodi.mk   | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3d3ecfd..a000e79 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -227,6 +227,11 @@ config BR2_PACKAGE_KODI_LIBVA
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
index 8a3b0bf..52593aa 100644
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
