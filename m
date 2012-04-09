From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Apr 2012 09:46:59 -0300
Subject: [Buildroot] [PATCH] toolchain/gcc: remove duplicate and unused
	variables
Message-ID: <1333975619-3075-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove duplicate $(QUIET) variables.
Also remove unused $(EXTRA_GCC?_CONFIG_OPTIONS)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index d9547fb..2c8b11f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -234,8 +234,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_GCC1_CONFIG_OPTIONS) \
-		$(QUIET) \
 	)
 	touch $@
 
@@ -301,8 +299,6 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_GCC2_CONFIG_OPTIONS) \
-		$(QUIET) \
 	)
 	touch $@
 
@@ -380,7 +376,6 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_GCC2_CONFIG_OPTIONS) \
 	)
 	touch $@
 
@@ -517,7 +512,6 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_GCC4_CONFIG_OPTIONS) \
 	)
 	touch $@
 
-- 
1.7.3.4
