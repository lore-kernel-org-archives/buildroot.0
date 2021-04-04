From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 21:34:14 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libvips: add
 giflib optional dependency
Message-ID: <20210404191443.23F4D835F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1c3a47f3c1c4f1219298d4a8a307fda92eba8eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

giflib is an optional dependency which is enabled by default since
version 8.3.0 and
https://github.com/libvips/libvips/commit/d79407f285c768a7338e73ccfc6cf09480b95582

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd1a3a29debdd43e07ad34b29283be5515539013)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 464d905bd8..91d8a814c4 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -40,6 +40,13 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+LIBVIPS_CONF_OPTS += --with-giflib
+LIBVIPS_DEPENDENCIES += giflib
+else
+LIBVIPS_CONF_OPTS += --without-giflib
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBVIPS_CONF_OPTS += --enable-introspection
 LIBVIPS_DEPENDENCIES += gobject-introspection
