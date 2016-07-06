From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:05:03 +0200
Subject: [Buildroot] [git commit] tekui: add missing dependency on dynamic
	library
Message-ID: <20160706190517.0CA0C8182E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e011f45bbc4e0a922cced2cf3d579e3411a71e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tekui selects a bunch of Lua modules, which are only available when
!BR2_STATIC_LIBS, so add this missing dependency.

Fixes:

   http://autobuild.buildroot.net/results/0c8ae60a7c0dfb64ee12d557b1660a4a1fc84703/

While we're at it, use the lower-case name of the package in the
Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tekui/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tekui/Config.in b/package/tekui/Config.in
index 998c25a..244b18b 100644
--- a/package/tekui/Config.in
+++ b/package/tekui/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TEKUI
 	select BR2_PACKAGE_LUAEXPAT		# runtime only
 	select BR2_PACKAGE_LUASOCKET		# runtime only
 	select BR2_PACKAGE_LUAPOSIX		# runtime only
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -15,5 +16,6 @@ config BR2_PACKAGE_TEKUI
 
 	  http://tekui.neoscientists.org/
 
-comment "TekUI needs a Lua interpreter and a toolchain w/ threads"
-	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || !BR2_TOOLCHAIN_HAS_THREADS
+comment "tekui needs a Lua interpreter and a toolchain w/ threads, dynamic library"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || !BR2_TOOLCHAIN_HAS_THREADS ||
+		BR2_STATIC_LIBS
