From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:59:29 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/rdesktop: add
 xlib_libXrandr optional dependency
Message-ID: <20200314174644.0BC9C83A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bf5ad692de652b23e397c71a52ceb448cfe53de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

xlib_libXrandr is an optional dependency since version 1.7.0 and
https://github.com/rdesktop/rdesktop/commit/6ee9faeffcd9dd2e4c262d732e15a3a02278578d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9675c3fbe8791c6ba4a4163d7ca5d544145786da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
