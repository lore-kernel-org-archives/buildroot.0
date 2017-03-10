From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:02:39 +0100
Subject: [Buildroot] [git commit] lua-messagepack: bump to version 0.5.0
Message-ID: <20170310210258.258568231C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d87b1e1d0b4e42e7d27c3ea3ec3b5296373b301
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

refactor with PKG_NAME_UPSTREAM

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-messagepack/lua-messagepack.hash | 4 ++--
 package/lua-messagepack/lua-messagepack.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 7da34e1..a2b0bd7 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a8aac195dc835101a025385b4c5b596de6602c4ced85e0df35b7f52e6aa6ee5d  lua-messagepack-0.4.0-1.src.rock
-sha256 85a3eef21e10eb6c3ebf584ce950610fc10457746a4b8dbcbcab4b626f7d3265  lua-messagepack-lua53-0.4.0-1.src.rock
+sha256 1d7a1cc16ee1e4c99ec213817bab2bf38e48a5b1646b88aa0d6ab4ed4e1aa207  lua-messagepack-0.5.0-1.src.rock
+sha256 1bed1efdddbc7f8adb0c37d0dc3d1fd77ce267f648fc75c08af523e3b6bed3fb  lua-messagepack-lua53-0.5.0-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 15fc182..ffcebca 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.4.0
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.0
+LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
+LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
 else
-LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
+LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack
 endif
 LUA_MESSAGEPACK_SUBDIR = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
 LUA_MESSAGEPACK_LICENSE = MIT
