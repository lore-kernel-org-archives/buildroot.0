From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 30 Nov 2006 01:06:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20061130090654.207EB485A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-30 01:06:53 -0800 (Thu, 30 Nov 2006)
New Revision: 16737

Log:
-  We don't provide the arts library, and it's checked for in a way not suitable for cross compiling.
Thanks to Pavel Roskin.


Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2006-11-29 23:15:04 UTC (rev 16736)
+++ trunk/buildroot/package/sdl/sdl.mk	2006-11-30 09:06:53 UTC (rev 16737)
@@ -21,12 +21,13 @@
 $(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
 	(cd $(SDL_DIR); \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) " \
+	CFLAGS="$(TARGET_CFLAGS)" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--prefix=$(STAGING_DIR)/usr \
+	--disable-arts \
 	--disable-esd \
 	--disable-nasm \
 	--disable-video-x11 );
