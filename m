From: Thomas Ehrhardt <e.thomas@gmx.de>
Date: Wed, 25 Jul 2018 06:46:28 -0500 (CDT)
Subject: [Buildroot] ghostscript: wrong fonts path set in target application
Message-ID: <1532519188355-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch the fonts path of ghostscript is wrong.

--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -40,7 +40,7 @@
        --disable-compile-inits \
        --disable-cups \
        --enable-fontconfig \
-       --with-fontpath=$(GHOSTSCRIPT_FONTS_TARGET_DIR) \
+       --with-fontpath=/usr/share/fonts \
        --enable-freetype \
        --disable-gtk \
        --without-jbig2dec \




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
