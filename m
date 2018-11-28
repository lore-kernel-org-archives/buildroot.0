From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:41 +0100
Subject: [Buildroot] [PATCH 11/11] liquid-dsp: update package to use new
 fftw structure
In-Reply-To: <1543421561-37355-10-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-5-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-6-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-7-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-8-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-9-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-10-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-11-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/liquid-dsp/liquid-dsp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index e3114a2d15..c201010d56 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -32,6 +32,7 @@ endif
 # use FFTW instead of built-in FFT
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3f
+LIQUID_DSP_DEPENDENCIES += fftw-single
 endif
 
 # disable altivec, it has build issues
@@ -41,10 +42,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3
+LIQUID_DSP_DEPENDENCIES += fftw-double
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
 LIQUID_DSP_LDFLAGS += -lfftw3l
+LIQUID_DSP_DEPENDENCIES += fftw-long-double
 endif
 
 LIQUID_DSP_CONF_OPTS += \
-- 
2.19.2
