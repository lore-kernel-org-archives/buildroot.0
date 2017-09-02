From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Sep 2017 21:38:50 +0200
Subject: [Buildroot] [PATCH 2/4] arch/csky: internal backend not suitable
In-Reply-To: <cover.1504381100.git.yann.morin.1998@free.fr>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
Message-ID: <db6cdf662d6ceb8d21d8a4b7db3b083fcd8c97b6.1504381100.git.yann.morin.1998@free.fr>
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
index da893caf5a..ae9b084114 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -87,6 +87,7 @@ config BR2_bfin
 
 config BR2_csky
 	bool "csky"
+	select BR2_ARCH_NO_INTERNAL_BACKEND
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 919757e558..5e4ccb5baf 100644
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
