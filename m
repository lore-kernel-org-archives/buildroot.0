From: Laurent GONZALEZ <br22@gezedo.com>
Date: Mon, 16 Apr 2018 14:21:18 +0200
Subject: [Buildroot] [PATCH] package/binutils: Cortex-M targets require
 version <2.29
Message-ID: <da109542-e77b-364e-cd54-12c7bbbcead7@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils 2.29 changed the implementation of adr pseudo instruction
it breaks linux kernel and impacts Cortex-M targets (eg. stm32)

Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
---
 package/binutils/Config.in.host | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 22478d917a..ef957777ee 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,9 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
-	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M
+	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc && !BR2_ARM_CPU_ARMV7M
+	default BR2_BINUTILS_VERSION_ARC if BR2_arc && !BR2_ARM_CPU_ARMV7M
 	help
 	  Select the version of binutils you wish to use.
 
-- 
2.11.0
