From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Feb 2020 19:26:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.37
Message-ID: <20200203182618.2274684-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump gcc requirement to gcc >= 7 as C++17 is mandatory since
https://github.com/MusicPlayerDaemon/ncmpc/commit/85f136dd6b6a8d044b19cbef818ee360292cc06e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/Config.in  | 6 +++---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 2122bf3543..0e062460a7 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBMPDCLIENT
@@ -16,7 +16,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 6"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 2a8533a2ee..963c6d2601 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 4632873dfc8efe61e501dc9184a5b921b482be2ddbedd3d23d05241d477a3e2c  ncmpc-0.36.tar.xz
+sha256 7c8eb727f6e12d8f97a53915b1b5632898b4afb335a1121c5e01c81df695615c  ncmpc-0.37.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 86e3c8383f..29675f2256 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).36
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).37
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
-- 
2.24.1
