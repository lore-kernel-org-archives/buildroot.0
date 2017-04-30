From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Apr 2017 21:33:18 +0300
Subject: [Buildroot] [PATCH] aircrack-ng: requires C++
Message-ID: <6863f849e68b9f2422f15fef9e815ac791b32c73.1493577198.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9b1/9b1cba480102746389e80b58c0e327b68a235a29/
http://autobuild.buildroot.net/results/f65/f65de186324e6c3cd689540a22fa46ae89afc8c8/
http://autobuild.buildroot.net/results/e02/e02e832a49972ba464f7749cb89d2b20b8df4484/

Cc: Laurent Cans <laurent.cans@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/aircrack-ng/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index b6572dc986c7..2164ad40703f 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	bool "aircrack-ng"
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
 	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
@@ -15,6 +16,6 @@ config BR2_PACKAGE_AIRCRACK_NG
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain w/ threads"
+comment "aircrack-ng needs a toolchain w/ threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.11.0
