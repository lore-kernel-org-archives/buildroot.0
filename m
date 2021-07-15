From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Thu, 15 Jul 2021 09:48:35 +0900
Subject: [Buildroot] [PATCH v2 1/9] arch/config: Make RISC-V MMU optional
In-Reply-To: <20210715004843.337268-1-damien.lemoal@wdc.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
Message-ID: <20210715004843.337268-2-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linux supports No-MMU RISC-V since kernel version 5.8. Make MMU optional
to enable building for RISC-V boards that do not have one.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1853e26bb4..82d3b01980 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -210,7 +210,7 @@ config BR2_powerpc64le
 
 config BR2_riscv
 	bool "RISCV"
-	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	help
 	  RISC-V is an open, free Instruction Set Architecture created
-- 
2.31.1
