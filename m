From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:26 +0200
Subject: [Buildroot] [git commit] json-glib: use the new gettext logic
Message-ID: <20170704233515.8AFDF80F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc9ad9139f4aa023cdaaddcc5d8b084c8b50b810
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/json-glib/Config.in    | 1 -
 package/json-glib/json-glib.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
index ea15295..9df03d9 100644
--- a/package/json-glib/Config.in
+++ b/package/json-glib/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_JSON_GLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  JSON-GLib is a library providing serialization and
 	  deserialization support for the JavaScript Object Notation
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index db22dc9..5ee43d9 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -13,7 +13,7 @@ JSON_GLIB_LICENSE_FILES = COPYING
 JSON_GLIB_INSTALL_STAGING = YES
 
 JSON_GLIB_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	libglib2
 
