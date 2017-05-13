From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 16:09:53 +0200
Subject: [Buildroot] [git commit] openblas: SPARC support is for Sparc v9
Message-ID: <20170513141121.921D582867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6714d79a22b4c0ad7651659c8009f93574bbd59d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Makefile.sparc in the openblas source code passes -mcpu=v9, i.e it
assumes a SPARCv9 CPU. Therefore, this commit adjusts openblas
Config.in file so that SPARC is only used for BR2_sparc_v9.

Fixes:

  http://autobuild.buildroot.net/results/805087e87b8bb7d11adb49d9eca3959a37aca3a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openblas/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index de26ab3..bc62896 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -31,7 +31,8 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
 	default "I6400"        if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	default "SPARC"        if BR2_sparc
+	# OpenBLAS assumes SPARC=Sparc v9
+	default "SPARC"        if BR2_sparc_v9
 	# Cortex-A15 always have a VFPv4
 	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
 	# Cortex-A9 have an optional VFPv3, so we need to make sure it
