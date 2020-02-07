From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:18 +0100
Subject: [Buildroot] [PATCH 03/10] package/libnice: drop gstreamer 0.10.x
 support
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming removal of gstreamer 0.10, the logic for building
libnice with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1
