From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Sep 2013 08:14:03 +0200
Subject: [Buildroot] [git commit] trivial: correct capitalization of Lua in
	Config.in files
Message-ID: <20130907061414.337B580474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f9b3824da896c223987cbbeba5e23538e42feaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Lua website says:
"Like most names, it should be written in lower case with an initial capital,
that is, "Lua". Please do not write it as "LUA", which is both ugly and
confusing, because then it becomes an acronym with different meanings for
different people."
http://www.lua.org/about.html

So, let's honor this request in buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in         |    2 +-
 package/dnsmasq/Config.in |    2 +-
 package/haserl/Config.in  |    4 ++--
 package/lua/Config.in     |    4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a94cb62..8ba3666 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -326,7 +326,7 @@ source "package/jimtcl/Config.in"
 source "package/lua/Config.in"
 source "package/luajit/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
-menu "LUA libraries/modules"
+menu "Lua libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index a6f5d96..a078145 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_DNSMASQ_LUA
 	bool "Lua scripting support"
 	select BR2_PACKAGE_LUA
 	help
-	  Enable lua scripting for dnsmasq
+	  Enable Lua scripting for dnsmasq
 
 config BR2_PACKAGE_DNSMASQ_CONNTRACK
 	bool "conntrack marking support"
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 2d5cacf..3db859a 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -9,12 +9,12 @@ config BR2_PACKAGE_HASERL
 	  http://haserl.sourceforge.net/
 
 config BR2_PACKAGE_HASERL_WITH_LUA
-	bool "lua support"
+	bool "Lua support"
 	depends on BR2_PACKAGE_HASERL
 	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
 	select BR2_PACKAGE_LUA
 	help
-	  Enable LUA support for haserl
+	  Enable Lua support for haserl
 
 choice
 	prompt "Haserl version"
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 4166730..8c05d08 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -21,13 +21,13 @@ config BR2_PACKAGE_LUA_INTERPRETER_READLINE
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_NCURSES
 	help
-	  Enables command-line editing in the lua interpreter.
+	  Enables command-line editing in the Lua interpreter.
 
 config BR2_PACKAGE_LUA_INTERPRETER_LINENOISE
 	bool "linenoise support"
 	select BR2_PACKAGE_LINENOISE
 	help
-	  Enables command-line editing in the lua interpreter.
+	  Enables command-line editing in the Lua interpreter.
 
 endchoice
 
