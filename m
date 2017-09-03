From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:22:19 +0200
Subject: [Buildroot] [PATCH 4/5 v2] arch/bfin: internal backend not suitable
	for some cores
In-Reply-To: <cover.1504430497.git.yann.morin.1998@free.fr>
References: <cover.1504430497.git.yann.morin.1998@free.fr>
Message-ID: <859466904fe12c82074c1a1c31606ca63fdcde12.1504430497.git.yann.morin.1998@free.fr>
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
index 90e4ab97b0..9ad2dd7ef4 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -6,12 +6,16 @@ choice
 	  Specify target CPU
 config BR2_bf606
 	bool "bf606"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 config BR2_bf607
 	bool "bf607"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 config BR2_bf608
 	bool "bf608"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 config BR2_bf609
 	bool "bf609"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 config BR2_bf512
 	bool "bf512"
 config BR2_bf514
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7780633665..bf1166b601 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -44,10 +44,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
-	depends on !BR2_bf606
-	depends on !BR2_bf607
-	depends on !BR2_bf608
-	depends on !BR2_bf609
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
-- 
2.11.0
