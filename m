From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 14:24:37 +0200
Subject: [Buildroot] [git commit] package/assimp: needs wchar
Message-ID: <20190804122351.B772B8DEF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf65070365ab55664f12ffe85cae548d6b0f63da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d989f895efe05dd5d1e2594d2dc38e9fc476e0d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 630758f3e7..42bfee945d 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_ZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
@@ -11,5 +12,5 @@ config BR2_PACKAGE_ASSIMP
 
 	  http://www.assimp.org
 
-comment "assimp needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "assimp needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
