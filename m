From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:25:43 +0200
Subject: [Buildroot] [git commit] package/kodi: remove optional libtheora
 support
Message-ID: <20200405141204.C0A49839CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ba1fb9bddc06534c95ba402c669c97a67f9a880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kodi plays these files through ffmpeg and does not link to libtheora
anymore, see PR 9686.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       | 6 ++++++
 package/kodi/Config.in | 7 -------
 package/kodi/kodi.mk   | 4 ----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 22f6a2778d..caf31d4be3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_KODI_LIBTHEORA
+	bool "libtheora support in Kodi was removed"
+	select BR2_LEGACY
+	help
+	  Kodi does not need libtheora
+
 config BR2_PACKAGE_CEGUI06
 	bool "BR2_PACKAGE_CEGUI06 was renamed"
 	select BR2_PACKAGE_CEGUI
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 07128ac3c5..f5b37cf7d2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -251,13 +251,6 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	help
 	  Enable Samba support
 
-config BR2_PACKAGE_KODI_LIBTHEORA
-	bool "theora"
-	select BR2_PACKAGE_LIBTHEORA
-	help
-	  Enable Theora input support.
-	  Select this if you want to play back OGG/OGV files (Video).
-
 config BR2_PACKAGE_KODI_LIBUSB
 	bool "usb"
 	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 71b6d44415..0c4704ea84 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -315,10 +315,6 @@ ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 KODI_DEPENDENCIES += lirc-tools
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_LIBTHEORA),y)
-KODI_DEPENDENCIES += libtheora
-endif
-
 # kodi needs libva & libva-glx
 ifeq ($(BR2_PACKAGE_KODI_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
 KODI_DEPENDENCIES += mesa3d libva
