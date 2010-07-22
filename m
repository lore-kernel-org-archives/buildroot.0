From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] xavante: needs largefile
	support (for luafilesystem)
Message-ID: <20100722110847.8975C82DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8330dd11e7caebbafea5e6e9e3c702d6cd5843b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And at the same time use select for the lua shared library dependency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xavante/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index 7a3535a..a1b47c3 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
-	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	depends on BR2_LARGEFILE # luafilesystem
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	select BR2_PACKAGE_CGILUA
 	select BR2_PACKAGE_COPAS
 	select BR2_PACKAGE_COXPCALL
@@ -12,3 +13,6 @@ config BR2_PACKAGE_XAVANTE
 	  architecture based on URI mapped handlers.
 
 	  http://keplerproject.github.com/xavante/
+
+comment "xavante requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.7.1
