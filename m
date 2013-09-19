From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 19 Sep 2013 08:31:38 +0200
Subject: [Buildroot] [PATCH 1/2] luaposix: fix runtime dependency
Message-ID: <1379572299-8191-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 412e07f..598bf11 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
+	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA
+	# LuaBitOp is already included in LuaJIT
 	help
 	  luaposix is a POSIX binding, including curses, for Lua 5.1
 	  and 5.2; Like most libraries it simply binds to C APIs on
-- 
1.7.9.5
