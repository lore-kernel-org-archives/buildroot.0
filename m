From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] lua: only install headers if
	BR2_HAVE_DEVFILES is enabled
Message-ID: <20091003210637.22913776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d1bce5051b7220ac14d5ba55ee6fb7fd96f62585
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index f80f28b..aeb6c82 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -55,7 +55,7 @@ $(TARGET_DIR)/usr/bin/luac: $(STAGING_DIR)/usr/bin/luac
 
 lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
 
-lua-libs:	$(TARGET_DIR)/usr/lib/liblua.a
+lua-libs: $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/liblua.a)
 
 lua: readline ncurses lua-bins lua-libs
 
-- 
1.6.3.3
