From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 17:17:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lite
In-Reply-To: <20080826145217.E39523C864@busybox.net>
References: <20080826145217.E39523C864@busybox.net>
Message-ID: <20080826151758.GA21190@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 07:52:17AM -0700, laird at uclibc.org wrote:
>Author: laird
>Date: 2008-08-26 07:52:17 -0700 (Tue, 26 Aug 2008)
>New Revision: 23208

>+$(LITE_HOOK_POST_INSTALL):
>+	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
>+	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype
>+	$(INSTALL) -m0644 $(LITE_DIR)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
>+	$(INSTALL) -m0644 $(LITE_DIR)/examples/*.png $(TARGET_DIR)/usr/share/LiTE/examples/
>+	$(INSTALL) -m0644 $(LITE_DIR)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/ 

trailing junk at the line above. I suggest you configure your editor to
highlight those.

>+	touch $@
>\ No newline at end of file
>
>Added: trunk/buildroot/package/lite/no_tests.patch
>===================================================================
>--- trunk/buildroot/package/lite/no_tests.patch	                        (rev 0)
>+++ trunk/buildroot/package/lite/no_tests.patch	2008-08-26 14:52:17 UTC (rev 23208)
>@@ -0,0 +1,14 @@
>+--- package/lite/no-examples-no-tests.patch	(revision 0)
>++++ package/lite/no-examples-no-tests.patch	(revision 0)

the hunk above is cruft, isn't it?

>+@@ -0,0 +1,11 @@
>+--- Makefile.in.orig	2008-07-07 13:07:12.000000000 +0200
>++++ Makefile.in	2008-07-07 13:07:05.000000000 +0200
>+@@ -202,7 +202,7 @@
>+ target_vendor = @target_vendor@
>+ top_builddir = @top_builddir@
>+ top_srcdir = @top_srcdir@
>+-SUBDIRS = data fonts lite leck examples tests
>++SUBDIRS = data fonts lite leck examples
>+ EXTRA_DIST = TODO lite.pc.in leck.pc.in
>+ pkgconfigdir = $(libdir)/pkgconfig
>+ pkgconfig_DATA = lite.pc leck.pc
