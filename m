From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Wed, 20 Mar 2019 00:38:05 +0000
Subject: [Buildroot] [PATCH v5 4/4] boot/riscv-pk: Deprecate riscv-pk and BBL
In-Reply-To: <20190320003706.1126-1-alistair.francis@wdc.com>
References: <20190320003706.1126-1-alistair.francis@wdc.com>
Message-ID: <20190320003706.1126-4-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 boot/riscv-pk/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/riscv-pk/Config.in b/boot/riscv-pk/Config.in
index b4fe36590f..cf9c5cd8ee 100644
--- a/boot/riscv-pk/Config.in
+++ b/boot/riscv-pk/Config.in
@@ -3,10 +3,13 @@ comment "riscv-pk needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_TARGET_RISCV_PK
-	bool "riscv-pk"
+	bool "riscv-pk (deprecated)"
 	depends on BR2_riscv
 	depends on BR2_LINUX_KERNEL
 	help
+	  The RISC-V Proxy Kernel (pk) and Boot Loader (BBL) have
+	  been deprecated. Please use OpenSBI instead.
+
 	  The RISC-V Proxy Kernel (pk) package contains the Berkeley
 	  Boot Loader (BBL) which has been designed to boot a Linux
 	  kernel on a RISC-V processor.
-- 
2.21.0
