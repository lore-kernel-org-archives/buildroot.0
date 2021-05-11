From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 11 May 2021 09:35:42 +0000
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.41.0-0
Message-ID: <20210511093542.428060-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable Lua 5.4 support which is fixed now.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luv/Config.in | 5 ++---
 package/luv/luv.hash  | 2 +-
 package/luv/luv.mk    | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/luv/Config.in b/package/luv/Config.in
index 3be204cab3..434cb3b459 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -4,14 +4,13 @@ config BR2_PACKAGE_LUV
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
-	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_LIBUV
 	help
 	  libuv bindings for LuaJIT and Lua.
 
 	  https://github.com/luvit/luv
 
-comment "luv needs a toolchain w/ NPTL, dynamic library, Lua <= 5.3"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
+comment "luv needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 58385cf4f4..a619db2c76 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  24473a081c3928eec2a352369cbafda97059574f4a4276861274473e7c7d17a0  luv-1.40.0-0.tar.gz
+sha256  4018f293d71c2d75757b64fcdacf982729c9dc8b0bf8eda4015a8818a5a29321  luv-1.41.0-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 08968c3f90..1a24a33bb2 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.40.0-0
+LUV_VERSION = 1.41.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.31.1
