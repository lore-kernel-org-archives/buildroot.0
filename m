From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 15:00:21 +0100
Subject: [Buildroot] [git commit] boot/riscv-pk: deprecate riscv-pk and BBL
Message-ID: <20190326135700.5437581E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e2ea4ea95bbabda3979b4a788ec0d42b93ee2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
