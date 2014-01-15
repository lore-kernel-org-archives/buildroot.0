From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 13:12:47 +0100
Subject: [Buildroot] [git commit] luarocks: use -fPIC for shared library
Message-ID: <20140115121759.6A8969C4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a33152bae51899355a1218e03c73917fec8b3d87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f28a624f89f4de249a1b7a718f5ae31109ba9171/
http://autobuild.buildroot.net/results/1ead0a162a251d3e7bf8598036fa06c4befeb3d9/
http://autobuild.buildroot.net/results/0544cead086ba51b45dfa1df114787a8f22eaf8d/
http://autobuild.buildroot.net/results/60161d13d596d41dd4059977eb947d72c172f0d5/
http://autobuild.buildroot.net/results/e7e/e7ea6946552f72dc27f23ae1aff1665a6aa097c7/

[Peter: adjust commit message]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 85b6866..6cfd92e 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -31,7 +31,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
-	echo "   CFLAGS = [[$(TARGET_CFLAGS)]],"                >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CFLAGS = [[$(TARGET_CFLAGS) -fPIC]],"          >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
