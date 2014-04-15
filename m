From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 21:06:57 +0200
Subject: [Buildroot] [git commit] fdk-aac: Disable for MIPS I, II, III and IV
Message-ID: <20140415190722.3A8C99C7CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66e41680868cc5f097ccb3206fe0058c52528b87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package uses the 'msub' instruction which is available only in
mips32 and mips64 ISAs.

[Thomas: replicate the new dependency to the comment.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fdk-aac/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 1ec59e1..7922364 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -5,6 +5,9 @@ config BR2_PACKAGE_FDK_AAC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh || BR2_sh64
+	# fdk-aac uses the 'msub' instruction whis is available only in
+	# mips32 and mips64 ISAs
+	depends on !(BR2_mips_1 || BR2_mips_2 || BR2_mips_3 || BR2_mips_4)
 
 	help
 	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
@@ -18,3 +21,4 @@ comment "fdk-aac needs a toolchain w/ C++"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh || BR2_sh64
+	depends on !(BR2_mips_1 || BR2_mips_2 || BR2_mips_3 || BR2_mips_4)
