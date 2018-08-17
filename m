From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:52:41 +0200
Subject: [Buildroot] [git commit] orangepi_zero_defconfig: bump u-boot to
 2018.07 to fix build issue
Message-ID: <20180817145447.E7A5A8D4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=931111604c945fa4576ff59e0c5c5c93184bb215
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

u-boot 2018.01 now fails to build with the following error:

  CC      arch/arm/lib/asm-offsets.s
In file included from /builds/buildroot.org/buildroot/output/host/include/libfdt.h:54:0,
                 from /builds/buildroot.org/buildroot/output/build/uboot-2018.01/scripts/dtc/libfdt/fdt.c:54:
/builds/buildroot.org/buildroot/output/host/include/libfdt_env.h:82:24: error: redefinition of 'fdt16_to_cpu'
 static inline uint16_t fdt16_to_cpu(fdt16_t x)
                        ^~~~~~~~~~~~
In file included from /builds/buildroot.org/buildroot/output/build/uboot-2018.01/scripts/dtc/libfdt/fdt.c:51:0:
/builds/buildroot.org/buildroot/output/build/uboot-2018.01/scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of 'fdt16_to_cpu' was here
 static inline uint16_t fdt16_to_cpu(fdt16_t x)

https://gitlab.com/buildroot.org/buildroot/-/jobs/88314891

Fix it by bumping the u-boot version to 2018.07.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_zero_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index fcf9b325cd..ae2b80900c 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
