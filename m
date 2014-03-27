From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 23:32:15 +0100
Subject: [Buildroot] [git commit] Remove "dirs" dependencies
Message-ID: <20140327223336.F1B4B9C04C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b94266c92585530068317b007bedc85a6c498c49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package infrastructure add automatically the "dirs" dependency so
remove it when the package infrastructure is being used.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                 |    2 +-
 package/uclibc/uclibc.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d49d7bf..197cf84 100644
--- a/Makefile
+++ b/Makefile
@@ -626,7 +626,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
 
-source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
 	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f0fb53a..020e218 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -542,7 +542,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
-uclibc-menuconfig: dirs uclibc-patch
+uclibc-menuconfig: uclibc-patch
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
