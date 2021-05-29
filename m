From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 May 2021 19:16:48 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/boost: disable logs with
 riscv32"
Message-ID: <20210529171649.2843578-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit d72350e62a0833e4d1527f4040da2063972bf9b3.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/azmq/Config.in  | 3 ---
 package/boost/Config.in | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 6751d533a4..37131a260a 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_AZMQ
 	bool "azmq"
-	depends on !BR2_RISCV_32 # boost-log
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
@@ -23,11 +22,9 @@ config BR2_PACKAGE_AZMQ
 	  https://github.com/zeromq/azmq
 
 comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
 comment "azmq needs exception_ptr"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 75bb81600a..3e96e1ede3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -240,7 +240,6 @@ comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
@@ -254,12 +253,10 @@ config BR2_PACKAGE_BOOST_LOG
 	  Logging library.
 
 comment "boost-log needs a toolchain w/ NPTL"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_MATH
-- 
2.30.2
