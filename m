From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:37 +0100
Subject: [Buildroot] [PATCH v2 12/14] libvips: reference explicitly fftw
 double
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-12-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
2.19.2
