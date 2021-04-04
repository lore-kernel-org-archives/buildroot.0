From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 21:56:36 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libvips: add zlib
 optional dependency
Message-ID: <20210404194025.AC0218CA49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b743fff1f61764e8de349601918111b176741e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

zlib is an optional dependency which is enabled by default since version
8.4.2 and
https://github.com/libvips/libvips/commit/5ab0001ec68a5f61396aecd8d2d7a619b1dbe1fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 43a9cfd31781777753bc3f8b1a36996d16583e47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index b228c58217..6c3749c12a 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -90,4 +90,11 @@ else
 LIBVIPS_CONF_OPTS += --without-libexif
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBVIPS_CONF_OPTS += --with-zlib
+LIBVIPS_DEPENDENCIES += zlib
+else
+LIBVIPS_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
