From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 Sep 2018 20:43:50 +0200
Subject: [Buildroot] [PATCH 1/1] botan: needs std::future
Message-ID: <20180907184350.7272-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d63f70340d1297ad96c20144e658f0e4587a90ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 6fe818bc6d..3632a1a1c2 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	help
 	  Botan is a crypto library for C++
 
@@ -20,3 +21,7 @@ comment "botan needs a toolchain w/ C++, threads, gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+
+comment "botan needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.17.1
