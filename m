From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:24:38 +0200
Subject: [Buildroot] [git commit] package/kodi: Add suboption to control
	UPnP support
Message-ID: <20160717123353.7796781D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29ad494654266816d6b6a0e5818f8ff0f7465c7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
