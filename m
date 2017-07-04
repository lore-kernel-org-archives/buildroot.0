From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] glib-networking: use the new gettext logic
Message-ID: <20170704233515.20F487FCC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69f1de8ca31d68b785b6bc7acca54200db4f7a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glib-networking/Config.in          | 1 -
 package/glib-networking/glib-networking.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 01d8552..ec29623 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index eb75c86..10a3b70 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -10,7 +10,7 @@ GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
 GLIB_NETWORKING_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	host-intltool \
 	libglib2
