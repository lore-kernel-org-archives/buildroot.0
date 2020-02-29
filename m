From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 20:35:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: add xlib_libXrandr
 optional dependency
Message-ID: <20200229193501.3431626-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libXrandr is an optional dependency since version 1.7.0 and
https://github.com/rdesktop/rdesktop/commit/6ee9faeffcd9dd2e4c262d732e15a3a02278578d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rdesktop/rdesktop.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 491fd60407..f40521d2b1 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -9,7 +9,8 @@ RDESKTOP_SITE = $(call github,rdesktop,rdesktop,v$(RDESKTOP_VERSION))
 RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBAO),libao) \
-	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
+	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr)
 RDESKTOP_CONF_OPTS = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
 RDESKTOP_LICENSE = GPL-3.0+
 RDESKTOP_LICENSE_FILES = COPYING
-- 
2.25.0
