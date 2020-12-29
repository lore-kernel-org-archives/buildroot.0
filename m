From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:03:17 +0100
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate for
 riscv32 toolchain
Message-ID: <20201229204554.9D0B280277@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e74cdd07a33785ca2c16b3ec394d41ceaf1f1aeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RISC-V 32-bit toolchain is using a recent glibc version that no
longer has RPC support. Thanks to the change in
gen-bootlin-toolchains, this is now properly detected.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/849510531

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-bootlin/Config.in.options      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 3c94ae1535..be9c204193 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -3331,7 +3331,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Bootlin toolchain for the riscv32-ilp32d architecture,
 	  using the glibc C library. This is a bleeding-edge version,
