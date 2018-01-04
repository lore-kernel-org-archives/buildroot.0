From: Jan Heylen <heyleke@gmail.com>
Date: Thu,  4 Jan 2018 13:28:30 +0100
Subject: [Buildroot] [PATCH v6 3/4] m68k_cf5208: suffers from gcc 64735
In-Reply-To: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
References: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
Message-ID: <1515068911-21112-4-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

so add it to the list of BR2_TOOLCHAIN_HAS_GCC_BUG_64735

Identified experimentally by using exception_ptr with m68k_cf5208 and
looking at the value of ATOMIC_INT_LOCK_FREE. ATOMIC_INT_LOCK_FREE = 1,
so the issue is present. Also verified that gcc 7.x fixed it also for cf5208.

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
---
 toolchain/toolchain-common.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d743c63..0000713 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -22,6 +22,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_ARM_CPU_ARMV4
 	default y if BR2_ARM_CPU_ARMV5
 	default y if BR2_sparc_v8
+	default y if BR2_m68k_cf5208
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
2.7.4
