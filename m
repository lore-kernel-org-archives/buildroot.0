From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 01:02:48 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: fix EGL/GLES provider
Message-ID: <1396137768-22914-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

mesa3d being selected is not enough for it to be an EGL provider.

The corresponding options BR2_PACKAGE_MESA3D_OPENGL_EGL should be
enabled. This option already correctlt selects BR2_PACKAGE_HAS_OPENGL_EGL.

So, only declare mesa3d as an EGL provider if the option is set.

Ditto for GLES.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 217528b..8ed0c07 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -107,10 +107,10 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 endmenu
 
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
-	default "mesa3d"
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 config BR2_PACKAGE_PROVIDES_OPENGL_ES
-	default "mesa3d"
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif
 
-- 
1.8.3.2
