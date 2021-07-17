From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:08:19 +0200
Subject: [Buildroot] [git commit] package/libnice: bump to version 0.1.18
Message-ID: <20210717073435.193A881E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=f11128b779a7e285665902d09977f268b1bbee77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- Switch to meson-package

https://github.com/libnice/libnice/blob/0.1.18/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnice/libnice.hash |  8 ++++----
 package/libnice/libnice.mk   | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 61be9517e3..55785cd5ff 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,7 +1,7 @@
 # Locally computed after checking pgp signature
-sha256 06b678066f94dde595a4291588ed27acd085ee73775b8c4e8399e28c01eeefdf libnice-0.1.16.tar.gz
+sha256  5eabd25ba2b54e817699832826269241abaa1cf78f9b240d1435f936569273f4  libnice-0.1.18.tar.gz
 
 # Hash for license files:
-sha256 9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5 COPYING
-sha256 3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a COPYING.MPL
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 COPYING.LGPL
+sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
+sha256  3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a  COPYING.MPL
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 8292250938..5889b24ba2 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,36 +4,36 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.16
+LIBNICE_VERSION = 0.1.18
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
-LIBNICE_CONF_OPTS = --without-gstreamer-0.10
+LIBNICE_CONF_OPTS = \
+	-Dexamples=disabled \
+	-Dtests=disabled
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBNICE_CONF_OPTS += --with-crypto-library=gnutls
+LIBNICE_CONF_OPTS += -Dcrypto-library=gnutls
 LIBNICE_DEPENDENCIES += gnutls
 else
-LIBNICE_CONF_OPTS += \
-	--with-crypto-library=openssl \
-	--with-openssl=$(STAGING_DIR)/usr
+LIBNICE_CONF_OPTS += -Dcrypto-library=openssl
 LIBNICE_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBNICE_CONF_OPTS += --enable-introspection
+LIBNICE_CONF_OPTS += -Dintrospection=enabled
 LIBNICE_DEPENDENCIES += gobject-introspection
 else
-LIBNICE_CONF_OPTS += --disable-introspection
+LIBNICE_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
-LIBNICE_CONF_OPTS += --with-gstreamer
+LIBNICE_CONF_OPTS += -Dgstreamer=enabled
 LIBNICE_DEPENDENCIES += gst1-plugins-base
 else
-LIBNICE_CONF_OPTS += --without-gstreamer
+LIBNICE_CONF_OPTS += -Dgstreamer=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
