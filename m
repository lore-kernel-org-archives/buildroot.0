From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 07:51:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20090122075129.C694B765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 07:51:28 +0000 (Thu, 22 Jan 2009)
New Revision: 24951

Log:
Make sure ln command does not break if link exist

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2009-01-22 07:39:12 UTC (rev 24950)
+++ trunk/buildroot/package/sdl/sdl.mk	2009-01-22 07:51:28 UTC (rev 24951)
@@ -75,7 +75,7 @@
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 $(SDL_DIRECTFB_TARGET):
 	mkdir -p $(STAGING_DIR)/include
-	ln -s ../usr/include/directfb $(SDL_DIRECTFB_TARGET)
+	ln -s -f ../usr/include/directfb $(SDL_DIRECTFB_TARGET)
 endif
 
 $(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(SDL_DIRECTFB_TARGET)
