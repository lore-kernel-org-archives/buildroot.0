From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:56:50 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add comment for when
	OpenGL EGL is not available
Message-ID: <20140417210125.3E6309C84C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcec14b7f4c40b54dd19af3985fe65572c0291b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenGL EGL needs udev support, so add a comment stating so.

Also, reword the OpenGL EGL prompt to be in the same format as the
OpenGL ES prompt (and like the full OpenGL prompt that will shortly
be added, too.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 3a2766b..bd7a853 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -92,8 +92,11 @@ if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
 
+comment "OpenGL EGL needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
-	bool "EGL"
+	bool "OpenGL EGL"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_HAS_LIBEGL
 	help
