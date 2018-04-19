From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:37:28 +0200
Subject: [Buildroot] [git commit] prosody: add dependency on shared libraries
Message-ID: <20180419213844.DD0287FB91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b948c2a32188ad38b820163b5b5f06ab15c8666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The prosody package uses several Lua packages that require shared libraries.
Therefore, prosody must require shared libraries too.

Fixes: http://autobuild.buildroot.net/results/b126bce0bbd111f021ed5be7c8773fef2a8f8579

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index ef26e2750b..133b0b1343 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PROSODY
 	bool "prosody"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
@@ -15,6 +16,6 @@ config BR2_PACKAGE_PROSODY
 
 	  https://prosody.im
 
-comment "prosody needs the lua interpreter"
-	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
+comment "prosody needs the lua interpreter, dynamic library"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
