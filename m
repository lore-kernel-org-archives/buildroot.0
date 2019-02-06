From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/libvips: use the new fftw-double
 package
Message-ID: <20190206091325.85DAE803B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b69b63f96b146a044e9465efe69fa7f190976a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add an explicitly dependency to fftw-double (the only compatible
fftw's flavor) instead of default behavior where the package do assumption
about the compatible version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/libvips.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 8078e046d1..7622f32fbc 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -68,9 +68,9 @@ else
 LIBVIPS_CONF_OPTS += --without-tiff
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
 LIBVIPS_CONF_OPTS += --with-fftw
-LIBVIPS_DEPENDENCIES += fftw
+LIBVIPS_DEPENDENCIES += fftw-double
 else
 LIBVIPS_CONF_OPTS += --without-fftw
 endif
