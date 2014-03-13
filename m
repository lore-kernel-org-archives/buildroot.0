From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 13 Mar 2014 23:15:47 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v8_1/5=5D_mesa3d=3A_pull_out_from_?=
	=?utf-8?q?x11?=
Message-ID: <BLU0-SMTP128329771853DC186B6367AD9710@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d does not depend on x11, it can be used by wayland or other apps

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
v8: no changes
v7: no changes
v6: no changes
v5: added explanation (Yann)
v4: rebased v3
v3: Config.in: move package to "Graphic libraries" (Arnout)
v2: rebased v1
v1: rebased Spenser Gilliland?s patch:
    http://patchwork.ozlabs.org/patch/278302/

 package/Config.in                                     |    1 +
 package/{x11r7 => }/mesa3d/Config.in                  |    0
 package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch |    0
 package/{x11r7 => }/mesa3d/mesa3d.mk                  |    0
 package/x11r7/Config.in                               |    1 -
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename package/{x11r7 => }/mesa3d/Config.in (100%)
 rename package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch (100%)
 rename package/{x11r7 => }/mesa3d/mesa3d.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..b0da653 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -188,6 +188,7 @@ source "package/fbv/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
+source "package/mesa3d/Config.in"
 source "package/ocrad/Config.in"
 source "package/psplash/Config.in"
 source "package/sawman/Config.in"
diff --git a/package/x11r7/mesa3d/Config.in b/package/mesa3d/Config.in
similarity index 100%
rename from package/x11r7/mesa3d/Config.in
rename to package/mesa3d/Config.in
diff --git a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch b/package/mesa3d/mesa3d-uclibc-locale.patch
similarity index 100%
rename from package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
rename to package/mesa3d/mesa3d-uclibc-locale.patch
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
similarity index 100%
rename from package/x11r7/mesa3d/mesa3d.mk
rename to package/mesa3d/mesa3d.mk
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 5ef118b..458d09f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -15,7 +15,6 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
-		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
-- 
1.7.10.4
