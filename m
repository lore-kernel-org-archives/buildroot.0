From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/crosstool-ng: use
	global BR2 version string
Message-ID: <20101103230450.A86368A5A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=75efd6b4fa5ff8bba2528af9cd765d7c733a6f78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 5ce0b86..0812216 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -161,7 +161,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="buildroot_ctng":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(REAL_GNU_TARGET_NAME)":;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_VERSION) - buildroot $(call qstrip,$(BR2_VERSION))":;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_VERSION) - buildroot $(BR2_VERSION_FULL)":;
 ifneq ($(call qstrip,$(BR2_PACKAGE_GDB_SERVER))$(call qstrip,$(BR2_PACKAGE_GDB_HOST)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
 endif
-- 
1.7.1
