From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Aug 2009 14:39:30 +0200
Subject: [Buildroot] [git commit master] project: saveconfig/getconfig
	doesn't need conf
Message-ID: <20090827124024.33B517770A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5413e83d8d18fa67d1fc1e586d08d70c379b7d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And get rid of unused debugging code while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 project/project.mk |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/project/project.mk b/project/project.mk
index 26c2ffc..3074eff 100644
--- a/project/project.mk
+++ b/project/project.mk
@@ -19,7 +19,7 @@ $(TARGET_DIR)/etc/br-version: .config
 	mkdir -p $(TARGET_DIR)/etc
 	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) >$@
 
-saveconfig: $(CONFIG)/conf
+saveconfig:
 	mkdir -p $(LOCAL)/$(PROJECT)
 	-cp .config $(PROJECT_FILE)
 	if [ -f $(LINUX26_DIR)/.config ]; then \
@@ -48,14 +48,5 @@ saveconfig: $(CONFIG)/conf
 			$(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h; \
 	fi
 
-getconfig: $(CONFIG)/conf
+getconfig:
 	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config
-
-vendor-dbg:
-	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)
-	@echo VENDOR_SUFFIX=$(BR2_VENDOR_SUFFIX)
-	@echo VENDOR_BINUTILS_RELEASE=$(BR2_VENDOR_BINUTILS_RELEASE)
-	@echo VENDOR_GCC_RELEASE=$(BR2_VENDOR_GCC_RELEASE)
-	@echo VENDOR_UCLIBC_RELEASE=$(BR2_VENDOR_UCLIBC_RELEASE)
-	@echo VENDOR_GDB_RELEASE=$(BR2_VENDOR_GDB_RELEASE)
-	@echo VENDOR_PATCH_DIR=$(BR2_VENDOR_PATCH_DIR)
-- 
1.6.3.3
