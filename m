From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 19:29:15 -0300
Subject: [Buildroot] [PATCH 2/2] pango: adjust indentation
In-Reply-To: <1427754555-9753-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427754555-9753-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427754555-9753-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pango/pango.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 4467009..ea1b7d6 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -78,14 +78,14 @@ PANGO_DEPENDENCIES = \
 	freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	PANGO_CONF_OPTS += --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib
-	PANGO_DEPENDENCIES += xlib_libX11
+PANGO_CONF_OPTS += --x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+PANGO_DEPENDENCIES += xlib_libX11
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
-	PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
-	PANGO_CONF_OPTS += --with-xft
+PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
+PANGO_CONF_OPTS += --with-xft
 endif
 
 define PANGO_INSTALL_INIT_SYSV
-- 
2.0.5
