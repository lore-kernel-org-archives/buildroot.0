From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:31 -0000
Subject: [Buildroot] [git commit] package/lua-messagepack: add support of
 Lua 5.4
Message-ID: <20200902161633.689C28752B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c0fd3cd64ff17208499352e584a6b31f32baa1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to use lua-MessagePack-lua53 for both Lua 5.3 and Lua 5.4.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-messagepack/lua-messagepack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index f393a8d028..33d460b4fc 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -6,7 +6,7 @@
 
 LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.2
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
 else
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack
