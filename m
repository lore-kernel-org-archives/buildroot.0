From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Mar 2015 19:14:54 +0100
Subject: [Buildroot] [git commit] ljlinenoise: remove dependency on some
	architecture
Message-ID: <20150323181457.70C2F807E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c967551b4ccc5f1041b865102912031347d3d2ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ljsyscall is available for all arch supported by LuaJIT.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ljlinenoise/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index 17be1be..be83bdb 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_LJLINENOISE
 	select BR2_PACKAGE_LJSYSCALL
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
-	# ljsyscall is only available for some target architectures
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
 	help
 	  ljlinenoise is a pure LuaJIT port of linenoise,
 	  a small alternative to readline and libedit.
@@ -14,4 +12,3 @@ config BR2_PACKAGE_LJLINENOISE
 
 comment "ljlinenoise needs LuaJIT"
 	depends on !BR2_PACKAGE_LUAJIT
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
