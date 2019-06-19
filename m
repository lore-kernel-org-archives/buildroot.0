From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:49:41 +0200
Subject: [Buildroot] [git commit] package/gpsd: use
 BR2_TOOLCHAIN_HAS_GCC_BUG_68485 option
Message-ID: <20190619194917.151DA822B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74e56b104fcf9cc87fea507e9b7554e32138c2f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The workaround for gcc's ICE works ok, but it's used if
BR2_microblaze=y with a local comment. Let's use
BR2_TOOLCHAIN_HAS_GCC_BUG_68485 instead to avoid repeating ICE bug
comment for every package affected by it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/gpsd.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 16d919450f..a0853dbfd8 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -42,10 +42,7 @@ else
 GPSD_SCONS_OPTS += libgpsmm=no
 endif
 
-# prevents from triggering GCC ICE
-# A bug was reported to the gcc bug tracker:
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
-ifeq ($(BR2_microblaze),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 GPSD_CFLAGS += -O0
 endif
 
