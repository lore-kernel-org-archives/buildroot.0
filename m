From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Jun 2015 09:09:39 -0300
Subject: [Buildroot] [PATCH] atf: needs mmu
Message-ID: <1434197379-23486-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/950/95069436dd5b2004e59851b8c731d534b86062a5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/atf/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/atf/Config.in b/package/atf/Config.in
index 59712ab..43a5d4f 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ATF
 	bool "atf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  ATF, or Automated Testing Framework, is a collection of
 	  libraries to write test programs in C, C++ and POSIX shell.
@@ -9,3 +10,4 @@ config BR2_PACKAGE_ATF
 
 comment "atf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
-- 
2.3.6
