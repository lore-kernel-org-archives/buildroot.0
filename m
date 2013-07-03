From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 08:40:24 +0200
Subject: [Buildroot] [git commit] toolchain: remove references to
	LIBFLOAT_TARGET
Message-ID: <20130703070347.F36CE9A158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d22f56ed8999501c54d102e338aaee80b6f9d16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libfloat package was removed in
accbd71154b8815678baa12f21f853ed8478f400, and therefore since this
commit, the LIBFLOAT_TARGET variable is always empty. We get rid of
the stale references to this variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 toolchain/uClibc/uclibc.mk      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 79a0125..0dc8200 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -518,7 +518,7 @@ endif
 
 cross_compiler:=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc_intermediate \
-	$(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR3)/.installed \
+	uclibc $(GCC_BUILD_DIR3)/.installed \
 	$(STAMP_DIR)/gcc_libs_target_installed \
 	$(GCC_TARGETS)
 
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 0e01d94..f042c63 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -449,7 +449,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/
 	touch $@
 
-$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLOAT_TARGET)
+$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate)
 	$(Q)$(call MESSAGE,"Building uClibc")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
