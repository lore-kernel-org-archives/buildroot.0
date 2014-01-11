From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 11 Jan 2014 20:29:01 +0100
Subject: [Buildroot] [PATCH 4/6] mesa3d: pull out from x11
In-Reply-To: <1389468543-6664-1-git-send-email-berndkuhls@hotmail.com>
References: <1389468543-6664-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP73945204B591C3909EECFDD9B20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rebased Spenser Gilliland?s patch:
http://patchwork.ozlabs.org/patch/278302/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
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
index b558069..7b424df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -309,6 +309,7 @@ source "package/lvm2/Config.in"
 source "package/mdadm/Config.in"
 source "package/media-ctl/Config.in"
 source "package/memtester/Config.in"
+source "package/mesa3d/Config.in"
 source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
 source "package/neard/Config.in"
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
