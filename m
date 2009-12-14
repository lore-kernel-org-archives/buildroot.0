From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] binutils: remove support for
	external source toolchains
Message-ID: <20091214232057.5A98977796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de6dbcf858d4fb5fa0c3b67140ac49639378bc72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/binutils/binutils.mk |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 38bee9e..288a000 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -48,21 +48,15 @@ BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp="$(GMP_TARGET_DIR)"
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
 
-BINUTILS_OFFICIAL_VERSION:=$(BINUTILS_VERSION)$(VENDOR_SUFFIX)$(VENDOR_BINUTILS_RELEASE)
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
-else # ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),)
-BINUTILS_SITE:=$(VENDOR_SITE)
-BINUTILS_PATCH_DIR:=toolchain/binutils/ext_source/$(VENDOR_PATCH_DIR)/$(BINUTILS_OFFICIAL_VERSION)
-endif
 
 ifneq ($(filter xtensa%,$(ARCH)),)
 include target/xtensa/patch.in
 BINUTILS_PATCH_EXTRA:=$(call XTENSA_PATCH,binutils,$(BINUTILS_PATCH_DIR),. ..)
 endif
 
-BINUTILS_SOURCE:=binutils-$(BINUTILS_OFFICIAL_VERSION).tar.bz2
-BINUTILS_DIR:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)
+BINUTILS_SOURCE:=binutils-$(BINUTILS_VERSION).tar.bz2
+BINUTILS_DIR:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_VERSION)
 BINUTILS_CAT:=$(BZCAT)
 
 BINUTILS_DIR1:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_VERSION)-build
-- 
1.6.3.3
