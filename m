From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  6 Jun 2017 16:08:50 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-common.in: update
	definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
Message-ID: <20170606140850.5823-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As GCC7 is now available in Buildroot, update the definition for
BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as the bug #64735 is fixed in GCC 7.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 toolchain/toolchain-common.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d670f44747..06986abdd2 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -13,10 +13,9 @@ comment "Toolchain Generic Options"
 # ints before GCC 7
 config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	bool
-	default y if BR2_nios2
-	default y if BR2_ARM_CPU_ARMV4
-	default y if BR2_ARM_CPU_ARMV5
-	default y if BR2_sparc_v8
+	default y if (BR2_nios2 || BR2_ARM_CPU_ARMV4 || \
+		BR2_ARM_CPU_ARMV5 || BR2_sparc_v8) && \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
-- 
2.13.0
