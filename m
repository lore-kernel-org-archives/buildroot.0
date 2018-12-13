From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:48:21 +0100
Subject: [Buildroot] [git commit] libva: fix build with pkgconf 1.5.3
Message-ID: <20181213204428.9F3F28D295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d614e83c936e2d64fab77310c73157c7d87917b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set ac_cv_path_WAYLAND_SCANNER to the wayland-scanner in the host
directory otherwise build will fail because libva will use pkgconfig to
find it

Fixes:
 - http://autobuild.buildroot.org/results/836d3a7085c576f607b1532d5204a54d6c2c1e66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 9a70bb83fd..b897d35849 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -30,6 +30,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
+LIBVA_CONF_ENV += ac_cv_path_WAYLAND_SCANNER=$(HOST_DIR)/usr/bin/wayland-scanner
 LIBVA_CONF_OPTS += --enable-wayland
 else
 LIBVA_CONF_OPTS += --disable-wayland
