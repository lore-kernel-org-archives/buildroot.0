From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 12:51:08 +0200
Subject: [Buildroot] [git commit] wsapi: fix Lua 5.3 compatibility
Message-ID: <20170924104359.4787780FE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=551449bfc91cd69366db2840f19c8b403fce50f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: use git-formatted patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wsapi/0001-Lua-5.3-compatibility.patch | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/wsapi/0001-Lua-5.3-compatibility.patch b/package/wsapi/0001-Lua-5.3-compatibility.patch
new file mode 100644
index 0000000..d55c818
--- /dev/null
+++ b/package/wsapi/0001-Lua-5.3-compatibility.patch
@@ -0,0 +1,41 @@
+From 2d824d2fce31b6a9cc60b2c3f215fbbf1d99c611 Mon Sep 17 00:00:00 2001
+From: mpeterv <mpeterval@gmail.com>
+Date: Thu, 3 Dec 2015 13:10:14 +0300
+Subject: [PATCH] Lua 5.3 compatibility
+
+Fetched from: https://github.com/keplerproject/wsapi/commit/2d824d2fce31b6a9cc60b2c3f215fbbf1d99c611
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ src/wsapi/ringer.lua | 1 +
+ src/wsapi/util.lua   | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/wsapi/ringer.lua b/src/wsapi/ringer.lua
+index 58309f2..db7b68f 100644
+--- a/src/wsapi/ringer.lua
++++ b/src/wsapi/ringer.lua
+@@ -5,6 +5,7 @@ local rings = require "rings"
+ local _M = {}
+ 
+ local init = [==[
++  local loadstring = loadstring or load
+   local app_name, bootstrap_code, is_file = ...
+   if bootstrap_code then
+     local bootstrap, err
+diff --git a/src/wsapi/util.lua b/src/wsapi/util.lua
+index 24d3cfe..34e5816 100644
+--- a/src/wsapi/util.lua
++++ b/src/wsapi/util.lua
+@@ -174,7 +174,7 @@ function _M.make_env_post(pd, type, qs)
+ end
+ 
+ function _M.loadfile(filename, env)
+-  if _VERSION == "Lua 5.2" then
++  if _VERSION ~= "Lua 5.1" then
+     return loadfile(filename, "bt", env)
+   else
+     local f, err = loadfile(filename)
+-- 
+2.14.1
+
