From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Feb 2019 13:30:48 +0100
Subject: [Buildroot] [git commit] configs/orangepi_lite2: fix kernel headers
 option
Message-ID: <20190208122958.5756B885F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85f4bd9425b4ee74839202ab012d193a0175c5fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to what the comment in the defconfig says, the
orangepi_lite2_defconfig was not using the "same as kernel" option for
kernel headers, but really selecting explicitly Linux 4.18 headers,
independently from the kernel version.

Except that in the mean time, BR2_KERNEL_HEADERS_4_18 has been
removed, causing a build failure due to the legacy checking:

Makefile.legacy:9: *** "You have legacy configuration in your .config! Please check your configuration.".  Stop.

This commit fixes that by using the proper
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18 option.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295163

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_lite2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 16d73e14ae..2d4ae70eab 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
 # Linux headers same as kernel, a 4.18 series
-BR2_KERNEL_HEADERS_4_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
