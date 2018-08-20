From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Aug 2018 18:55:54 +0200
Subject: [Buildroot] [PATCH 1/2] boost: revert
 b20c5ca3b8c5b180a6ee87556d0c87d474e86cde
Message-ID: <20180820165555.20492-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mutex is available on gcc <= 4.7.x, the issue is that boost does not
correctly detect it because -std=c++11 is missing

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 965d198ebf..beddc8280c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -83,7 +83,6 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  C++11 context switching library.
 
-- 
2.14.1
