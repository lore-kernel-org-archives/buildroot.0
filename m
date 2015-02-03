From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 15:25:21 +0100
Subject: [Buildroot] [git commit] Apply --disable-gtk-doc-html to all
	packages
Message-ID: <20150203142533.F373580E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=356584ca70f4eb1ed2b19fe6ed709b50653c8178
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move this option to package/pkg-autotools.mk so it applies to all packages.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk   |    2 +-
 package/pkg-autotools.mk |    2 ++
 package/webkit/webkit.mk |    1 -
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f3e16ef..51bfbfa 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -66,7 +66,7 @@ PANGO_CONF_ENV = \
 	gl_cv_c_restrict=no \
 	ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
-PANGO_CONF_OPTS = --enable-explicit-deps=no --disable-gtk-doc-html
+PANGO_CONF_OPTS = --enable-explicit-deps=no
 
 PANGO_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b6b83f8..d2f15fa 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -193,6 +193,7 @@ define $(2)_CONFIGURE_CMDS
 		--localstatedir=/var \
 		--program-prefix="" \
 		--disable-gtk-doc \
+		--disable-gtk-doc-html \
 		--disable-doc \
 		--disable-docs \
 		--disable-documentation \
@@ -226,6 +227,7 @@ define $(2)_CONFIGURE_CMDS
 		--localstatedir="$$(HOST_DIR)/var" \
 		--enable-shared --disable-static \
 		--disable-gtk-doc \
+		--disable-gtk-doc-html \
 		--disable-doc \
 		--disable-docs \
 		--disable-documentation \
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 98da1d6..bbde7f4 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -46,7 +46,6 @@ WEBKIT_CONF_OPTS += \
 	--disable-webkit2 \
 	--disable-glibtest \
 	--disable-video \
-	--disable-gtk-doc-html \
 	--disable-tests
 
 # Xorg Dependencies
