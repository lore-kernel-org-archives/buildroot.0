From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:22:17 +0200
Subject: [Buildroot] [PATCH 2/5 v2] arch/csky: internal backend not suitable
In-Reply-To: <cover.1504430497.git.yann.morin.1998@free.fr>
References: <cover.1504430497.git.yann.morin.1998@free.fr>
Message-ID: <98b7fb521d2e89d3c8329757e1af314a547f33b3.1504430497.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream gcc does not have support for C-Sky, and we do not have a
vendor tree for it either (yet?).

Use the newly-introduced symbol to state so, rather than have the
exclusion in the toolchain choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in      | 1 +
 toolchain/Config.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index caf5a318ab..c10bf16809 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -87,6 +87,7 @@ config BR2_bfin
 
 config BR2_csky
 	bool "csky"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8866b7da75..890b874e38 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -48,7 +48,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf607
 	depends on !BR2_bf608
 	depends on !BR2_bf609
-	depends on !BR2_csky
 	depends on !BR2_mips_m6250
 	depends on !BR2_mips_p6600
 
-- 
2.11.0
