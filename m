From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 26 Jun 2010 00:15:32 +0200
Subject: [Buildroot] [PATCH 5/5] toolchain: rename base target for external
	toolchains
In-Reply-To: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1277504132-11184-6-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is misleeading to name the external toolchain make target 'uclibc', as
external toochains can be based on other C libraries (eg. glibc or eglibc).

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile                                 |    2 +-
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a167826..5b28cbd 100644
--- a/Makefile
+++ b/Makefile
@@ -230,7 +230,7 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-BASE_TARGETS:=uclibc
+BASE_TARGETS:=toolchain-prepare
 endif
 TARGETS:=
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index c8e7892..d6a759c 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -35,7 +35,7 @@
 #  cross-compiler binaries remains external, all libraries and headers
 #  are imported into the Buildroot tree.
 
-uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
+toolchain-prepare: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-- 
1.7.1
