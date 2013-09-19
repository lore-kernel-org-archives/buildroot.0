From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:37:42 +0200
Subject: [Buildroot] [git commit] luaposix: fix runtime dependency
Message-ID: <20130919193857.E8D749B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04685e18cdf58c39d34024bb613a764ae87302ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luaposix/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 5829282..beae8e4 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA
+	# LuaBitOp is already included in LuaJIT
 	help
 	  luaposix is a POSIX binding, including curses, for Lua 5.1
 	  and 5.2; Like most libraries it simply binds to C APIs on
