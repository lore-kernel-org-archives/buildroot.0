From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:41:42 +0200
Subject: [Buildroot] [git commit] arch/mips: internal backend not suitable
	for some cores
Message-ID: <20171002193852.56D68803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fbbf8a1d155ae588651cfd6b8a9b40287154d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some cores are not supported by upstream gcc.

Use the newly-introduced symbol to state so, rather than have the
exclusion in the toolchain choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips | 2 ++
 toolchain/Config.in | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 89e6eff..1cce171 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -61,6 +61,7 @@ config BR2_mips_m5150
 config BR2_mips_m6250
 	bool "M6250"
 	depends on !BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_MIPS_CPU_MIPS32R6
 config BR2_mips_p5600
 	bool "P5600"
@@ -103,6 +104,7 @@ config BR2_mips_i6400
 config BR2_mips_p6600
 	bool "P6600"
 	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_MIPS_CPU_MIPS64R6
 endchoice
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 890b874..7780633 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -48,8 +48,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf607
 	depends on !BR2_bf608
 	depends on !BR2_bf609
-	depends on !BR2_mips_m6250
-	depends on !BR2_mips_p6600
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
