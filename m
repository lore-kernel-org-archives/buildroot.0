From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Dec 2018 19:19:43 +0100
Subject: [Buildroot] [PATCH 1/1] libva: fix build with pkgconf 1.5.3
Message-ID: <20181211181943.14944-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set ac_cv_path_WAYLAND_SCANNER to the wayland-scanner in the host
directory otherwise build will fail because libva will use pkgconfig to
find it

Fixes:
 - http://autobuild.buildroot.org/results/836d3a7085c576f607b1532d5204a54d6c2c1e66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
