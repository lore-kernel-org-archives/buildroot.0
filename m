From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 15:12:09 +0100
Subject: [Buildroot] [git commit] configs/beaglebone_defconfig: lock down
	kernel headers version
Message-ID: <20130208141159.3F4299AA0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85ffaecb27d3ae5929437ae878a865b57f708df1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/beaglebone_defconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index f78a400..e19cdcb 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -8,6 +8,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.2.9"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
 BR2_TARGET_UBOOT_2012_10=y
