From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Tue,  8 Sep 2020 14:16:21 +0900
Subject: [Buildroot] [PATCH 2/5] arch/config: Make RISC-V MMU optional
In-Reply-To: <20200908051624.425573-1-damien.lemoal@wdc.com>
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
Message-ID: <20200908051624.425573-3-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux supports No-MMU RISC-V since kernel version 5.8. Make MMU optional
to enable building for RISC-V boards that do not have one.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 0707c076e2..4a2787c350 100644
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
2.26.2
