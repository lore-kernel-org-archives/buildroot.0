From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:44:33 +0200
Subject: [Buildroot] [git commit] package/libvips: add librsvg optional
 dependency
Message-ID: <20210404141921.9DF8380F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adc0e0c6afc2011e6ef4d59a93c42f24399b8279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librsvg is an optional dependency which is enabled by default since
version 8.3.0 and
https://github.com/libvips/libvips/commit/153886d2eb71eebcdca860cb691d8fbb976ad816

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 5f95fc7f1d..f35a109502 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -66,6 +66,13 @@ else
 LIBVIPS_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRSVG),y)
+LIBVIPS_CONF_OPTS += --with-rsvg
+LIBVIPS_DEPENDENCIES += librsvg
+else
+LIBVIPS_CONF_OPTS += --without-rsvg
+endif
+
 ifeq ($(BR2_PACKAGE_POPPLER),y)
 LIBVIPS_CONF_OPTS += --with-poppler
 LIBVIPS_DEPENDENCIES += poppler
