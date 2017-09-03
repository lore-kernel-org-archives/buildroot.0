From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:22:18 +0200
Subject: [Buildroot] [PATCH 3/5 v2] arch/mips: internal backend not suitable
	for some cores
In-Reply-To: <cover.1504430497.git.yann.morin.1998@free.fr>
References: <cover.1504430497.git.yann.morin.1998@free.fr>
Message-ID: <aa524c009298c9982b4f7ba88d6193f609e09ace.1504430497.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some cores are not supported by upstream gcc.

Use the newly-introduced symbol to state so, rather than have the
exclusion in the toolchain choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.mips | 2 ++
 toolchain/Config.in | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 89e6effee9..1cce1710da 100644
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
index 890b874e38..7780633665 100644
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
-- 
2.11.0
