From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:26 +0200
Subject: [Buildroot] [PATCH v2 12/13] package/kodi/Config.in: fix menus
 ordering
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-13-jerzy.m.grzegorek@gmail.com>
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/kodi/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e8a504312c..a586f130b8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -303,17 +303,17 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Inputstream addons"
+	source "package/kodi-inputstream-adaptive/Config.in"
+	source "package/kodi-inputstream-rtmp/Config.in"
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
