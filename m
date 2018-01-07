From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:56:59 +0100
Subject: [Buildroot] [git commit] toolchain: m68k coldfire is also affected
 by gcc bug 64735
Message-ID: <20180107224039.173818347F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98b3b83fb54323cd1be0f38084a51c4e0c939e65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Verified experimentally by using exception_ptr with m68k_cf5208 and
looking at the value of ATOMIC_INT_LOCK_FREE. ATOMIC_INT_LOCK_FREE=1,
so the issue is present. Also verified that gcc 7.x fixed it also for
cf5208.

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
