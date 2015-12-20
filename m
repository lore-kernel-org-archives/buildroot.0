From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:35:19 +0100
Subject: [Buildroot] [git commit] xutil_util-macros: move outside x11r7 scope
Message-ID: <20151220123524.7023280406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9065b1a0443bf18a1d0fea348ea2ce5905d140ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move to baseline package/
It doesn't really require x11r7 infrastructure and is in fact needed by
libepoxy which can be made x11r7-less.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                            | 1 +
 package/x11r7/Config.in                                      | 1 -
 package/{x11r7 => }/xutil_util-macros/Config.in              | 0
 package/{x11r7 => }/xutil_util-macros/xutil_util-macros.hash | 0
 package/{x11r7 => }/xutil_util-macros/xutil_util-macros.mk   | 0
 5 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index f5f323c..45de28f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1245,6 +1245,7 @@ menu "Miscellaneous"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
 	source "package/wine/Config.in"
+	source "package/xutil_util-macros/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2f87cbd..381157f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -265,7 +265,6 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Utilities"
 		source package/x11r7/xutil_makedepend/Config.in
-		source package/x11r7/xutil_util-macros/Config.in
 		source package/x11r7/mcookie/Config.in
 	endmenu
 	menu "X11R7 Other data"
diff --git a/package/x11r7/xutil_util-macros/Config.in b/package/xutil_util-macros/Config.in
similarity index 100%
rename from package/x11r7/xutil_util-macros/Config.in
rename to package/xutil_util-macros/Config.in
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
similarity index 100%
rename from package/x11r7/xutil_util-macros/xutil_util-macros.hash
rename to package/xutil_util-macros/xutil_util-macros.hash
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
similarity index 100%
rename from package/x11r7/xutil_util-macros/xutil_util-macros.mk
rename to package/xutil_util-macros/xutil_util-macros.mk
