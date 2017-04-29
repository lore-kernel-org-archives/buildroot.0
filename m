From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:06:28 +0200
Subject: [Buildroot] [git commit] package/kodi: add optional support for
	lcms2
Message-ID: <20170429101427.4BF70827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=802d2527b1b16418e61d45ae201b1904de189720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support was added by https://github.com/xbmc/xbmc/pull/11846

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 36d2563..bf4ea01 100644
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
index 3521999..a4835f0 100644
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
