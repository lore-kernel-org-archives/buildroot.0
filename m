From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 08:19:50 -0300
Subject: [Buildroot] [PATCH 1/6] gtest: needs mmu
Message-ID: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ed2026b98d0cdded8d8ee4d5c86823142a5bdab9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index c50b5f7..5c065d6 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
 	  platforms (Linux, Mac OS X, Windows, Cygwin, Windows CE, and
-- 
1.8.1.5
