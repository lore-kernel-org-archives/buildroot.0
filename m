From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Jul 2010 23:06:53 +0200
Subject: [Buildroot] [git commit master 1/1] ext-toolchains: fix libnss_*.so
	installation with external glibc
Message-ID: <20100708210709.3637E82794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e766f13d1707ff77a2f6d0d22664a35bc275128a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7192668 introduced a wrong spelling of BR2_TOOLCHAIN_EXTERNAL_GLIBC
that prevented libnss_files.so and libnss_dns.so from being installed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.1
