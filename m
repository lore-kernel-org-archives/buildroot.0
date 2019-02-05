From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 21:06:18 +0100
Subject: [Buildroot] [git commit] package/liquid-dsp: drop support for
 fftw-double and fftw-long-double
Message-ID: <20190205200459.6880D817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3256b273d31d5885b523483f906a79c8c22b1010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liquid-dsp has the following code:

So, if it uses the external fftw library, it can only use the fftwf
variant, i.e the fftw-single variant. Otherwise, it uses its internal
FFT library.

There is no way for liquid-dsp to use fftw-double or fftw-long-double.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liquid-dsp/liquid-dsp.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index db67893844..1f645bf33a 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -40,16 +40,6 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
-LIQUID_DSP_LDFLAGS += -lfftw3
-LIQUID_DSP_DEPENDENCIES += fftw
-endif
-
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
-LIQUID_DSP_LDFLAGS += -lfftw3l
-LIQUID_DSP_DEPENDENCIES += fftw
-endif
-
 LIQUID_DSP_CONF_OPTS += \
 	CFLAGS="$(LIQUID_DSP_CFLAGS)" \
 	LDFLAGS="$(LIQUID_DSP_LDFLAGS)"
