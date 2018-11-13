From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Nov 2018 21:59:08 +0200
Subject: [Buildroot] [PATCH] libnftnl: drop useless BR2_PACKAGE_LIBNFTNL_XML
Message-ID: <d8767e3da1e02d6a5f1770bf490028b1bab13e46.1542139148.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit fa0d1ebff99 (libnftnl: bump to version 1.0.9) removed the mxml
dependency. Remove the redundant BR2_PACKAGE_LIBNFTNL_XML config symbol
as well.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnftnl/Config.in | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index d4c9a1bb54e3..65390011a983 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -22,13 +22,6 @@ config BR2_PACKAGE_LIBNFTNL_JSON
 	help
 	  Enable JSON parsing support
 
-config BR2_PACKAGE_LIBNFTNL_XML
-	bool "enable XML support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_MXML
-	help
-	  Enable XML parsing support
-
 comment "libnftnl XML parsing support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
2.19.1
