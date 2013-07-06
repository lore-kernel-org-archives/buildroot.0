From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:41 +0200
Subject: [Buildroot] [PATCH 02/12] arch/arm: remove OABI option
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <e9f3640ee3ca10a039e497d71ac5caa86599c1e7.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

OABI is more than legacy, it's dead.

New developments should go with EABI, since it so much better.
From the Debian EABI page [0] :
  - floating point performance, with or without an FPU is very much faster
  - mixing soft and hardfloat code is possible
  - structure packing is not as painful as it used to be
  - a more efficient syscall convention
  - more compatibility with various tools

[0] http://wiki.debian.org/ArmEabiPort

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 983cac4..45d2b4b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -64,27 +64,8 @@ config BR2_arm1136jf_s
 	bool
 	default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
 
-choice
-	prompt "Target ABI"
-	depends on BR2_arm || BR2_armeb
-	depends on BR2_DEPRECATED
-	default BR2_ARM_EABI
-	help
-	  Application Binary Interface to use
-
-	  Note:
-	    Using OABI is discouraged.
-
-config BR2_ARM_EABI_CHOICE
-	bool "EABI"
-config BR2_ARM_OABI
-	bool "OABI"
-	depends on !BR2_GCC_VERSION_4_7_X
-endchoice
-
 config BR2_ARM_EABI
 	def_bool y
-	depends on !BR2_ARM_OABI
 
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
-- 
1.8.1.2
