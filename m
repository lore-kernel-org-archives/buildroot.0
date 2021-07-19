From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Jul 2021 23:43:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp-av: bump to version 0.13.0
Message-ID: <20210719214327.3940036-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- License is LGPL-2.1+ since
  https://gitlab.gnome.org/GNOME/gupnp-av/-/commit/f0ff740c735bff04bb0235eb9ac57172461b71d5
- Update indentation in hash file (two spaces)
- Switch to meson-package

https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.13.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-av/gupnp-av.hash |  6 +++---
 package/gupnp-av/gupnp-av.mk   | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 5dc2ac1a9d..570f8ab3d0 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.11.sha256sum:
-sha256	689dcf1492ab8991daea291365a32548a77d1a2294d85b33622b55cca9ce6fdc	gupnp-av-0.12.11.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.13/gupnp-av-0.13.0.sha256sum:
+sha256  578b8f562b0f7e908416a41efbe2b7e6b892cd2ed7eac61ac63c48fdc8d7e6c8  gupnp-av-0.13.0.tar.xz
 
 # Hash for license file:
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 55436d0e53..c2d3c3ba18 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -4,20 +4,20 @@
 #
 ################################################################################
 
-GUPNP_AV_VERSION_MAJOR = 0.12
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).11
+GUPNP_AV_VERSION_MAJOR = 0.13
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
-GUPNP_AV_LICENSE = LGPL-2.0+
+GUPNP_AV_LICENSE = LGPL-2.1+
 GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
 GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GUPNP_AV_CONF_OPTS += --enable-introspection
-GUPNP_AV_DEPENDENCIES += gobject-introspection
+GUPNP_AV_CONF_OPTS += -Dintrospection=true -Dvapi=true
+GUPNP_AV_DEPENDENCIES += host-vala gobject-introspection
 else
-GUPNP_AV_CONF_OPTS += --disable-introspection
+GUPNP_AV_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.30.2
