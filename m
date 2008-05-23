From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 23 May 2008 06:31:20 -0700 (PDT)
Subject: [Buildroot]  [PATCH]: Do not redefine PKGCONFIG* in libgtk2.mk
Message-ID: <17425681.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


See patch:

--- buildroot/package/libgtk2/libgtk2.mk 
+++ buildroot.new/package/libgtk2/libgtk2.mk 
@@ -55,9 +55,8 @@
 		--infodir=/usr/info --enable-shared \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--disable-debug \
 		$(LIBGTK2_CONF_OPT_X)  $(LIBGTK2_CONF_OPT_DFB)
-
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
-- 
View this message in context: http://www.nabble.com/-PATCH-%3A-Do-not-redefine-PKGCONFIG*-in-libgtk2.mk-tp17425681p17425681.html
Sent from the BuildRoot mailing list archive at Nabble.com.
