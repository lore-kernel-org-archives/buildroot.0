From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:23 +0200
Subject: [Buildroot] [PATCH 11/14] package/mesa3d: with a DRI driver,
	is a full OpenGL provider
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <6c6c678af9a7ff235f32d25f3bea03670749f41d.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Make mesa3d a provider for full OpenGL, as soon as a DRI driver is enabled.

Full OpenGL is only possible when:
  - a DRI driver is enabled,
  - and X.Org is enabled

Since DRI driver in fact depend on X.Org being enabled in the first place,
we can safely declare mesa3d as a full openGL provider as soon as at least
one DRI driver is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bd7a853..0793b48 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -26,8 +26,12 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
+	select BR2_PACKAGE_HAS_LIBGL
 	bool
 
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER
+
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
-- 
1.8.3.2
