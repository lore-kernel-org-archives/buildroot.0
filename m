From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  6 May 2019 11:54:45 +0200
Subject: [Buildroot] [PATCH v3 3/9] package/mesa3d: add OSMesa classic needs
 dri swrast
In-Reply-To: <20190506095451.26522-1-romain.naour@smile.fr>
References: <20190506095451.26522-1-romain.naour@smile.fr>
Message-ID: <20190506095451.26522-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The meson build system now check if dri swrast is enabled
when OSMesa classic is enabled.

See:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=cbbd5bb889a2c271a504c379f36a7cb717a85af4

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy         | 1 +
 package/mesa3d/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index f0dfa90e5a..31cb16d0ef 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,6 +148,7 @@ comment "Legacy options removed in 2019.05"
 
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
