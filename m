From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:31:08 +0200
Subject: [Buildroot] [git commit] package/mesa3d: fix EGL/GLES provider
Message-ID: <20140330094742.A93DF9C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=694c876e55116cae80522539a347c9fee9bf487d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d being selected is not enough for it to be an EGL provider.

The corresponding options BR2_PACKAGE_MESA3D_OPENGL_EGL should be
enabled. This option already correctlt selects BR2_PACKAGE_HAS_OPENGL_EGL.

So, only declare mesa3d as an EGL provider if the option is set.

Ditto for GLES.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
