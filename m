From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 10 May 2010 01:11:24 +0200
Subject: [Buildroot] [PATCH 5/6] toolchain: rename base target for external
	toolchains
In-Reply-To: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
References: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
Message-ID: <20100509231124.16258.31997.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

It is misleeading to name the external toolchain make target 'uclibc', as
external toochains can be based on other C libraries (eg. glibc or eglibc).

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                                 |    2 +-
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e947e9b..0559a34 100644
--- a/Makefile
+++ b/Makefile
@@ -202,7 +202,7 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-BASE_TARGETS:=uclibc
+BASE_TARGETS:=toolchain-prepare
 endif
 TARGETS:=
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index f1c2a25..c2c565a 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -35,7 +35,7 @@
 #  cross-compiler binaries remains external, all libraries and headers
 #  are imported into the Buildroot tree.
 
-uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
+toolchain-prepare: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthread.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
