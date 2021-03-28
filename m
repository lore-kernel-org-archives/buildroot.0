From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:53:11 +0200
Subject: [Buildroot] [git commit] package/libvips: drop unrecogized options
Message-ID: <20210328202826.140AE8A3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=953f00c7d82e4bde7bd513052239eabf181b862e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-zip has been dropped since version 8.4.2 and
https://github.com/libvips/libvips/commit/5ab0001ec68a5f61396aecd8d2d7a619b1dbe1fa

--without-python has been dropped since version 8.6.0 and
https://github.com/libvips/libvips/commit/fddd277995cf8ffb434eeaf2ee27fe22d921bc59

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/libvips.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 169fda9b10..d0979b7e3b 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -32,9 +32,7 @@ LIBVIPS_CONF_OPTS = \
 	--without-cfitsio \
 	--without-libwebp \
 	--without-pangoft2 \
-	--without-x \
-	--without-zip \
-	--without-python
+	--without-x
 LIBVIPS_INSTALL_STAGING = YES
 LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
