From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 21 Jan 2019 14:51:09 +0100
Subject: [Buildroot] [PATCH v4 15/17] package/liquid-dsp: use the new
 fftw-{single, double, long-double} packages
In-Reply-To: <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
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
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
Message-ID: <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liquid-dsp/liquid-dsp.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index db67893844..6aa27a5248 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -30,9 +30,9 @@ LIQUID_DSP_CFLAGS += -ffast-math
 endif
 
 # use FFTW instead of built-in FFT
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3f
-LIQUID_DSP_DEPENDENCIES += fftw
+LIQUID_DSP_DEPENDENCIES += fftw-single
 endif
 
 # disable altivec, it has build issues
@@ -40,14 +40,14 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3
-LIQUID_DSP_DEPENDENCIES += fftw
+LIQUID_DSP_DEPENDENCIES += fftw-double
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3l
-LIQUID_DSP_DEPENDENCIES += fftw
+LIQUID_DSP_DEPENDENCIES += fftw-long-double
 endif
 
 LIQUID_DSP_CONF_OPTS += \
-- 
2.19.2
