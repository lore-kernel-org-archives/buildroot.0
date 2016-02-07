From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  7 Feb 2016 18:15:54 +0100
Subject: [Buildroot] [PATCH] package/yad: fix the dependency on gtk3
Message-ID: <1454865354-13825-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As 9b17d8285096087bff8543d79e8a2b6ea0810192 states, yad
needs gtk3-x11. So yad must depends on BR2_PACKAGE_LIBGTK3_X11
instead of BR2_PACKAGE_LIBGTK3 only.

Fixes:
http://autobuild.buildroot.net/results/049/0490f206eb9bf6ae8729caceaea274bf7912413c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/yad/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/yad/Config.in b/package/yad/Config.in
index e4b63a2..c065f1f 100644
--- a/package/yad/Config.in
+++ b/package/yad/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_YAD
 	bool "yad"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
 	help
 	  YAD (yet another dialog) is a tool for create graphical dialogs
 	  from shell scripts.
 
 	  http://sourceforge.net/projects/yad-dialog/
 
-comment "yad needs libgtk2 or libgtk3"
+comment "yad needs libgtk2 or libgtk3 with X11 backend"
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
+	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3_X11
-- 
2.4.3
