From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:06:33 +0200
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.1.0
Message-ID: <20190501071329.488B27FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e084ed9fdbf5ada39c62d4852e1c62dcec5428e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/0001-allow-libluajit-detection.patch | 6 +++---
 package/luarocks/luarocks.hash                        | 2 +-
 package/luarocks/luarocks.mk                          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luarocks/0001-allow-libluajit-detection.patch b/package/luarocks/0001-allow-libluajit-detection.patch
index 05d025bba2..5a7bc3f57e 100644
--- a/package/luarocks/0001-allow-libluajit-detection.patch
+++ b/package/luarocks/0001-allow-libluajit-detection.patch
@@ -17,7 +17,7 @@ diff --git a/src/luarocks/deps.lua b/src/luarocks/deps.lua
 index 8403f12..c1c0220 100644
 --- a/src/luarocks/deps.lua
 +++ b/src/luarocks/deps.lua
-@@ -513,10 +513,8 @@ function deps.check_lua(vars)
+@@ -544,10 +544,8 @@ function deps.check_lua(vars)
        "lua-" .. cfg.lua_version,
        "lua-" .. shortv,
        "lua",
@@ -26,9 +26,9 @@ index 8403f12..c1c0220 100644
 -   if cfg.luajit_version then
 -      table.insert(libnames, 1, "luajit-" .. cfg.lua_version)
 -   end
+    local cache = {}
     for _, libname in ipairs(libnames) do
-       local ok = check_external_dependency("LUA", { library = libname }, vars, "build")
-       if ok then
+       local ok = check_external_dependency("LUA", { library = libname }, vars, "build", cache)
 -- 
 2.17.1
 
diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 224dbcc164..a0369516ee 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1236a307ca5c556c4fed9fdbd35a7e0e80ccf063024becc8c3bf212f37ff0edf  luarocks-3.0.4.tar.gz
+sha256 865eae1e49b0f701c955c1c8f7b6fae99287c9cef32227d64177509224908921  luarocks-3.1.0.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 5b15eae675..fc71ede074 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.0.4
+LUAROCKS_VERSION = 3.1.0
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
