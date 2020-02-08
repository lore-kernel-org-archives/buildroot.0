From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:42:43 +0100
Subject: [Buildroot] [git commit] package/libnice: drop gstreamer 0.10.x
 support
Message-ID: <20200208214331.E42908D666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8be6732792019aef890c8ec4d88e52548ff5f711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the upcoming removal of gstreamer 0.10, the logic for building
libnice with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnice/libnice.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index b5168f83ed..8cbf003529 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -10,6 +10,7 @@ LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
+LIBNICE_CONF_OPTS = --without-gstreamer-0.10
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBNICE_CONF_OPTS += --with-crypto-library=gnutls
@@ -21,13 +22,6 @@ LIBNICE_CONF_OPTS += \
 LIBNICE_DEPENDENCIES += openssl
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
-LIBNICE_CONF_OPTS += --with-gstreamer-0.10
-LIBNICE_DEPENDENCIES += gst-plugins-base
-else
-LIBNICE_CONF_OPTS += --without-gstreamer-0.10
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 LIBNICE_CONF_OPTS += --with-gstreamer
 LIBNICE_DEPENDENCIES += gst1-plugins-base
