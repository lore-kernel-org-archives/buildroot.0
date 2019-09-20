From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Sep 2019 18:38:39 +0200
Subject: [Buildroot] [PATCH v13 03/13] package/mesa3d: add OSMesa classic
 needs dri swrast
In-Reply-To: <20190920163849.8124-1-bernd.kuhls@t-online.de>
References: <20190920163849.8124-1-bernd.kuhls@t-online.de>
Message-ID: <20190920163849.8124-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

The meson build system now check if dri swrast is enabled
when OSMesa classic is enabled.

See:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=cbbd5bb889a2c271a504c379f36a7cb717a85af4

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 13739f54c5..77ac0469e9 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -267,10 +267,14 @@ comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	bool "OSMesa (classic) library"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	help
 	  The OSMesa classic API provides functions for
 	  making off-screen renderings.
 
+comment "OSMesa classic requires dri (classic) swrast"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
-- 
2.20.1
