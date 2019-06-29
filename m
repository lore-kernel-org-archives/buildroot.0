From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 19:25:26 +0200
Subject: [Buildroot] [PATCH v4 3/9] package/mesa3d: add OSMesa classic needs
 dri swrast
In-Reply-To: <20190629172532.26231-1-bernd.kuhls@t-online.de>
References: <20190629172532.26231-1-bernd.kuhls@t-online.de>
Message-ID: <20190629172532.26231-3-bernd.kuhls@t-online.de>
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
v4: rebased (Bernd)

 Config.in.legacy         | 1 +
 package/mesa3d/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 44933ba45d..754a08ee73 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,6 +148,7 @@ comment "Legacy options removed in 2019.08"
 
 config BR2_PACKAGE_MESA3D_OSMESA
 	bool "mesa OSMesa option renamed"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	help
 	  The option was renamed in order to match the naming used
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bd05116aca..9bb95c3fd6 100644
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
