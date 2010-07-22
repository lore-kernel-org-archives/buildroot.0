From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] cgilua: tweak Config.in
Message-ID: <20100722110847.6B2C982DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc98b5b3572ca76a6c97f4d9669ce791e8ac1496
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Print a comment if largefile isn't available, and use select rather than
depends for the lua shared library option.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cgilua/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index aba4c24..a74e49f 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
 	depends on BR2_LARGEFILE
-	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	select BR2_PACKAGE_LUAFILESYSTEM
 	help
 	  CGILua is a tool for creating dynamic HTML pages
 	  and manipulating input data from Web forms.
 
 	  http://luaforge.net/projects/cgilua/
+
+comment "cgilua requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.7.1
