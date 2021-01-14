From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:39:59 +0100
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-bootlin: update PowerPC 440
 FP toolchain
Message-ID: <20210114224000.456977-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Bootlin PowerPC 440 FP toolchain was rebuilt in version 2020.08-2,
which is rebased on Buildroot 2020.08.3 as that includes a fix for
SecurePLT support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../Config.in.options                         | 16 ++++++-------
 .../toolchain-external-bootlin.hash           | 24 +++++++++----------
 .../toolchain-external-bootlin.mk             | 12 +++++-----
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index be9c204193..d47360ad8d 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -2523,7 +2523,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp glibc bleeding-edge 2020.08-1"
+	bool "powerpc-440fp glibc bleeding-edge 2020.08-2"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
@@ -2538,8 +2538,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Bootlin toolchain for the powerpc-440fp architecture, using
 	  the glibc C library. This is a bleeding-edge version, which
@@ -2549,7 +2549,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
-	bool "powerpc-440fp glibc stable 2020.08-1"
+	bool "powerpc-440fp glibc stable 2020.08-2"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
@@ -2564,8 +2564,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Bootlin toolchain for the powerpc-440fp architecture, using
 	  the glibc C library. This is a stable version, which means
@@ -2575,7 +2575,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
-	bool "powerpc-440fp musl bleeding-edge 2020.08-1"
+	bool "powerpc-440fp musl bleeding-edge 2020.08-2"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
@@ -2598,7 +2598,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
-	bool "powerpc-440fp musl stable 2020.08-1"
+	bool "powerpc-440fp musl stable 2020.08-2"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
@@ -2621,7 +2621,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp uclibc bleeding-edge 2020.08-1"
+	bool "powerpc-440fp uclibc bleeding-edge 2020.08-2"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -2645,7 +2645,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
-	bool "powerpc-440fp uclibc stable 2020.08-1"
+	bool "powerpc-440fp uclibc stable 2020.08-2"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 8764f395fa..3e6eb99cc8 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -200,18 +200,18 @@ sha256  697ef122917022f400003931bc6da75fe07bb5234ef8186cbe027e560f04a168  openri
 sha256  e45d02c9272c909db1c92b6403ed1e0813889ef0c22b2f5166d2675f62d3f20f  openrisc--uclibc--bleeding-edge-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2020.08-1.sha256
 sha256  62c60f9f99828a01f3a16060ceba74b8e2603a8ca3585649434a66f721ecdf75  openrisc--uclibc--stable-2020.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2020.08-1.sha256
-sha256  d7e3ab961be0b39f40b428790e48f9f3e44290bb7bed51446bc7c8d66aacf0da  powerpc-440fp--glibc--bleeding-edge-2020.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2020.08-1.sha256
-sha256  99ab7272cf8fec3e0ce67935bea9c077a2e9bd9076388238c3976cdf1e8f19e0  powerpc-440fp--glibc--stable-2020.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2020.08-1.sha256
-sha256  182dd8d2a4203863c663301b8ee6e59101a0b87dbb03aa3b919944338a2947fe  powerpc-440fp--musl--bleeding-edge-2020.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2020.08-1.sha256
-sha256  4658f631506b7d73a7f6816caa6b8e052d5d203e14a77bd6904af8ee9ebf2868  powerpc-440fp--musl--stable-2020.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2020.08-1.sha256
-sha256  e6570a1683260620bec129e849f68488e59460a99158c5c3e48b30432ec043c7  powerpc-440fp--uclibc--bleeding-edge-2020.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2020.08-1.sha256
-sha256  ed632b806c8e8fa77e0d1f43d57ae169629ce94e4783044771ee60775001d207  powerpc-440fp--uclibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2020.08-2.sha256
+sha256  7b7c2f66ccd3d44cd8a829b5879277be9cfb17f34a26d5055b29a6bab40ff9df  powerpc-440fp--glibc--bleeding-edge-2020.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2020.08-2.sha256
+sha256  ae7b3d06090dfcf54b1e3b4bd4fda9ae5aaaf34aba9118820e6e9d8f1b70c0c4  powerpc-440fp--glibc--stable-2020.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2020.08-2.sha256
+sha256  a6def102659538e3e5838bf4267cd33486d795db753a7109b5e413499ef5df89  powerpc-440fp--musl--bleeding-edge-2020.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2020.08-2.sha256
+sha256  76de0310078633ff34654c8c54d7e80a609c58521a7f2a8041ae4a574889d38a  powerpc-440fp--musl--stable-2020.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2020.08-2.sha256
+sha256  abbe38fc92a71d568c08452f99fe3470e5ded9a666c6829d9104fcf06b984503  powerpc-440fp--uclibc--bleeding-edge-2020.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2020.08-2.sha256
+sha256  d4346ce563ddfbd4946b2dfbc766cafebbf4b09488dc8b398ab8bb242bac9268  powerpc-440fp--uclibc--stable-2020.08-2.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2020.08-1.sha256
 sha256  fe4b9817f060d84118fff5b7d855eacac472975f2adfececb641d2999f94a7ea  powerpc-e300c3--glibc--bleeding-edge-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2020.08-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 71f53f6d58..cfe447428d 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -607,37 +607,37 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/relea
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
-- 
2.29.2
