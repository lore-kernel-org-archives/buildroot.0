From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 23 May 2008 06:29:20 -0700 (PDT)
Subject: [Buildroot] [PATCH]: Make libgtk2 visible with DirectFB and not
 just XORG
Message-ID: <17425625.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


LibGTK is not visible as Config.in only enables it if XORG is set.  I have
only DirectFB.

--- buildroot/package/libgtk2/Config.in 
+++ buildroot.new/package/libgtk2/Config.in 
@@ -8,9 +8,8 @@
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_CUPS
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
+	depends on
BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
 	help
 	  The GTK+ version 2 graphical user interface library
-- 
View this message in context: http://www.nabble.com/-PATCH-%3A-Make-libgtk2-visible-with-DirectFB-and-not-just-XORG-tp17425625p17425625.html
Sent from the BuildRoot mailing list archive at Nabble.com.
