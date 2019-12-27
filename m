From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 15:43:24 +0100
Subject: [Buildroot] [PATCH 3/3] package/libnspr: remove
 BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
In-Reply-To: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
References: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191227144324.84759-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since all architectures supported by Buildroot are supported by libnspr
BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT makes no sense anymore, so let's remove
it all around.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ecryptfs-utils/Config.in | 2 --
 package/libnspr/Config.in        | 7 -------
 package/libnss/Config.in         | 2 --
 package/spidermonkey/Config.in   | 1 -
 4 files changed, 12 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 0c39f48d08..08210f05eb 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
 	select BR2_PACKAGE_KEYUTILS
@@ -29,7 +28,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  http://ecryptfs.org
 
 comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index c1be7151e0..de8dd0a06b 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,8 +1,3 @@
-config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-	def_bool y
-
-if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
-
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -17,5 +12,3 @@ config BR2_PACKAGE_LIBNSPR
 
 comment "libnspr needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-endif
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 599c9a6536..90bf75f476 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBNSS
 	bool "libnss"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
@@ -16,5 +15,4 @@ config BR2_PACKAGE_LIBNSS
 	  http://www.mozilla.org/projects/security/pki/nss/
 
 comment "libnss needs a toolchain w/ threads, dynamic library"
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
index 5f12110626..150b941c94 100644
--- a/package/spidermonkey/Config.in
+++ b/package/spidermonkey/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2_sh4a
 	default y if BR2_sparc || BR2_sparc64
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 
 config BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS
 	bool
-- 
2.20.1
