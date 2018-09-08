From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:06:53 +0200
Subject: [Buildroot] [git commit] luarocks: bump to version 3.0.2
Message-ID: <20180908130714.ED73682DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba5d0dd1efe287007387c63b3408f875d047e47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(remove 2 unused variables)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 4aa791cb4d..dcfff3c0c8 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b989c4b60d6c9edcd65169e5e42fcffbd39cdbebe6b138fa5aea45102f8d9ec0  luarocks-3.0.1.tar.gz
+sha256 3836267eff2f85fb552234e966602b1e649c58f81f47c7de3785e071c8127f5a  luarocks-3.0.2.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 25e3ad3e22..ad057d8917 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.0.1
+LUAROCKS_VERSION = 3.0.2
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
@@ -31,8 +31,6 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install
 	echo "-- BR cross-compilation"                                  >> $(LUAROCKS_CONFIG_FILE)
-	echo "variables.LUA_DIR = [[$(STAGING_DIR)/usr]]"               >> $(LUAROCKS_CONFIG_FILE)
-	echo "variables.LUA_BINDIR = [[$(STAGING_DIR)/usr/bin]]"        >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables.LUA_INCDIR = [[$(STAGING_DIR)/usr/include]]"    >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables.LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]]"        >> $(LUAROCKS_CONFIG_FILE)
 	echo "variables.CC = [[$(TARGET_CC)]]"                          >> $(LUAROCKS_CONFIG_FILE)
