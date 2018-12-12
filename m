From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:39 +0100
Subject: [Buildroot] [PATCH v2 14/14] liquid-dsp: update package to use new
 fftw structure
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-14-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/liquid-dsp/liquid-dsp.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index e3114a2d15..6aa27a5248 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -30,8 +30,9 @@ LIQUID_DSP_CFLAGS += -ffast-math
 endif
 
 # use FFTW instead of built-in FFT
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3f
+LIQUID_DSP_DEPENDENCIES += fftw-single
 endif
 
 # disable altivec, it has build issues
@@ -39,12 +40,14 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3
+LIQUID_DSP_DEPENDENCIES += fftw-double
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3l
+LIQUID_DSP_DEPENDENCIES += fftw-long-double
 endif
 
 LIQUID_DSP_CONF_OPTS += \
-- 
2.19.2
