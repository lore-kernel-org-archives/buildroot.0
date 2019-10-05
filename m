From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:27 +0200
Subject: [Buildroot] [PATCH v2 13/13] package/kodi/Config.in: fix menus
 ordering
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-14-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
package/kodi/Config.in:318: Menus in: if BR2_PACKAGE_KODI,
                            are not alphabetically ordered;
                            correct order: '-', '_', digits, capitals, lowercase;
                            first incorrect menu: PVR addons

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/kodi/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a586f130b8..c222c8fdf5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -308,12 +308,6 @@ menu "Inputstream addons"
 	source "package/kodi-inputstream-rtmp/Config.in"
 endmenu
 
-menu "Peripheral addons"
-	source "package/kodi-peripheral-joystick/Config.in"
-	source "package/kodi-peripheral-steamcontroller/Config.in"
-	source "package/kodi-peripheral-xarcade/Config.in"
-endmenu
-
 menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
@@ -334,6 +328,12 @@ menu "PVR addons"
 	source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
+menu "Peripheral addons"
+	source "package/kodi-peripheral-joystick/Config.in"
+	source "package/kodi-peripheral-steamcontroller/Config.in"
+	source "package/kodi-peripheral-xarcade/Config.in"
+endmenu
+
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-asterwave/Config.in"
-- 
2.17.1
