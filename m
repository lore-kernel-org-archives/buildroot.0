From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 09:38:54 +0100
Subject: [Buildroot] [git commit] package/luvi: fix build with aarch64
Message-ID: <20191226082945.0D2E48E590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29cb5dae912333f78105c445b62e6e46ada2fd3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aarch64 is a supported architecture of luajit since switch to moonjit
fork in commit 2ca0accc21a090874ac6e97670b47153a1f0a0b5 so manage this
new target in luvi.mk to avoid an "unknown architecture" build failure

Fixes:
 - http://autobuild.buildroot.org/results/ae610141b488d7ca8ea9db0575dec8f5eb13650c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luvi/luvi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index b6454ed32b..e311504e96 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -20,6 +20,8 @@ else ifeq ($(BR2_powerpc),y)
 LUVI_TARGET_ARCH = ppc
 else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LUVI_TARGET_ARCH = arm
+else ifeq ($(BR2_aarch64),y)
+LUVI_TARGET_ARCH = arm64
 else ifeq ($(BR2_mips),y)
 LUVI_TARGET_ARCH = mips
 else ifeq ($(BR2_mipsel),y)
