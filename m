From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 21:25:11 +0200
Subject: [Buildroot] [git commit] configs/beaglev: switch to upstream
 opensbi generic platform
Message-ID: <20210718191422.DD2C7874CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=3abd21bcd929442dabbea9c95199e35f4fc44f6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from the starfive-tech opensbi to upstream repo and use generic
platform now that it supports the console uart [1]. This landed after
the 0.9 release [2], so the current head of master branch is used [3].

FW_FDT_PATH is set to u-boot.dtb so that the device tree from U-Boot
will be included in the OpenSBI build [4]. Note that U-Boot must have
CONFIG_OF_SEPARATE enabled for U-Boot to build u-boot.dtb [5].

[1] https://github.com/riscv/opensbi/commit/e822b7504df0583a6a227d51cb7da8ea9fc79c0a
[2] https://github.com/riscv/opensbi/commit/234ed8e427f4d92903123199f6590d144e0d9351
[3] https://github.com/riscv/opensbi/commit/79f9b4220ffa7f74356054be25d450d7958bf16c
[4] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
[5] https://github.com/u-boot/u-boot/blob/master/doc/README.fdt-control

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglev_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 39872b6d0b..82a6e9abc4 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -23,12 +23,13 @@ BR2_TARGET_BEAGLEV_DDRINIT=y
 BR2_TARGET_BEAGLEV_SECONDBOOT=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-# HEAD of the Fedora branch
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,opensbi,2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5)/opensbi-2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="starfive/vic7100"
+# upstream opensbi master branch
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,79f9b4220ffa7f74356054be25d450d7958bf16c)/opensbi-79f9b4220ffa7f74356054be25d450d7958bf16c.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG is not set
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
