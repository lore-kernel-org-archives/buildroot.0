From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:45:04 +0200
Subject: [Buildroot] [git commit] arc/bfin: remove 60x cores
Message-ID: <20171002193852.747B181049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29e046d6e36a4be577fbc0aef3ac0a8dfb034e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those cores are not supported in upstream gcc, not even in master.

The only toolchain that supported those core was the 2014R1 ADI
rebuilt toolchain, but we removed it in 311bc13 (toolchain: kill
ADI Blackfin toolchain) because there was too many issues with it.
ADI has not released any newer toolchain since then.

There is little hope for those cores now, so remove them.

Support for those cores has been useless and unusable for a while
without nobody noticing, therefore we intentionally skip adding
Config.in.legacy. This would require keeping code in
arch/Config.in.bfin since the options being removed are inside a
choice...endchoice block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: explain why we don't add the options to Config.in.legacy.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.bfin | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 9ad2dd7..bd9589c 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -4,18 +4,6 @@ choice
 	default BR2_bf532
 	help
 	  Specify target CPU
-config BR2_bf606
-	bool "bf606"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-config BR2_bf607
-	bool "bf607"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-config BR2_bf608
-	bool "bf608"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-config BR2_bf609
-	bool "bf609"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 config BR2_bf512
 	bool "bf512"
 config BR2_bf514
