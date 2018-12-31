From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:25 +0100
Subject: [Buildroot] [PATCH v3 12/17] package/imagemagick: use the new
 fftw-double package
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-13-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
-- 
2.20.1
