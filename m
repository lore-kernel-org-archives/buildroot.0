From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:26:56 +0100
Subject: [Buildroot] [git commit] lutok: move to Lua libraries menu
Message-ID: <20170302212702.F26A57FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a91952ccb25b02822e3fe9126981140337465252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this package really is a Lua extension, it fits under the Lua
libraries menu.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       | 2 +-
 package/lutok/Config.in | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 921a06c..17f2f75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -560,6 +560,7 @@ menu "Lua libraries/modules"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
 	source "package/lunit/Config.in"
+	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
 	source "package/lzlib/Config.in"
@@ -570,7 +571,6 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
-	source "package/lutok/Config.in"
 	source "package/micropython/Config.in"
 	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
diff --git a/package/lutok/Config.in b/package/lutok/Config.in
index d6c87cf..ab9c32b 100644
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
