From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 21:51:04 +0200
Subject: [Buildroot] [git commit] package/gupnp: bump version to 1.2.2
Message-ID: <20200329193741.C351889034@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ef8c5d3dd8194059ca6907427dcdad2fab5d81d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Convert the package type to meson as there is no longer autotools support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gupnp/gupnp.hash |  6 +++---
 package/gupnp/gupnp.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index c530eb7ef5..24a0d36631 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.4.sha256sum:
-sha256	8b0992650c6ef8566d2d0c9198c8a669106dc2c73aa908fcc4a4d043a8c0b544	gupnp-1.0.4.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.2.sha256sum:
+sha256  9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989  gupnp-1.2.2.tar.xz
 
 # Hash for license file:
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 75bbfa8d1d..612359ba55 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 1.0
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
+GUPNP_VERSION_MAJOR = 1.2
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).2
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.0+
@@ -14,10 +14,10 @@ GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GUPNP_CONF_OPTS += --enable-introspection
+GUPNP_CONF_OPTS += -Dintrospection=true
 GUPNP_DEPENDENCIES += gobject-introspection
 else
-GUPNP_CONF_OPTS += --disable-introspection
+GUPNP_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
