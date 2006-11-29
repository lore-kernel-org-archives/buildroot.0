From: Pavel Roskin <proski@gnu.org>
Date: Wed, 29 Nov 2006 18:54:43 -0500
Subject: [Buildroot] [PATCH] SDL fix
Message-ID: <1164844483.23643.33.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --disable-arts to the configure switches for SDL.  We don't provide
the arts library, and it's checked for in a way not suitable for cross
compiling.

Index: package/sdl/sdl.mk
===================================================================
--- package/sdl/sdl.mk	(revision 16733)
+++ package/sdl/sdl.mk	(working copy)
@@ -27,6 +27,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--prefix=$(STAGING_DIR)/usr \
+	--disable-arts \
 	--disable-esd \
 	--disable-nasm \
 	--disable-video-x11 );


-- 
Regards,
Pavel Roskin
