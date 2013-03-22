From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Mar 2013 17:32:28 -0300
Subject: [Buildroot] [PATCH] toolchain/gcc: disable makeinfo
Message-ID: <1363984348-25838-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer versions of texinfo (>=5) break the gcc makeinfo routine, so just
disable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index bdc38cd..24f22f2 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -286,6 +286,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
 		$(GCC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -356,6 +357,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR2)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
 		$(GCC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -436,6 +438,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	ln -snf ../include/ $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sys-include
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
-- 
1.8.1.5
