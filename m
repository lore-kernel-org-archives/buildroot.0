From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:21:41 +0200
Subject: [Buildroot] [git commit] package: new category for fonts, icons,
	sounds and themes
Message-ID: <20150401212227.543C98191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db405d3219daffb05004d431569fb15e7d6b0476
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move all of the scattered fonts, icons, sound packs and themes into a
new category for them.
In preparation for the inclusion of more fonts.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |   28 ++++++++++++++++++++--------
 1 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 74ec00a..f00a18f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -186,6 +186,26 @@ menu "Games"
 	source "package/rubix/Config.in"
 endmenu
 
+menu "Fonts, icons, sounds and themes"
+
+comment "Fonts"
+	source "package/dejavu/Config.in"
+	source "package/ghostscript-fonts/Config.in"
+	source "package/liberation/Config.in"
+
+comment "Icons"
+	source "package/adwaita-icon-theme/Config.in"
+	source "package/hicolor-icon-theme/Config.in"
+
+comment "Sounds"
+	source "package/sound-theme-borealis/Config.in"
+	source "package/sound-theme-freedesktop/Config.in"
+
+comment "Themes"
+	source "package/gtk2-engines/Config.in"
+
+endmenu
+
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
@@ -265,9 +285,6 @@ comment "X applications"
 	source "package/xvkbd/Config.in"
 
 comment "X libraries and helper libraries"
-	source "package/dejavu/Config.in"
-	source "package/ghostscript-fonts/Config.in"
-	source "package/liberation/Config.in"
 	source "package/libsexy/Config.in"
 	source "package/x11r7/xkeyboard-config/Config.in"
 
@@ -697,7 +714,6 @@ menu "Filesystem"
 endmenu
 
 menu "Graphics"
-	source "package/adwaita-icon-theme/Config.in"
 	source "package/atk/Config.in"
 	source "package/cairo/Config.in"
 	source "package/exiv2/Config.in"
@@ -708,9 +724,7 @@ menu "Graphics"
 	source "package/gdk-pixbuf/Config.in"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
-	source "package/gtk2-engines/Config.in"
 	source "package/harfbuzz/Config.in"
-	source "package/hicolor-icon-theme/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
@@ -1063,8 +1077,6 @@ menu "Miscellaneous"
 	source "package/qemu/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
-	source "package/sound-theme-borealis/Config.in"
-	source "package/sound-theme-freedesktop/Config.in"
 	source "package/wine/Config.in"
 endmenu
 
