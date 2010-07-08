From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  8 Jul 2010 22:08:46 +0200
Subject: [Buildroot] [PATCH] ext-toolchains: fix libnss_*.so installation
	with external glibc
Message-ID: <1278619726-17555-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7192668 introduced a wrong spelling of BR2_TOOLCHAIN_EXTERNAL_GLIBC
that prevented libnss_files.so and libnss_dns.so from being installed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 toolchain/external-toolchain/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 9ad1e31..40e3a52 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -281,7 +281,7 @@ check_cross_compiler_exists = \
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
 
-- 
1.7.0.4
