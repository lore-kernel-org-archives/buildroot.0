From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Apr 2014 12:05:31 +0100
Subject: [Buildroot] [PATCH] fdk-aac: Disable for MIPS I, II, III and IV
Message-ID: <1397559931-35479-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses the 'msub' instruction which is available only in
mips32 and mips64 ISAs.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/fdk-aac/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 1ec59e1..9cf944e 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -5,6 +5,9 @@ config BR2_PACKAGE_FDK_AAC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh || BR2_sh64
+	# fdk-aac uses the 'msub' instruction whis is available only in
+	# mips32 and mips64 ISAs
+	depends on ! (BR2_mips_1 || BR2_mips_2 || BR2_mips_3 || BR2_mips_4)
 
 	help
 	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
-- 
1.7.1
