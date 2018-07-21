From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 21 Jul 2018 08:49:30 +0200
Subject: [Buildroot] [PATCH] luarocks: bump to version 3.0.0
Message-ID: <20180721064930.28650-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash |  2 +-
 package/luarocks/luarocks.mk   | 33 ++++++++++++++++-----------------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 7c3f96606..87ef6827c 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3938df33de33752ff2c526e604410af3dceb4b7ff06a770bc4a240de80a1f934  luarocks-2.4.4.tar.gz
+sha256 a43fffb997100f11cccb529a3db5456ce8dab18171a5cb3645f948147b6f64a1  luarocks-3.0.0.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index bdb642c04..af64f72a6 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.4.4
+LUAROCKS_VERSION = 3.0.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
@@ -26,22 +26,21 @@ endef
 
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
-	$(MAKE1) -C $(@D) install \
-		PREFIX=$(HOST_DIR)
-	echo "-- BR cross-compilation"                          >> $(LUAROCKS_CONFIG_FILE)
-	echo "variables = {"                                    >> $(LUAROCKS_CONFIG_FILE)
-	echo "   LUA_INCDIR = [[$(STAGING_DIR)/usr/include]],"  >> $(LUAROCKS_CONFIG_FILE)
-	echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
-	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
-	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
-	echo "   CFLAGS = [[$(LUAROCKS_CFLAGS)]],"              >> $(LUAROCKS_CONFIG_FILE)
-	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
-	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
-	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
-	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
-	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
-	echo "wrap_bin_scripts = false"                         >> $(LUAROCKS_CONFIG_FILE)
-	echo "deps_mode = [[none]]"                             >> $(LUAROCKS_CONFIG_FILE)
+	$(MAKE1) -C $(@D) install
+	echo "-- BR cross-compilation"                                  >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.LUA_DIR = [[$(STAGING_DIR)/usr]]"               >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.LUA_BINDIR = [[$(STAGING_DIR)/usr/bin]]"        >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.LUA_INCDIR = [[$(STAGING_DIR)/usr/include]]"    >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]]"        >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.CC = [[$(TARGET_CC)]]"                          >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.LD = [[$(TARGET_CC)]]"                          >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.CFLAGS = [[$(LUAROCKS_CFLAGS)]]"                >> $(LUAROCKS_CONFIG_FILE)
+	echo "variables.LIBFLAG = [[-shared $(TARGET_LDFLAGS)]]"        >> $(LUAROCKS_CONFIG_FILE)
+	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
+	echo "gcc_rpath = false"                                        >> $(LUAROCKS_CONFIG_FILE)
+	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"                  >> $(LUAROCKS_CONFIG_FILE)
+	echo "wrap_bin_scripts = false"                                 >> $(LUAROCKS_CONFIG_FILE)
+	echo "deps_mode = [[none]]"                                     >> $(LUAROCKS_CONFIG_FILE)
 endef
 
 $(eval $(host-generic-package))
-- 
2.17.1
