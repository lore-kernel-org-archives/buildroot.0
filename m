From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:18 +0200
Subject: [Buildroot] [PATCH 40/44] Remove IMAGE and related configuration
	options
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <325bfd1cbae03fe286796d3fa7de7c0a3227f7a5.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now, we just hardcode the image filenames to be rootfs.$(FSTYPE), in
the $(BINARIES_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    4 ----
 target/Config.in    |   12 ------------
 2 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2bd3640..efb4dec 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -109,7 +109,6 @@ TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -119,9 +118,6 @@ TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
-#IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ROOTFS_SUFFIX)
-
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
diff --git a/target/Config.in b/target/Config.in
index 4cae66c..5d634ca 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -1,17 +1,5 @@
 menu "Target filesystem options"
 
-config BR2_ROOTFS_PREFIX
-	string "Custom root fs prefix"
-	default "rootfs"
-	help
-	  Add a custom string to the beginning of the root file system name.
-
-config BR2_ROOTFS_SUFFIX
-	string "Custom root fs suffix"
-	default ""
-	help
-	  Add a custom string to the end of the root file system name.
-
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom script to run before packing files"
 	default ""
-- 
1.6.3.3
