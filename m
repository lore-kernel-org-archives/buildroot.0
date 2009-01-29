From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 29 Jan 2009 19:49:12 +0100
Subject: [Buildroot] [PATCH] toolchain/gcc: remove unused GCC_ENABLE_CLOCALE
Message-ID: <200901291949.12311.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable was introduced in r17046 (add gfortran support,
2006-12-22) and wasn't used even there.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 toolchain/gcc/gcc-uclibc-3.x.mk |    4 ----
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ----
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index 368ac8e..bb4137c 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -123,10 +123,6 @@ else
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
-GCC_ENABLE_CLOCALE:=--disable-clocale
-endif
-
 HOST_SOURCE+=gcc-source
 
 #############################################################
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index cd49c18..461e45e 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -133,10 +133,6 @@ else
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
-GCC_ENABLE_CLOCALE:=--disable-clocale
-endif
-
 ifeq ($(BR2_KERNEL_HURD),y)
 EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
 endif
-- 
1.6.1.2.256.g62566b
