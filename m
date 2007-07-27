From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 05:47:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070727124759.50141A4602@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 05:47:58 -0700 (Fri, 27 Jul 2007)
New Revision: 19276

Log:
- a separate Video menu is redundant WRT the Graphic submenu


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-27 12:37:30 UTC (rev 19275)
+++ trunk/buildroot/package/Config.in	2007-07-27 12:47:58 UTC (rev 19276)
@@ -257,16 +257,6 @@
 source "package/mpg123/Config.in"
 endif
 
-menuconfig BR2_VIDEO_SUPPORT
-	bool "Video libraries and applications"
-	default y
-	help
-	  Support for video libraries and applications
-
-if BR2_VIDEO_SUPPORT
-source "package/mplayer/Config.in"
-endif
-
 menuconfig BR2_GRAPHIC_SUPPORT
 	bool "Graphic libraries and applications (graphic/text)"
 	default y
@@ -344,6 +334,8 @@
 source "package/rdesktop/Config.in"
 source "package/rxvt/Config.in"
 
+comment "Video libraries/codecs and applications"
+source "package/mplayer/Config.in"
 endif
 
 menuconfig BR2_COMPRESSOR_SUPPORT
