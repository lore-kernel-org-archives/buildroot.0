From: Alistair Francis <alistair.francis@wdc.com>
Date: Thu, 20 Jun 2019 10:56:48 -0700
Subject: [Buildroot] [PATCH] qemu/riscv32-virt: Fix missing linux-headers
 patch
Message-ID: <20190620175648.7969-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f9993797959 "configs/qemu_riscv32_virt: update to 5.1 kernel"
broke the qemu/riscv32-virt machine build as the BR2_LINUX_KERNEL_PATCH
mechanism was replaced with the BR2_GLOBAL_PATCH_DIR mechanism when the
patch was applied. This results in the linux-headers not having the
patch applied which causes a glibc build failure.

Add a symbolic link to ensure the linux patch is applied to linux and
linux-headers.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 board/qemu/riscv32-virt/patches/linux-headers | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 board/qemu/riscv32-virt/patches/linux-headers

diff --git a/board/qemu/riscv32-virt/patches/linux-headers b/board/qemu/riscv32-virt/patches/linux-headers
new file mode 120000
index 0000000000..9c52cb36f4
--- /dev/null
+++ b/board/qemu/riscv32-virt/patches/linux-headers
@@ -0,0 +1 @@
+linux
\ No newline at end of file
-- 
2.22.0
