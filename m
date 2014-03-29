From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:10:56 +0100
Subject: [Buildroot] [git commit] mesa3d: pull out from x11
Message-ID: <20140329222157.C97069C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5fcd32f164486d1330dcf7e9d12d05f97579bf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d does not depend on x11, it can be used by wayland or other apps

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/{x11r7 => }/mesa3d/Config.in               |    0
 .../{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch  |    0
 package/{x11r7 => }/mesa3d/mesa3d.mk               |    0
 package/x11r7/Config.in                            |    1 -
 5 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8c2c700..e816603 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ source "package/fbv/Config.in"
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
