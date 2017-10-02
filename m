From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:41:36 +0200
Subject: [Buildroot] [git commit] arch/csky: internal backend not suitable
Message-ID: <20171002193852.427AC803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba00283be8384789bd90a238ddf6b93d631bcb7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream gcc does not have support for C-Sky, and we do not have a
vendor tree for it either (yet?).

Use the newly-introduced symbol to state so, rather than have the
exclusion in the toolchain choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in      | 1 +
 toolchain/Config.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index caf5a31..c10bf16 100644
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
index 8866b7d..890b874 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -48,7 +48,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf607
 	depends on !BR2_bf608
 	depends on !BR2_bf609
-	depends on !BR2_csky
 	depends on !BR2_mips_m6250
 	depends on !BR2_mips_p6600
 
