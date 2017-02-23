From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:23 +0100
Subject: [Buildroot] [PATCH 01/25] lutok: move to Lua libraries menu
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since this package really is a Lua extension, it fits under the Lua
libraries menu.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
The original patch had lutok before the Lua libraries menu, which is
also not appropriate. Thomas moved it to after the menu while
committing. It's not clear to me why Thomas didn't move it inside the
menu instead.
---
 package/Config.in       | 2 +-
 package/lutok/Config.in | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e6dbe5822e..69e068b6d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -557,6 +557,7 @@ menu "Lua libraries/modules"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
 	source "package/lunit/Config.in"
+	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
 	source "package/lzlib/Config.in"
@@ -567,7 +568,6 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
-	source "package/lutok/Config.in"
 	source "package/micropython/Config.in"
 	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
diff --git a/package/lutok/Config.in b/package/lutok/Config.in
index d6c87cf586..ab9c32b6d5 100644
--- a/package/lutok/Config.in
+++ b/package/lutok/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUTOK
 	bool "lutok"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUAJIT
 	help
 	  Lutok is a lightweight C++ API library for Lua.
-- 
2.11.0
