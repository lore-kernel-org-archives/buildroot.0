From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:03:09 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 configs/olimex_a20_olinuxino_lime_legacy: use gcc 6.x and not the default
 version
Message-ID: <20181126170125.130EE887F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84c065df3aaef6a64ac2cffdd0cda84cc75f25f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The old 3.4 Linux kernel used by this defconfig doesn't build with gcc 7.x:

include/linux/compiler-gcc.h:106:1: fatal error: linux/compiler-gcc7.h: No such file or directory

So let's use gcc 6.x for the time being.

Long term, we should use a newer or different kernel source for this
defconfig, or get rid of the defconfig entirely if there's no updated
kernel with a fix.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771091

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88928bbd6ebf2e56ea3b0caf45d6f4cc0db53646)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_a20_olinuxino_lime_mali_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index de13b2e47e..1448999e6c 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -3,6 +3,9 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
+# The old 3.4 kernel doesn't build with gcc >= 7.x
+BR2_GCC_VERSION_6_X=y
+
 # Linux headers same as kernel, a 3.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
 
