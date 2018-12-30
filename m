From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:15:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/lua-msgpack-native: adjust
 Config.in comment
In-Reply-To: <20181230141512.12222-1-thomas.petazzoni@bootlin.com>
References: <20181230141512.12222-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181230141512.12222-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Config.in comment of lua-msgpack-native only indicates that it
needs Lua 5.1, while the package can actually build with LuaJIT. This
commit adjusts the comment to match the reality.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-msgpack-native/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 8b6283cc95..8af508dd95 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -7,6 +7,6 @@ config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 
 	  https://github.com/kengonakajima/lua-msgpack-native
 
-comment "lua-msgpack-native needs a Lua 5.1 interpreter"
+comment "lua-msgpack-native needs Lua 5.1 or LuaJIT"
 	depends on !BR2_PACKAGE_LUA_5_1
 	depends on !BR2_PACKAGE_LUAJIT
-- 
2.20.1
