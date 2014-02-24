From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:39 +0100
Subject: [Buildroot] [PATCH 03/24] luarocks: never wraps script
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this config prevents the introduction of some HOST_DIR paths on target

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 88ab22a..86e57d2 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -37,6 +37,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
 	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
+	echo "wrap_bin_scripts = false"                         >> $(LUAROCKS_CONFIG_FILE)
 endef
 
 $(eval $(host-generic-package))
-- 
1.7.9.5
