From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:40 +0200
Subject: [Buildroot] [PATCH 17/18] package/kodi/Config.in: fix menus ordering
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-17-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
package/kodi/Config.in:313: Menus in: if BR2_PACKAGE_KODI,
                            are not alphabetically ordered;
                            correct order: '-', '_', digits, capitals, lowercase;
                            first incorrect menu: Inputstream addons

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 626038e8c8..8e30e2f3ea 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -304,17 +304,17 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Inputstream addons"
+        source "package/kodi-inputstream-adaptive/Config.in"
+        source "package/kodi-inputstream-rtmp/Config.in"
+endmenu
+
 menu "Peripheral addons"
 	source "package/kodi-peripheral-joystick/Config.in"
 	source "package/kodi-peripheral-steamcontroller/Config.in"
 	source "package/kodi-peripheral-xarcade/Config.in"
 endmenu
 
-menu "Inputstream addons"
-	source "package/kodi-inputstream-adaptive/Config.in"
-	source "package/kodi-inputstream-rtmp/Config.in"
-endmenu
-
 menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
-- 
2.17.1
