From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 19:51:31 +0200
Subject: [Buildroot] [git commit] configs/globalscale_espressobin: Linux
 needs host-openssl
Message-ID: <20200808174653.E240881595@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1caf8b5018dc5a915b6670206ac39791906b430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel configuration used for the globalscale_espressobin
defconfig needs host-openssl.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674933954

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/globalscale_espressobin_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
index c0b9f69559..50cfc6b530 100644
--- a/configs/globalscale_espressobin_defconfig
+++ b/configs/globalscale_espressobin_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extr
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7 marvell/armada-3720-espressobin-v7-emmc"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
