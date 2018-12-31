From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:26 +0100
Subject: [Buildroot] [PATCH v3 13/17] package/libvips: use the new
 fftw-double package
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-14-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
-- 
2.20.1
