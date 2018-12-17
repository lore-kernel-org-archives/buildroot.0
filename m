From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 09:56:06 +0100
Subject: [Buildroot] [git commit] package/wsapi: bump to version 1.7
Message-ID: <20181217085210.5E60B803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f916c83ea07d4875bc4fa7cf91d9aeb550da049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wsapi/0001-Lua-5.3-compatibility.patch | 41 --------------------------
 package/wsapi/wsapi.hash                       |  2 +-
 package/wsapi/wsapi.mk                         |  3 +-
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/wsapi/0001-Lua-5.3-compatibility.patch b/package/wsapi/0001-Lua-5.3-compatibility.patch
deleted file mode 100644
index 9165ef2b90..0000000000
--- a/package/wsapi/0001-Lua-5.3-compatibility.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2d824d2fce31b6a9cc60b2c3f215fbbf1d99c611 Mon Sep 17 00:00:00 2001
-From: mpeterv <mpeterval@gmail.com>
-Date: Thu, 3 Dec 2015 13:10:14 +0300
-Subject: [PATCH] Lua 5.3 compatibility
-
-Fetched from: https://github.com/keplerproject/wsapi/commit/2d824d2fce31b6a9cc60b2c3f215fbbf1d99c611
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- src/wsapi/ringer.lua | 1 +
- src/wsapi/util.lua   | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/wsapi-1.6.1/src/wsapi/ringer.lua b/wsapi-1.6.1/src/wsapi/ringer.lua
-index 58309f2..db7b68f 100644
---- a/wsapi-1.6.1/src/wsapi/ringer.lua
-+++ b/wsapi-1.6.1/src/wsapi/ringer.lua
-@@ -5,6 +5,7 @@ local rings = require "rings"
- local _M = {}
- 
- local init = [==[
-+  local loadstring = loadstring or load
-   local app_name, bootstrap_code, is_file = ...
-   if bootstrap_code then
-     local bootstrap, err
-diff --git a/wsapi-1.6.1/src/wsapi/util.lua b/wsapi-1.6.1/src/wsapi/util.lua
-index 24d3cfe..34e5816 100644
---- a/wsapi-1.6.1/src/wsapi/util.lua
-+++ b/wsapi-1.6.1/src/wsapi/util.lua
-@@ -174,7 +174,7 @@ function _M.make_env_post(pd, type, qs)
- end
- 
- function _M.loadfile(filename, env)
--  if _VERSION == "Lua 5.2" then
-+  if _VERSION ~= "Lua 5.1" then
-     return loadfile(filename, "bt", env)
-   else
-     local f, err = loadfile(filename)
--- 
-2.14.1
-
diff --git a/package/wsapi/wsapi.hash b/package/wsapi/wsapi.hash
index 3abbfc979a..b11e60b0a2 100644
--- a/package/wsapi/wsapi.hash
+++ b/package/wsapi/wsapi.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 f7f1b0ddc68c257965c42ac7155904d8ff7c2b7256f65ef1b82fda0039137d61 wsapi-1.6.1-1.src.rock
+sha256 1a0829dffd6bdbf99f5c4278d504cda5ede9344d5089bdcf5216c9eb2999ae22  wsapi-1.7-1.src.rock
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 64a27579f2..76d2d88fee 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.6.1-1
+WSAPI_VERSION = 1.7-1
+WSAPI_SUBDIR = wsapi
 WSAPI_LICENSE = MIT
 WSAPI_LICENSE_FILES = $(WSAPI_SUBDIR)/doc/us/license.html
 
