From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:03:06 -0300
Subject: [Buildroot] [PATCH] libsigc: bump gcc version requirement to 4.8
Message-ID: <1476320586-12465-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It now uses C++11 features that aren't available in 4.7. Fixes:
http://autobuild.buildroot.net/results/405/40563404e2612590a6ad19cbb39df14074fe160e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigc/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index 41ea19e..f38749b 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSIGC
 	bool "libsigc++"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libsigc++ implements a typesafe callback system for standard C++.
@@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBSIGC
 
 	  http://libsigc.sourceforge.net/
 
-comment "libsigc++ needs a toolchain w/ C++, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "libsigc++ needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.7.3
