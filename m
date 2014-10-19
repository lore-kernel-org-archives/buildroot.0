From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:08:02 +0200
Subject: [Buildroot] [PATCH 28/31] arch/m68k: get rid of BR2_GCC_TARGET_TUNE
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-29-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On m68k, we are passing the exact same values of BR2_GCC_TARGET_ARCH
and BR2_GCC_TARGET_TUNE, which is redundant. Therefore, this commit
removes the usage of BR2_GCC_TARGET_TUNE on m68k.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.m68k | 8 --------
 1 file changed, 8 deletions(-)

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
-- 
2.0.0
