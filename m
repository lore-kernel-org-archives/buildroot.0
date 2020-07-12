From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Jul 2020 18:34:20 +0200
Subject: [Buildroot] [PATCH 2/4] board/qemu/aarch64-virt/linux.config:
 enable ACPI
In-Reply-To: <20200712163422.1162187-1-romain.naour@gmail.com>
References: <20200712163422.1162187-1-romain.naour@gmail.com>
Message-ID: <20200712163422.1162187-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qemu aarch64 support ACPI Generic Event Device (GED) for device memory
cold/hot plug with ACPI boot [1].

ACPI support is required to allow booting the kernel in efi mode with
grub bootloader.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=cff51ac978c4fa0b3d0de0fd62d772d9003f123e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 02e0812ffd..657acaf04f 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -9,6 +9,7 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_COMPAT=y
 CONFIG_FW_CFG_SYSFS=y
 CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_ACPI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
-- 
2.25.4
