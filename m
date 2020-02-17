From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 17 Feb 2020 21:50:28 +0100
Subject: [Buildroot] [PATCH v5 3/5] configs/qemu*: use the post-image script
 with "$(BR2_DEFCONFIG)" as argument.
In-Reply-To: <20200217205030.8157-1-romain.naour@smile.fr>
References: <20200217205030.8157-1-romain.naour@smile.fr>
Message-ID: <20200217205030.8157-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit allow to use the post-image script previously added
for each qemu board.

Add "$(BR2_DEFCONFIG)" as post-image script argument to retried
the qemu command line.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v5: remove qem_arm_vexpress_tz_deconfig change since this
defconfig doesn't build.
---
 configs/qemu_aarch64_virt_defconfig        | 4 ++++
 configs/qemu_arm_versatile_defconfig       | 4 ++++
 configs/qemu_arm_versatile_nommu_defconfig | 4 ++++
 configs/qemu_arm_vexpress_defconfig        | 4 ++++
 configs/qemu_csky610_virt_defconfig        | 4 ++++
 configs/qemu_csky807_virt_defconfig        | 4 ++++
 configs/qemu_csky810_virt_defconfig        | 4 ++++
 configs/qemu_csky860_virt_defconfig        | 4 ++++
 configs/qemu_m68k_mcf5208_defconfig        | 4 ++++
 configs/qemu_m68k_q800_defconfig           | 4 ++++
 configs/qemu_microblazebe_mmu_defconfig    | 4 ++++
 configs/qemu_microblazeel_mmu_defconfig    | 4 ++++
 configs/qemu_mips32r2_malta_defconfig      | 4 ++++
 configs/qemu_mips32r2el_malta_defconfig    | 4 ++++
 configs/qemu_mips32r6_malta_defconfig      | 4 ++++
 configs/qemu_mips32r6el_malta_defconfig    | 4 ++++
 configs/qemu_mips64_malta_defconfig        | 4 ++++
 configs/qemu_mips64el_malta_defconfig      | 4 ++++
 configs/qemu_mips64r6_malta_defconfig      | 4 ++++
 configs/qemu_mips64r6el_malta_defconfig    | 4 ++++
 configs/qemu_nios2_10m50_defconfig         | 4 ++++
 configs/qemu_or1k_defconfig                | 4 ++++
 configs/qemu_ppc64_e5500_defconfig         | 4 ++++
 configs/qemu_ppc64_pseries_defconfig       | 4 ++++
 configs/qemu_ppc64le_pseries_defconfig     | 4 ++++
 configs/qemu_ppc_g3beige_defconfig         | 4 ++++
 configs/qemu_ppc_mac99_defconfig           | 4 ++++
 configs/qemu_ppc_mpc8544ds_defconfig       | 4 ++++
 configs/qemu_ppc_virtex_ml507_defconfig    | 4 ++++
 configs/qemu_riscv32_virt_defconfig        | 4 ++++
 configs/qemu_riscv64_virt_defconfig        | 4 ++++
 configs/qemu_sh4_r2d_defconfig             | 4 ++++
 configs/qemu_sh4eb_r2d_defconfig           | 4 ++++
 configs/qemu_sparc64_sun4u_defconfig       | 4 ++++
 configs/qemu_sparc_ss10_defconfig          | 4 ++++
 configs/qemu_x86_64_defconfig              | 4 ++++
 configs/qemu_x86_defconfig                 | 4 ++++
 configs/qemu_xtensa_lx60_defconfig         | 4 ++++
 configs/qemu_xtensa_lx60_nommu_defconfig   | 4 ++++
 39 files changed, 156 insertions(+)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 6a9bc25bea..4e36a0b9f9 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -11,6 +11,10 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 42d29e3bf3..ed73af63fe 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,6 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 6e4de0a0dd..614d920438 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -21,6 +21,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 188fd72014..e8968d6630 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,6 +13,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
index f337bd7eb4..e7d75f5f49 100644
--- a/configs/qemu_csky610_virt_defconfig
+++ b/configs/qemu_csky610_virt_defconfig
@@ -5,6 +5,10 @@ BR2_ck610=y
 # System
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # linux kernel header, the same version with linux kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
index c4a10b8ade..df12450a55 100644
--- a/configs/qemu_csky807_virt_defconfig
+++ b/configs/qemu_csky807_virt_defconfig
@@ -5,6 +5,10 @@ BR2_ck807=y
 # System
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # linux kernel header, the same version with linux kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
index 56efe8a6ae..dd1fd329f5 100644
--- a/configs/qemu_csky810_virt_defconfig
+++ b/configs/qemu_csky810_virt_defconfig
@@ -5,6 +5,10 @@ BR2_ck810=y
 # System
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # linux kernel header, the same version with linux kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
index 9ec8f633af..6edfba4e8e 100644
--- a/configs/qemu_csky860_virt_defconfig
+++ b/configs/qemu_csky860_virt_defconfig
@@ -5,6 +5,10 @@ BR2_ck860=y
 # System
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # linux kernel header, the same version with linux kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index a2cadffa92..916a113cd7 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 2ef73d1dd6..7b4a9e3e66 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 2bcf13e085..d14d2fcf65 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,6 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 4352ad6873..71018e9e36 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,6 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index baacc3cc83..51dfa48bb6 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 35ad64368e..26a4560bee 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index a0553ed964..b9dd0dfd4d 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index aaace9540b..8ed5d30818 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 2a8b50a18f..07fbb86046 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 1d9d0807d0..50b9dfe703 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index ed42042292..bcf66b47fe 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,6 +10,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 7f4f28a708..fde495620e 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,6 +10,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index 48d1513846..f5f8623305 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -6,6 +6,10 @@ BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 60147acd4b..2a61a38394 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -5,6 +5,10 @@ BR2_or1k=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4,19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 3c71c17e0a..b37bd11041 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -5,6 +5,10 @@ BR2_powerpc_e5500=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as the kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 42856a52b7..3f516a0462 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,6 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 653d111953..fa6651f7fd 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -10,6 +10,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index acb9d86fb6..2403cfbd83 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 496b0fb2a4..55715dce85 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -25,6 +25,10 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 66bc1d2089..9841575479 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index c7c324d5e8..2ecf9464d9 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,6 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 914eada004..427ea47387 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -11,6 +11,10 @@ BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 5.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 5c52f7a0f8..2125324aff 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -10,6 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 5.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index c7c5126bf9..8d5cf18fc1 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -11,6 +11,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 4d9559a387..8b35e2081d 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -10,6 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index d7be664cbf..0d045a8aca 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index dada40d469..fd66576fed 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,6 +9,10 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index b561e42e51..8adc00ad20 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -11,6 +11,10 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Image
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 52f1744344..b1f508bb1e 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,6 +12,10 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Image
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86/post-build.sh"
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 7cf8c41fd4..a18e670bda 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -11,6 +11,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 8cb93f2d3d..7aef864650 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -15,6 +15,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
-- 
2.24.1
