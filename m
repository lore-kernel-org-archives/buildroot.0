From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:59:38 +0200
Subject: [Buildroot] [git commit] package/libva: switch to virtual opengl
 provider
Message-ID: <20191022205317.3E40283E00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91718dc6def8292b7e40d147362664b60983d7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to use libva without mesa3d.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 6c8243da90..176f971128 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -20,8 +20,8 @@ LIBVA_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
-LIBVA_DEPENDENCIES += mesa3d
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+LIBVA_DEPENDENCIES += libgl
 LIBVA_CONF_OPTS += --enable-glx
 endif
 else
