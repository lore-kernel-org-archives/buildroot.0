From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 15:21:39 +0200
Subject: [Buildroot] [PATCH v3 02/10] package/lua-compat53: depends on lua
 ABI 5.1
In-Reply-To: <20200728132147.3155274-1-francois.perrad@gadz.org>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
Message-ID: <20200728132147.3155274-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-compat53/Config.in | 2 +-
 package/lua-http/Config.in     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-compat53/Config.in b/package/lua-compat53/Config.in
index 76c5b3fd7..de468fcf6 100644
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
index cbf71563b..8eefd481b 100644
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
-- 
2.25.1
