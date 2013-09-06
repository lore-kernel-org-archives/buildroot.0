From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:17 -0500
Subject: [Buildroot] [PATCH v2 3/7] mesa3d: pull out from x11
In-Reply-To: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1378441521-10050-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                                     | 1 +
 package/{x11r7 => }/mesa3d/Config.in                  | 0
 package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch | 0
 package/{x11r7 => }/mesa3d/mesa3d.mk                  | 0
 package/x11r7/Config.in                               | 1 -
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename package/{x11r7 => }/mesa3d/Config.in (100%)
 rename package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch (100%)
 rename package/{x11r7 => }/mesa3d/mesa3d.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index a94cb62..0111771 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -278,6 +278,7 @@ source "package/lvm2/Config.in"
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
index 205079c..d5d6e60 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
-		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
-- 
1.8.1.2
