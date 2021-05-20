From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 May 2021 21:45:23 +0200
Subject: [Buildroot] [git commit] package/assimp: depends on libzlib
Message-ID: <20210520191635.9A5E58889C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f11388f4e60df88ffb210079f412736160474a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

assimp doesn't build with zlib-ng because Z_EXPORT and z_crc_t are used
by the bundled unzip source code

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/assimp/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 42bfee945d..c535240efc 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
@@ -13,4 +13,8 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++, wchar"
+	depends on BR2_PACKAGE_LIBZLIB
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+comment "assimp needs libzlib"
+	depends on !BR2_PACKAGE_LIBZLIB
