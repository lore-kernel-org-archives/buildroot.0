From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:12:51 +0100
Subject: [Buildroot] [git commit branch/2018.02.x]
 package/lua-msgpack-native: adjust Config.in comment
Message-ID: <20190124101252.4E3818E313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39d4c7c4a48c8f79961e76d5d955a7c6ff5a6769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The Config.in comment of lua-msgpack-native only indicates that it
needs Lua 5.1, while the package can actually build with LuaJIT. This
commit adjusts the comment to match the reality.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61415067604f6c2bf381b39597946bcaf0844f33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-msgpack-native/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 3837228fa0..ad2772fb3d 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -8,6 +8,6 @@ config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 
 	  https://github.com/kengonakajima/lua-msgpack-native
 
-comment "lua-msgpack-native needs a Lua 5.1 interpreter"
+comment "lua-msgpack-native needs Lua 5.1 or LuaJIT"
 	depends on !BR2_PACKAGE_LUA_5_1
 	depends on !BR2_PACKAGE_LUAJIT
