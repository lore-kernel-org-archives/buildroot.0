From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 21:57:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libvips: add
 librsvg optional dependency
Message-ID: <20210404194140.314198CA49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a963eed6f4ebb27eaa18df19bf48e09d37284fa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

librsvg is an optional dependency which is enabled by default since
version 8.3.0 and
https://github.com/libvips/libvips/commit/153886d2eb71eebcdca860cb691d8fbb976ad816

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit adc0e0c6afc2011e6ef4d59a93c42f24399b8279)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 12ffac944e..a17daef77a 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -68,6 +68,13 @@ else
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
