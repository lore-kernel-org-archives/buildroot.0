From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:26 +0200
Subject: [Buildroot] [PATCHv2 03/25] arch/arm: remove OABI option
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-4-git-send-email-thomas.petazzoni@free-electrons.com>
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

[Thomas: keep the ABI choice, as we are going to introduce EABIhf later].
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 983cac4..4daa91f 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -72,19 +72,12 @@ choice
 	help
 	  Application Binary Interface to use
 
-	  Note:
-	    Using OABI is discouraged.
-
 config BR2_ARM_EABI_CHOICE
 	bool "EABI"
-config BR2_ARM_OABI
-	bool "OABI"
-	depends on !BR2_GCC_VERSION_4_7_X
 endchoice
 
 config BR2_ARM_EABI
 	def_bool y
-	depends on !BR2_ARM_OABI
 
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
-- 
1.8.1.2
