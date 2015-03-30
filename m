From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 17:43:38 -0300
Subject: [Buildroot] [PATCH 3/3] libgtk2: adjust style
In-Reply-To: <1427748218-24477-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427748218-24477-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427748218-24477-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cleanup indentation and mention why we need AUTORECONF.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.mk | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index ceb4864..94d11f4 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -11,7 +11,7 @@ LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJ
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_LICENSE = LGPLv2+
 LIBGTK2_LICENSE_FILES = COPYING
-
+# For 0001-reduce-dependencies.patch
 LIBGTK2_AUTORECONF = YES
 
 LIBGTK2_CONF_ENV = \
@@ -86,33 +86,33 @@ LIBGTK2_DEPENDENCIES += \
 	xlib_libXext xlib_libXrender
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-	LIBGTK2_CONF_OPTS += --enable-xinerama
-	LIBGTK2_DEPENDENCIES += xlib_libXinerama
+LIBGTK2_CONF_OPTS += --enable-xinerama
+LIBGTK2_DEPENDENCIES += xlib_libXinerama
 else
-	LIBGTK2_CONF_OPTS += --disable-xinerama
+LIBGTK2_CONF_OPTS += --disable-xinerama
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-	LIBGTK2_CONF_OPTS += --with-xinput=yes
-	LIBGTK2_DEPENDENCIES += xlib_libXi
+LIBGTK2_CONF_OPTS += --with-xinput=yes
+LIBGTK2_DEPENDENCIES += xlib_libXi
 else
-	LIBGTK2_CONF_OPTS += --with-xinput=no
+LIBGTK2_CONF_OPTS += --with-xinput=no
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
-	LIBGTK2_DEPENDENCIES += xlib_libXrandr
+LIBGTK2_DEPENDENCIES += xlib_libXrandr
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
-	LIBGTK2_DEPENDENCIES += xlib_libXcursor
+LIBGTK2_DEPENDENCIES += xlib_libXcursor
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
-	LIBGTK2_DEPENDENCIES += xlib_libXfixes
+LIBGTK2_DEPENDENCIES += xlib_libXfixes
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
-	LIBGTK2_DEPENDENCIES += xlib_libXdamage
+LIBGTK2_DEPENDENCIES += xlib_libXdamage
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-- 
2.0.5
