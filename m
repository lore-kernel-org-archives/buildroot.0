From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 15:45:23 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: properly update
 kernel Git commit
Message-ID: <20190421142159.E439C812DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=972140e27878f940e49ac604961a1994b39d7d42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit ed02414e9cd271c0b0db26b8d5db1bf40ff416d3
("configs/raspberrypi*: bump kernel version to 5eeff139ea"), which
updated all RaspberryPi defconfigs to use Linux 4.19,
raspberrypi3_defconfig had its
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19 option updated, but not the
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION, which still pointed to an
older Linux 4.14-based RPi kernel. This caused a build failure due to
the headers being more recent than the actual kernel being built.

This commit fixes that by using the same kernel version as all other
RPi defconfigs.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339559

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 5dfff28771..fcd7e2b487 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
