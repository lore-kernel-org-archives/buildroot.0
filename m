From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  6 May 2019 11:54:46 +0200
Subject: [Buildroot] [PATCH v3 4/9] package/mesa3d: Only one swrast provider
 can be built
In-Reply-To: <20190506095451.26522-1-romain.naour@smile.fr>
References: <20190506095451.26522-1-romain.naour@smile.fr>
Message-ID: <20190506095451.26522-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://cgit.freedesktop.org/mesa/mesa/commit/?id=de24d61765011ed4bfc169b8ad8cf67e86b1f3bd

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9bb95c3fd6..6ec395723a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -173,11 +173,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	bool "Gallium swrast driver"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
+comment "Gallium swrast: Only one swrast provider can be built"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_ARM_CPU_HAS_NEON || BR2_aarch64
-- 
2.20.1
