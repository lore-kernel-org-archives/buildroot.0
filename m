From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:28:32 +0100
Subject: [Buildroot] [git commit] toolchain/gcc: disable makeinfo
Message-ID: <20130324133025.9332A9B267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62322acb2ce186d544ab21fe253ccc8561a68a48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of texinfo (>=5) break the gcc makeinfo routine, so just
disable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 1b7f222..9d131d5 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -254,6 +254,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
 		$(GCC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -324,6 +325,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR2)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
 		$(GCC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -404,6 +406,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	ln -snf ../include/ $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sys-include
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
