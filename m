From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 10:17:18 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi_defconfig: configure
	eth0 through dhcp
Message-ID: <20160415081914.3CAD180295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcbcf8d4f0c315b5b7814dd866260530feb7cc3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rpi board has an ethernet port, so configure it at startup.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 615c052..1795b2c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -3,6 +3,7 @@ BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
