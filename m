From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 10:11:10 +0200
Subject: [Buildroot] [PATCH 3/3] Apply --disable-gtk-doc-html to all packages
In-Reply-To: <1413706270-27411-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413706270-27411-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413706270-27411-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move this option to package/pkg-autotools.mk so it applies to all packages.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pango/pango.mk   |    2 +-
 package/pkg-autotools.mk |    2 ++
 package/webkit/webkit.mk |    1 -
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 46490c1..a18a49d 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,7 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
-PANGO_CONF_OPTS = --enable-explicit-deps=no --disable-gtk-doc-html
+PANGO_CONF_OPTS = --enable-explicit-deps=no
 
 PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkgconf \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index fcca9e9..d93c759 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -136,6 +136,7 @@ define $(2)_CONFIGURE_CMDS
 		--sysconfdir=/etc \
 		--program-prefix="" \
 		--disable-gtk-doc \
+		--disable-gtk-doc-html \
 		--disable-doc \
 		--disable-docs \
 		--disable-documentation \
@@ -168,6 +169,7 @@ define $(2)_CONFIGURE_CMDS
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--enable-shared --disable-static \
 		--disable-gtk-doc \
+		--disable-gtk-doc-html \
 		--disable-doc \
 		--disable-docs \
 		--disable-documentation \
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 77b533a..0694a5b 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -45,7 +45,6 @@ WEBKIT_CONF_OPTS += \
 	--disable-webkit2 \
 	--disable-glibtest \
 	--disable-video \
-	--disable-gtk-doc-html \
 	--disable-tests
 
 # Xorg Dependencies
-- 
1.7.10.4
