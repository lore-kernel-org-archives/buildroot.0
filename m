From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  6 Jun 2017 21:52:07 +0200
Subject: [Buildroot] [PATCH v2] toolchain/toolchain-common.in: update
	definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
Message-ID: <20170606195207.6634-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As GCC 7 is now available in Buildroot, update the definition for
BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as the bug #64735 is fixed in GCC 7.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v2:
 - simplify logic (suggested by Thomas)
---
 toolchain/toolchain-common.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d670f44747..ed993dd5f5 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -17,6 +17,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_ARM_CPU_ARMV4
 	default y if BR2_ARM_CPU_ARMV5
 	default y if BR2_sparc_v8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
-- 
2.13.0
