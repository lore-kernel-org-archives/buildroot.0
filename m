From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 May 2014 23:17:05 +0200
Subject: [Buildroot] [PATCHv2 05/10] gcc: musl patches only available for
	gcc 4.7+
In-Reply-To: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1399324630-3830-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the moment, the musl support is not in mainline gcc, so it
requires a few patches. We have integrated those patches only for gcc
4.7 and gcc 4.8 at the moment, so only allow those gcc versions when
the musl library is selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6a3b75b..99eaa02 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,17 +31,23 @@ choice
 		depends on !BR2_ARM_EABIHF
 		# VFPv4 support appeared in gcc 4.5
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
+		# musl patches only for gcc 4.7+
+		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	config BR2_GCC_VERSION_4_5_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
+		# musl patches only for gcc 4.7+
+		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
+		# musl patches only for gcc 4.7+
+		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
@@ -67,6 +73,8 @@ choice
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		# musl patches only for gcc 4.7+
+		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 		bool "gcc snapshot"
 endchoice
 
-- 
1.9.2
