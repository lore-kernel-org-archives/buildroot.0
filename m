From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 17:30:06 +0100
Subject: [Buildroot] [git commit] arch/mips: add (Marvell) Octeon II
 processor
Message-ID: <20190204163131.5253683B8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b21e159b5da31afaca63fba228a620f74b317c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The compiler recognizes a specific 'march' value for Octeon II processors,
so create a 'Target Architecture Variant' entry for it in the target menu.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.mips | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index f28113df44..b8567c56b8 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -122,6 +122,13 @@ config BR2_mips_i6400
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_mips_octeon2
+	bool "Octeon II"
+	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R2
+	help
+	  Marvell (formerly Cavium Networks) Octeon II CN60XX
+	  processors.
 config BR2_mips_p6600
 	bool "P6600"
 	depends on BR2_ARCH_IS_64
@@ -241,6 +248,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips64r5"	if BR2_mips_64r5
 	default "mips64r6"	if BR2_mips_64r6
 	default "i6400"		if BR2_mips_i6400
+	default "octeon2"	if BR2_mips_octeon2
 	default "p6600"		if BR2_mips_p6600
 
 config BR2_MIPS_OABI32
