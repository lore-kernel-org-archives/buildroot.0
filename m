From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 20 Nov 2013 10:42:53 +0000
Subject: [Buildroot] [PATCH] Mark MIPS I, II, III and IV as deprecated
Message-ID: <1384944173-15749-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index d70fd63..43af33c 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -12,14 +12,16 @@ choice
 
 config BR2_mips_1
 	bool "mips I (generic)"
-	depends on !BR2_ARCH_IS_64
+	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
 config BR2_mips_2
 	bool "mips II"
-	depends on !BR2_ARCH_IS_64
+	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
 config BR2_mips_3
 	bool "mips III"
+	depends on BR2_DEPRECATED
 config BR2_mips_4
 	bool "mips IV"
+	depends on BR2_DEPRECATED
 config BR2_mips_32
 	bool "mips 32"
 	depends on !BR2_ARCH_IS_64
-- 
1.7.1
