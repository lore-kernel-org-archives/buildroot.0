From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 23 May 2008 06:39:17 -0700 (PDT)
Subject: [Buildroot] [PATCH]: Make sure cairo is dependant on directfb
 otherwise might not be built
Message-ID: <17425814.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


DirectFB is needed before cairo builds to get directfb support:

Dan Laird

--- buildroot/package/cairo/cairo.mk
+++ buildroot.new/package/cairo/cairo.mk 
@@ -43,9 +43,11 @@
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
+	CAIRO_DEPENDENCIES_EXTRA = directfb
 endif
 
-CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png
fontconfig $(XSERVER) 
+CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png
fontconfig $(CAIRO_DEPENDENCIES_EXTRA) $(XSERVER) 
 
 $(eval $(call AUTOTARGETS,package,cairo))
 
+

-- 
View this message in context: http://www.nabble.com/-PATCH-%3A-Make-sure-cairo-is-dependant-on-directfb-otherwise-might-not-be-built-tp17425814p17425814.html
Sent from the BuildRoot mailing list archive at Nabble.com.
