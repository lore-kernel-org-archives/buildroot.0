From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:31 +0200
Subject: [Buildroot] [PATCH 8/9] wsapi: fix Lua 5.3 compatibility
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi/0001-lua-5.3-compatibility.patch | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/wsapi/0001-lua-5.3-compatibility.patch

diff --git a/package/wsapi/0001-lua-5.3-compatibility.patch b/package/wsapi/0001-lua-5.3-compatibility.patch
new file mode 100644
index 000000000..31b532736
--- /dev/null
+++ b/package/wsapi/0001-lua-5.3-compatibility.patch
@@ -0,0 +1,31 @@
+Lua 5.3 compatibility
+
+Fetch from: https://github.com/keplerproject/wsapi/commit/2d824d2fce31b6a9cc60b2c3f215fbbf1d99c611
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/wsapi-1.6.1/src/wsapi/ringer.lua
+===================================================================
+--- a/wsapi-1.6.1/src/wsapi/ringer.lua
++++ b/wsapi-1.6.1/src/wsapi/ringer.lua
+@@ -5,6 +5,7 @@
+ local _M = {}
+ 
+ local init = [==[
++  local loadstring = loadstring or load
+   local app_name, bootstrap_code, is_file = ...
+   if bootstrap_code then
+     local bootstrap, err
+Index: b/wsapi-1.6.1/src/wsapi/util.lua
+===================================================================
+--- a/wsapi-1.6.1/src/wsapi/util.lua
++++ b/wsapi-1.6.1/src/wsapi/util.lua
+@@ -174,7 +174,7 @@
+ end
+ 
+ function _M.loadfile(filename, env)
+-  if _VERSION == "Lua 5.2" then
++  if _VERSION ~= "Lua 5.1" then
+     return loadfile(filename, "bt", env)
+   else
+     local f, err = loadfile(filename)
-- 
2.11.0
