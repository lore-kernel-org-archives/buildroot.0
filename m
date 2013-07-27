From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:40 +0200
Subject: [Buildroot] [git commit] gcc/bfin: doesn't support --with-cpu
	defaults
Message-ID: <20130727141205.CA8AA9AC10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=111ced757eece3172daad8a39d884aa274edba2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 85cd7d4..cbeaa6c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -159,6 +159,8 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 HOST_GCC_COMMON_CONF_OPT += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
+# GCC doesn't support --with-cpu for bfin
+ifeq ($(BR2_bfin),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
@@ -166,6 +168,7 @@ else
 HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
+endif
 
 GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 ifneq ($(GCC_TARGET_FPU),)
