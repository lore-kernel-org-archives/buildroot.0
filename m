From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 14:43:32 +0100
Subject: [Buildroot] [PATCH] arch/mips: remove some remaining mips1/2/3/4
	bits
Message-ID: <1444398212-18584-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7630503..297977a 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -6,8 +6,8 @@ choice
 	help
 	  Specific CPU variant to use
 
-	  64bit cabable: 3, 4, 64, 64r2
-	  non-64bit capable: 1, 2, 32, 32r2
+	  64bit cabable: 64, 64r2
+	  non-64bit capable: 32, 32r2
 
 config BR2_mips_32
 	bool "mips 32"
@@ -65,10 +65,6 @@ config BR2_ARCH_HAS_ATOMICS
 	default y
 
 config BR2_GCC_TARGET_ARCH
-	default "mips1"		if BR2_mips_1
-	default "mips2"		if BR2_mips_2
-	default "mips3"		if BR2_mips_3
-	default "mips4"		if BR2_mips_4
 	default "mips32"	if BR2_mips_32
 	default "mips32r2"	if BR2_mips_32r2
 	default "mips64"	if BR2_mips_64
-- 
1.7.1
