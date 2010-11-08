From: Konrad Eisele <konrad@gaisler.com>
Date: Mon,  8 Nov 2010 16:09:59 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain: Add support for --with-cpu
In-Reply-To: <1289229001-1747-1-git-send-email-konrad@gaisler.com>
References: <1289229001-1747-1-git-send-email-konrad@gaisler.com>
Message-ID: <1289229001-1747-2-git-send-email-konrad@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for gcc configuration switch --with-cpu. Uses newly added
BR2_GCC_TARGET_CPU from the target config.

Signed-off-by: Konrad Eisele <konrad@gaisler.com>
---
 toolchain/gcc/Makefile.in       |    3 +++
 toolchain/gcc/gcc-uclibc-4.x.mk |    8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index b6ebca9..2e55ed0 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -37,6 +37,9 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+GCC_WITH_CPU:=--with-cpu=$(BR2_GCC_TARGET_CPU)
+endif
 
 # AVR32 GCC configuration
 ifeq ($(BR2_avr32),y)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 684dca8..af085f7 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -229,7 +229,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC1_CONFIG_OPTIONS) \
 		$(QUIET) \
@@ -306,7 +306,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC2_CONFIG_OPTIONS) \
 		$(QUIET) \
@@ -382,7 +382,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC2_CONFIG_OPTIONS) \
@@ -516,7 +516,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
-- 
1.6.3.2
