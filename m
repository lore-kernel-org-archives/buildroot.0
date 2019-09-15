From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:42:39 +0200
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.2.1
Message-ID: <20190915135020.2F6038E39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41278d88e317ecd0adfc33f882d34f0b3142cba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/0001-allow-libluajit-detection.patch | 12 ++++++------
 package/luarocks/luarocks.hash                        |  2 +-
 package/luarocks/luarocks.mk                          |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/luarocks/0001-allow-libluajit-detection.patch b/package/luarocks/0001-allow-libluajit-detection.patch
index 5a7bc3f57e..e0ff85d409 100644
--- a/package/luarocks/0001-allow-libluajit-detection.patch
+++ b/package/luarocks/0001-allow-libluajit-detection.patch
@@ -1,6 +1,6 @@
-From 961269271134e711bcfffebb0f179ffddcbf3d5a Mon Sep 17 00:00:00 2001
+From fedd1259e47a6f6cb97bce8c9bf31eeb261b93be Mon Sep 17 00:00:00 2001
 From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 29 Jul 2018 11:17:34 +0200
+Date: Sat, 27 Jul 2019 15:26:26 +0200
 Subject: [PATCH] allow libluajit detection
 
 This detection was done only if luarocks is runned by luajit.
@@ -14,21 +14,21 @@ Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/src/luarocks/deps.lua b/src/luarocks/deps.lua
-index 8403f12..c1c0220 100644
+index cb85764..02cdda6 100644
 --- a/src/luarocks/deps.lua
 +++ b/src/luarocks/deps.lua
-@@ -544,10 +544,8 @@ function deps.check_lua(vars)
+@@ -555,10 +555,8 @@ function deps.check_lua_libdir(vars)
        "lua-" .. cfg.lua_version,
        "lua-" .. shortv,
        "lua",
 +      "luajit-" .. cfg.lua_version,
     }
--   if cfg.luajit_version then
+-   if ljv then
 -      table.insert(libnames, 1, "luajit-" .. cfg.lua_version)
 -   end
     local cache = {}
     for _, libname in ipairs(libnames) do
        local ok = check_external_dependency("LUA", { library = libname }, vars, "build", cache)
 -- 
-2.17.1
+2.20.1
 
diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 0e65659c48..3bcd22fbe6 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c573435f495aac159e34eaa0a3847172a2298eb6295fcdc35d565f9f9b990513  luarocks-3.1.3.tar.gz
+sha256 f27e20c9cdb3ffb991ccdb85796c36a0690566676f8e1a59b0d0ee6598907d04  luarocks-3.2.1.tar.gz
 sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index d7d0e4077c..4505612280 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.1.3
+LUAROCKS_VERSION = 3.2.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
