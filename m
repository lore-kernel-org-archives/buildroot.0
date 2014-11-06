From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:14:13 +0100
Subject: [Buildroot] [git commit] arch/m68k: get rid of BR2_GCC_TARGET_TUNE
Message-ID: <20141106233447.39A56B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db5e6d6c14eed257483e6982c24d1afd5abb36a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On m68k, we are passing the exact same values of BR2_GCC_TARGET_ARCH
and BR2_GCC_TARGET_TUNE, which is redundant. Therefore, this commit
removes the usage of BR2_GCC_TARGET_TUNE on m68k.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.m68k |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 6b79307..6b868a1 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -7,14 +7,6 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y
 
-config BR2_GCC_TARGET_TUNE
-	default "68000"		if BR2_m68k_68000
-	default "68010"		if BR2_m68k_68010
-	default "68020"		if BR2_m68k_68020
-	default "68030"		if BR2_m68k_68030
-	default "68040"		if BR2_m68k_68040
-	default "68060"		if BR2_m68k_68060
-
 config BR2_GCC_TARGET_ARCH
 	default "68000"		if BR2_m68k_68000
 	default "68010"		if BR2_m68k_68010
