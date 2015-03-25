From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 21:40:24 +0100
Subject: [Buildroot] [git commit] gcc: remove stray bfin --with-cpu exclusion
Message-ID: <20150325204026.75CF28188F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=314f0ef16cfdd752f298f30d8d46463918d5d359
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support an internal bfin toolchain hence it's dead code.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b5d2ddb..24fd7b8 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -186,8 +186,6 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
-# GCC doesn't support --with-cpu for bfin
-ifeq ($(BR2_bfin),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
@@ -195,7 +193,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
-endif
 
 GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 ifneq ($(GCC_TARGET_FPU),)
