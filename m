From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 12:29:34 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: Enable --with-float for
	powerpc
Message-ID: <20130506103014.E04C399C40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cccb01bf5947a7ea3a80cb14d680259e3a20d428
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8d929f4b ("toolchain/gcc: Only enable --with-float when it makes
sense") restricted the --with-float use to only MIPS, ARM and SPARC,
while it seems that powerpc needs it as well.

Fixes the qemu_ppc_virtex_ml507_defconfig build.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 128b7ab..959568f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -66,7 +66,8 @@ endif
 # Determine soft-float options
 ifeq ($(BR2_SOFT_FLOAT),y)
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_sparc),y)
+# powerpc seems to be needing it as well
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 endif
 ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
