From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:38:51 +0100
Subject: [Buildroot] [git commit] configs/fsl_mpc8315erdb: fix and bump
	relevant versions
Message-ID: <20140307214327.6351E9B7F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=079282b2e2ebeb8c0b9636f64d1cb0570f62fec7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tweak the config to deal with b155f5a5ab321b06df1c5d5f5e104438e8288cf8
fallout.
And bump to the latest kernel versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_mpc8315erdb_defconfig |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 0b4979f..3cc5c5a 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -12,12 +12,13 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13"
+BR2_DEFAULT_KERNEL_VERSION="3.13.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.13.config"
 BR2_LINUX_KERNEL_UIMAGE=y
