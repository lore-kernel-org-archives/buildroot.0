From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:15:49 +0200
Subject: [Buildroot] [git commit] arch/mips: remove some remaining
	mips1/2/3/4 bits
Message-ID: <20151009211557.0CE0E81EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25677a717ccaaaf3d9acf32a3d968eaff8f09151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
