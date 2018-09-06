From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:30:47 +0200
Subject: [Buildroot] [git commit branch/next] configs/zynq_zed: uboot: bump
 to xilinx-v2018.2 (fixes build)
Message-ID: <20180906193022.5C2EE82B61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2ce5996f17eeef0357d79347a8a9fff3ee3aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to the most recent Xilinx release.

Fixes:
  .../output/host/include/libfdt_env.h:71:30: error: conflicting types for ???fdt64_t???
  .../output/host/include/libfdt_env.h:91:24: error: expected ???)??? before ???x???
  .../output/host/include/libfdt.h:150:21: error: redefinition of ???fdt_offset_ptr_w???
...and many, many other similar errors.

[Run-time tested]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/zynq_zed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 676366bc5c..a215695b54 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.3"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
