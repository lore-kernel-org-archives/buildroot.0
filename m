From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon,  5 Dec 2016 14:30:57 +1100
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build failure on
	powerpc64le
Message-ID: <43a99fffd93addae12dc5d31342896ebe09a613e.1480908655.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7d435d8510db69ed2f9108abaa52479bce127b72 fixed building on
powerpc and powerpc64. This extends that fix to cover powerpc64le,
which suffers from the same problem.

Fixes:
http://autobuild.buildroot.net/results/45c4651a833e4667d4ef68e619cf4b5749a288da

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---

 package/liquid-dsp/liquid-dsp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index b5fb44cf9..35994137e 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -35,7 +35,7 @@ LIQUID_DSP_LDFLAGS += -lfftw3f
 endif
 
 # disable altivec, it has build issues
-ifeq ($(BR2_powerpc)$(BR2_powerpc64),y)
+ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
 endif
 
-- 
2.11.0
