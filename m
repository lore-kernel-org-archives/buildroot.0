From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 18 Mar 2019 21:02:03 +0000
Subject: [Buildroot] [PATCH v2 3/5] configs: qemu_riscv64_virt: Fix config
 layout
In-Reply-To: <20190318210106.6347-1-alistair.francis@wdc.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
Message-ID: <20190318210106.6347-3-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the config layout, no functional change.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 configs/qemu_riscv64_virt_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 65dbef4135..596edf2fcd 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -4,11 +4,11 @@ BR2_RISCV_64=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Linux headers same as kernel, a 4.20 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
-- 
2.21.0
