From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:41:53 +0200
Subject: [Buildroot] [git commit] arch/bfin: internal backend not suitable
	for some cores
Message-ID: <20171002193852.666FF8104A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9f61fb4ce95118b81ebc05d011c8eb338b153ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some cores are not supported by upstream gcc.

Use the newly-introduced symbol to state so, rather than have the
exclusion in the toolchain choice.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.bfin | 4 ++++
 toolchain/Config.in | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 90e4ab9..9ad2dd7 100644
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
index 7780633..bf1166b 100644
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
