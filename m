From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Apr 2018 12:46:35 +0300
Subject: [Buildroot] [PATCH 1/2] lz4: bump to version 1.8.1.2
Message-ID: <d7eb4454e9b67f918eef87dddff7e93616748b36.1524131196.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use lib and lz4 make targets to avoid build of the manual generator, and
the examples. Both of them use the target compiler to build host tools.

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lz4/lz4.hash | 4 +++-
 package/lz4/lz4.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 5048503f8063..bdc43d1e669b 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,2 +1,4 @@
 # sha256 locally computed
-sha256 0190cacd63022ccb86f44fa5041dc6c3804407ad61550ca21c382827319e7e7e  lz4-v1.7.5.tar.gz
+sha256 12f3a9e776a923275b2dc78ae138b4967ad6280863b77ff733028ce89b8123f9  lz4-v1.8.1.2.tar.gz
+sha256 d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index de8c311a3125..c88329f7979e 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = v1.7.5
+LZ4_VERSION = v1.8.1.2
 LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
@@ -18,7 +18,7 @@ LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
 endif
 
 define HOST_LZ4_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) lib lz4
 endef
 
 define HOST_LZ4_INSTALL_CMDS
@@ -27,7 +27,7 @@ define HOST_LZ4_INSTALL_CMDS
 endef
 
 define LZ4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) lib lz4
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
-- 
2.17.0
