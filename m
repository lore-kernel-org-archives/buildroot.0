From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Mar 2015 09:15:06 -0300
Subject: [Buildroot] [PATCH 2/2] gcc: remove stray bfin --with-cpu exclusion
In-Reply-To: <1427199306-24508-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427199306-24508-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427199306-24508-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support an internal bfin toolchain hence it's dead code.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 3 ---
 1 file changed, 3 deletions(-)

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
-- 
2.0.5
