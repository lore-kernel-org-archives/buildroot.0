From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:21 +0100
Subject: [Buildroot] [PATCH 4/7] package/civetweb: fix build error on a host
	with make v4.0
In-Reply-To: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425028764-1146-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix a typo that on a system with make v4.0 and
BR2_CIVETWEB_WITH_LUA=y fails to build:
  Makefile:203: *** mixed implicit and normal rules.  Stop.

The patch was not sent upstream because this problem is already fixed on
master.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...ua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch

diff --git a/package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch b/package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch
new file mode 100644
index 0000000..aee3cfc
--- /dev/null
+++ b/package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch
@@ -0,0 +1,27 @@
+From 0821066f9adf8410891cd07684ecac50a9bc36a4 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail>
+Date: Wed, 25 Feb 2015 18:40:24 +0100
+Subject: [PATCH] Lua: fix a typo changing %(LFS_DIR) to $(LFS_DIR)
+
+Also this fix a error on GNU Make v4.0:
+  Makefile:203: *** mixed implicit and normal rules.  Stop.
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail>
+---
+ resources/Makefile.in-lua | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/resources/Makefile.in-lua b/resources/Makefile.in-lua
+index 0902f11..f3d95fd 100644
+--- a/resources/Makefile.in-lua
++++ b/resources/Makefile.in-lua
+@@ -57,5 +57,5 @@ LFS_CFLAGS = -I$(LFS_DIR)
+ 
+ OBJECTS += $(LUA_OBJECTS) $(SQLITE_OBJECTS) $(LFS_OBJECTS)
+ CFLAGS += $(LUA_CFLAGS) $(SQLITE_CFLAGS) $(LFS_CFLAGS) -DUSE_LUA -DUSE_LUA_SQLITE3 -DUSE_LUA_FILE_SYSTEM
+-SOURCE_DIRS = $(LUA_DIR) $(SQLITE_DIR) %(LFS_DIR)
++SOURCE_DIRS = $(LUA_DIR) $(SQLITE_DIR) $(LFS_DIR)
+ 
+-- 
+2.3.0
+
-- 
2.3.0
