From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 10:17:18 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi2_defconfig: configure
	eth0 through dhcp
Message-ID: <20160415081915.EE7CB81E78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c59c8e795eb68948299b3555ec46c00c71d537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rpi2 board has an ethernet port, so configure it at startup.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 1d82f60..506330c 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -6,6 +6,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
