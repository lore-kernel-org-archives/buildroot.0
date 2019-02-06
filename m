From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/imagemagick: use the new
 fftw-double package
Message-ID: <20190206091325.7EE85803B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7eb196b1038cdfb6625ce3d232f22ccfcb6f8d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add an explicitly dependency to fftw-double (the only compatible
fftw's flavor) instead of default behavior where the package do assumption
about the compatible version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 72482267ce..7678980582 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -113,11 +113,11 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-lzma
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
 # configure script misdetects these leading to build errors
 IMAGEMAGICK_CONF_ENV += ac_cv_func_creal=yes ac_cv_func_cimag=yes
 IMAGEMAGICK_CONF_OPTS += --with-fftw
-IMAGEMAGICK_DEPENDENCIES += fftw
+IMAGEMAGICK_DEPENDENCIES += fftw-double
 else
 IMAGEMAGICK_CONF_OPTS += --without-fftw
 endif
