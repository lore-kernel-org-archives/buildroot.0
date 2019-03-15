From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Fri, 15 Mar 2019 23:06:38 +0000
Subject: [Buildroot] [PATCH 1/3] arch: riscv: Add a RISC-V Platform option
Message-ID: <20190315230540.4311-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a RISC-V Platform option. At the moment only QEMU platforms are
supported, but in the future this can be extended to include real
hardware platforms (such as the Unleashed board).

My goal is that this platform will set default config options (such as
the default defconfig for the kernel) based on the platform value.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/Config.in.riscv | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 097719e846..c97fa5b703 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -108,6 +108,22 @@ config BR2_RISCV_ABI_LP64D
 	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
 endchoice
 
+choice
+	prompt "Target Platform"
+	default BR2_RISCV_QEMU_VIRT
+	help
+	  The RISC-V Platform to target.
+
+config BR2_RISCV_QEMU_VIRT
+	bool "qemu/virt"
+
+config BR2_RISCV_QEMU_SIFIVE_U
+	bool "qemu/sifive_u"
+
+config BR2_RISCV_UNKNOWN
+	bool "unknown"
+endchoice
+
 config BR2_ARCH
 	default "riscv32" if !BR2_ARCH_IS_64
 	default "riscv64" if BR2_ARCH_IS_64
-- 
2.21.0
