From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:24:47 +0200
Subject: [Buildroot] [git commit branch/next] package/lua-compat53: depends
 on lua ABI 5.1
Message-ID: <20200808162412.1775E814FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=507a3304ab1787364d6a7051d55a7766185d48c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the introduction of Lua 5.4, we need to adjust the
dependency of the lua-compat53 package: it only makes sense when a Lua
5.1-compatible interpreter is available (either Lua 5.1 or LuaJIT). We
use the recently introduced BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
symbol to achieve this.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-compat53/Config.in | 2 +-
 package/lua-http/Config.in     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-compat53/Config.in b/package/lua-compat53/Config.in
index 76c5b3fd71..de468fcf66 100644
--- a/package/lua-compat53/Config.in
+++ b/package/lua-compat53/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_COMPAT53
 	bool "lua-compat53"
-	depends on !BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	help
 	  Compatibility module providing Lua-5.3-style APIs for Lua 5.2
 	  and 5.1.
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index cbf71563b0..8eefd481b5 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUA_HTTP
 	select BR2_PACKAGE_LPEG # runtime
 	select BR2_PACKAGE_LUA_BASEXX # runtime
 	select BR2_PACKAGE_LUA_BINARYHEAP # runtime
-	select BR2_PACKAGE_LUA_COMPAT53 if !BR2_PACKAGE_LUA_5_3 # runtime
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	select BR2_PACKAGE_LUA_CQUEUES # runtime
 	select BR2_PACKAGE_LUA_FIFO # runtime
 	select BR2_PACKAGE_LUA_LPEG_PATTERNS # runtime
