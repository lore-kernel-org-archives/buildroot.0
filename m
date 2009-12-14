From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] gcc: remove support for external
	source toolchains
Message-ID: <20091214232054.9693277796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3f90a29baf8a57ff2ead2fd21f896850f0bc596f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-3.x.mk |   10 ----------
 toolchain/gcc/gcc-uclibc-4.x.mk |   10 ----------
 2 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index bc3d423..c7ae913 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -33,18 +33,9 @@ else
  GCC_OFFICIAL_VER:=$(GCC_VERSION)
 endif
 
-
-# redefine if using an external prepatched gcc source
-ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-GCC_SITE:=$(VENDOR_SITE)
-GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
-GCC_PATCH_DIR:=toolchain/gcc/ext_source/$(VENDOR_PATCH_DIR)/$(GCC_OFFICIAL_VERSION)
-endif
-
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_OFFICIAL_VER)
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 ifeq ($(GCC_SNAP_DATE),)
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else
@@ -54,7 +45,6 @@ else
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 endif
 endif
-endif
 
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=true
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 14afb36..b3ee266 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -31,15 +31,6 @@ else
  GCC_OFFICIAL_VER:=$(GCC_VERSION)
 endif
 
-# redefine if using an external prepatched gcc source
-ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-GCC_SITE:=$(VENDOR_SITE)
-GCC_OFFICIAL_VERSION:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
-GCC_PATCH_DIR:=toolchain/gcc/ext_source/$(VENDOR_PATCH_DIR)/$(GCC_OFFICIAL_VERSION)
-endif #!BR2_TOOLCHAIN_BUILDROOT
-
-# define patch location
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y) # Normal toolchain
 ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else # Is a snapshot
@@ -50,7 +41,6 @@ else # Normal patch to snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 endif # Snapshot patch
 endif # Not a snapshot
-endif # BR2_TOOLCHAIN_BUILDROOT
 
 ifneq ($(filter xtensa%,$(ARCH)),)
 include target/xtensa/patch.in
-- 
1.6.3.3
