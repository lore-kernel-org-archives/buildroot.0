From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 23 Feb 2018 18:50:37 +0100
Subject: [Buildroot] [PATCH 1/1] azmq: add NPTL dependency
Message-ID: <20180223175037.7555-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost-log depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL so add this
dependency to azmq

Fixes:
 - http://autobuild.buildroot.net/results/ffa5f21d7e7c38ea7adebc84f1cc8ee4cff74f1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix error in subject (NPTL instead of NTPL)

 package/azmq/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 422a058832..eeafa2ad6d 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_AZMQ
 	bool "azmq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
@@ -20,9 +20,9 @@ config BR2_PACKAGE_AZMQ
 
 	  https://github.com/zeromq/azmq
 
-comment "azmq needs a toolchain w/ C++11, wchar and threads"
+comment "azmq needs a toolchain w/ C++11, wchar and NTPL"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
 comment "azmq needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.14.1
