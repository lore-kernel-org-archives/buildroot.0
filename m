From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Sep 2017 21:38:51 +0200
Subject: [Buildroot] [PATCH 3/4] arch/bfin: internal backend not suitable
	for some cores
In-Reply-To: <cover.1504381100.git.yann.morin.1998@free.fr>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
Message-ID: <fd7e5dc963d17a2a1c33f575fbf73ab1140099f2.1504381100.git.yann.morin.1998@free.fr>
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
 arch/Config.in.bfin | 4 ++++
 toolchain/Config.in | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 90e4ab97b0..8c1c80ad52 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -6,12 +6,16 @@ choice
 	  Specify target CPU
 config BR2_bf606
 	bool "bf606"
+	select BR2_ARCH_NOT_UPSTREAM_GCC
 config BR2_bf607
 	bool "bf607"
+	select BR2_ARCH_NOT_UPSTREAM_GCC
 config BR2_bf608
 	bool "bf608"
+	select BR2_ARCH_NOT_UPSTREAM_GCC
 config BR2_bf609
 	bool "bf609"
+	select BR2_ARCH_NOT_UPSTREAM_GCC
 config BR2_bf512
 	bool "bf512"
 config BR2_bf514
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5e4ccb5baf..94cccea57e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -44,10 +44,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	depends on !BR2_ARCH_NO_INTERNAL_BACKEND
-	depends on !BR2_bf606
-	depends on !BR2_bf607
-	depends on !BR2_bf608
-	depends on !BR2_bf609
 	depends on !BR2_mips_m6250
 	depends on !BR2_mips_p6600
 
-- 
2.11.0
