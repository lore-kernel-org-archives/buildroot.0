From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 17:22:56 +0100
Subject: [Buildroot] [git commit] luarocks: never wraps script
Message-ID: <20140226163328.726FD9957B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29e583388fcc7f8c2171319061a1c860bb58c832
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this config prevents the introduction of some HOST_DIR paths on target

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
