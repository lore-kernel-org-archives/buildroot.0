From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:33 +0100
Subject: [Buildroot] [PATCH 03/11] aubio: update DEPENDENCIES to fft-single
 or fft-double depending on enabled option
In-Reply-To: <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/aubio/aubio.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b0cc8b899e..20dd8c13cb 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -28,7 +28,7 @@ endif
 
 # Could not compile aubio in double precision mode with libsamplerate
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
-AUBIO_DEPENDENCIES += libsamplerate
+AUBIO_DEPENDENCIES += libsamplerate fftw-single
 AUBIO_CONF_OPTS += --enable-samplerate
 else
 AUBIO_CONF_OPTS += --disable-samplerate
@@ -42,12 +42,13 @@ AUBIO_CONF_OPTS += --disable-jack
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW),y)
-AUBIO_DEPENDENCIES += fftw
 # fftw3 require double otherwise it will look for fftw3f
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
 AUBIO_CONF_OPTS += --enable-fftw3 --enable-double
+AUBIO_DEPENDENCIES += fftw-double
 else ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
 AUBIO_CONF_OPTS += --enable-fftw3f --disable-double
+AUBIO_DEPENDENCIES += fftw-single
 endif
 else  # !BR2_PACKAGE_FFTW
 AUBIO_CONF_OPTS += --disable-fftw3
-- 
2.19.2
