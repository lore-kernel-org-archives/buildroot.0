From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 May 2019 19:42:46 +0200
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: remove unused gcc
 target abi options for powerpc
Message-ID: <20190526174246.14651-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc target abi options for powerpc were added by [1] and renamed by [2]
to BR2_PPC_ABI_* but never used. Since always BR2_GCC_TARGET_ABI is empty
when using a powerpc toolchain.

Buildroot currently support SPE and Classic target ABI, nothing seems
to require a specific gcc target abi option.

This patch is a cleanup like commit [3].

[1] 7d8a59b40e46fa6ed84a5b78644327e97d04adef
[2] 98175bd43dbfc70f473cca6759bc8a2f4e655734
[3] fd08153b9d677d654add6c580b9ccc5c27d672e2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Cyril Bur <cyrilbur@gmail.com>
Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 arch/Config.in.powerpc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 7a452a630a..394f2e625c 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -205,14 +205,6 @@ config BR2_GCC_TARGET_CPU
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
 
-config BR2_GCC_TARGET_ABI
-	default "altivec"		if BR2_PPC_ABI_altivec
-	default "no-altivec"		if BR2_PPC_ABI_no-altivec
-	default "spe"			if BR2_PPC_ABI_spe
-	default "no-spe"		if BR2_PPC_ABI_no-spe
-	default "ibmlongdouble"		if BR2_PPC_ABI_ibmlongdouble
-	default "ieeelongdouble"	if BR2_PPC_ABI_ieeelongdouble
-
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
 	default "PowerPC64"	if BR2_powerpc64 || BR2_powerpc64le
-- 
2.21.0
