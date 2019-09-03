From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:41 +0200
Subject: [Buildroot] [PATCH 18/18] package/kodi/Config.in: fix menus ordering
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-18-jerzy.m.grzegorek@gmail.com>
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
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8e30e2f3ea..a7b4723d46 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -309,12 +309,6 @@ menu "Inputstream addons"
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
@@ -335,6 +329,12 @@ menu "PVR addons"
 	source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
+menu "Peripheral addons"
+        source "package/kodi-peripheral-joystick/Config.in"
+        source "package/kodi-peripheral-steamcontroller/Config.in"
+        source "package/kodi-peripheral-xarcade/Config.in"
+endmenu
+
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-asterwave/Config.in"
-- 
2.17.1
