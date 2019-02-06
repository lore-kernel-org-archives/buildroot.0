From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/liquid-dsp: use the new
 fftw-single package
Message-ID: <20190206091325.931F3803B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10b21a55b32013da2f6ca96e0e4681a0cd53e040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liquid-dsp/liquid-dsp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 1f645bf33a..64c403e87f 100644
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
