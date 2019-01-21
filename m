From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 21 Jan 2019 14:51:07 +0100
Subject: [Buildroot] [PATCH v4 13/17] package/libvips: use the new
 fftw-double package
In-Reply-To: <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
Message-ID: <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

This patch add an explicitly dependency to fftw-double (the only compatible
fftw's flavor) instead of default behavior where the package do assumption
about the compatible version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v3 -> v4:
 * improve commit message about fftw version. (Yann)
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
