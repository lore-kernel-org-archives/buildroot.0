From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 28 Aug 2018 10:00:58 +0200
Subject: [Buildroot] [PATCH 2/3] configs/zynq_zc706: uboot: bump to
 xilinx-v2018.2 (fixes build)
In-Reply-To: <20180828080059.21788-1-luca@lucaceresoli.net>
References: <20180828080059.21788-1-luca@lucaceresoli.net>
Message-ID: <20180828080059.21788-2-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to the most recent Xilinx release.

Fixes:
  .../output/host/include/libfdt_env.h:71:30: error: conflicting types for ?fdt64_t?
  .../output/host/include/libfdt_env.h:91:24: error: expected ?)? before ?x?
  .../output/host/include/libfdt.h:150:21: error: redefinition of ?fdt_offset_ptr_w?
...and many, many other similar errors.

[Build-tested only]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 758069b30fe8..e8019177d2b8 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.3"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.17.1
