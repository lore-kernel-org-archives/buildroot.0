From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:34 +0100
Subject: [Buildroot] [PATCH 06/32] efl/libeet,
	efl/libevas: use host-libjpeg instead of host-jpeg
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before creating a real virtual package named 'jpeg', we want to ensure
that no package is using the host variant of the virtual
package. Instead, we make them use directly the host-libjpeg package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libeet/libeet.mk   |    2 +-
 package/efl/libevas/libevas.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index 3d5b460..db3ec6e 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -13,7 +13,7 @@ LIBEET_LICENSE_FILES = COPYING
 LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
-HOST_LIBEET_DEPENDENCIES = host-pkgconf host-zlib host-jpeg host-libeina
+HOST_LIBEET_DEPENDENCIES = host-pkgconf host-zlib host-libjpeg host-libeina
 
 ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 LIBEET_DEPENDENCIES += gnutls libgcrypt
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 0a90842..5bdcba5 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -15,7 +15,7 @@ LIBEVAS_INSTALL_STAGING = YES
 LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
 
 HOST_LIBEVAS_DEPENDENCIES = host-pkgconf host-zlib host-libeina \
-				host-freetype host-libpng host-jpeg
+				host-freetype host-libpng host-libjpeg
 HOST_LIBEVAS_CONF_OPT += \
 	--enable-image-loader-png \
 	--enable-image-loader-jpeg \
-- 
1.7.9.5
