From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 23 Feb 2017 11:54:55 +1100
Subject: [Buildroot] [RFC PATCH 2/2] package/libvips: enable introspection
In-Reply-To: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
Message-ID: <bc187a133185f0bf07a8fe9368dee4ffb8c785d6.1487811280.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Demonstrate working gobject-introspection!
---
 package/libvips/Config.in  | 1 +
 package/libvips/libvips.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index 87ada513d..4380f2d1a 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LIBVIPS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	help
 	  libvips is a 2D image processing library. Compared to
 	  similar libraries, libvips runs quickly and uses little
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 5f80b2d64..54af517f3 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -23,7 +23,6 @@ endif
 LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)"
 
 LIBVIPS_CONF_OPTS = \
-	--disable-introspection \
 	--without-dmalloc \
 	--without-gsf \
 	--without-magick \
@@ -41,7 +40,8 @@ LIBVIPS_CONF_OPTS = \
 LIBVIPS_INSTALL_STAGING = YES
 LIBVIPS_DEPENDENCIES = \
 	host-pkgconf libglib2 \
-	libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	gobject-introspection
 
 # --disable-cxx is broken upstream
 # https://github.com/jcupitt/libvips/issues/231
-- 
2.11.0
