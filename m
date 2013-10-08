From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 08 Oct 2013 09:08:21 +0800
Subject: [Buildroot] [PATCH] icu: needs threads
Message-ID: <1381194501.18210.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ae7/ae721db2dd4e764a2af3825c388a63cad9720ebe/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/icu/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 21f5c2f..d4f4207 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  International Components for Unicode.
 
 	  http://site.icu-project.org/
 
-comment "icu requires a toolchain with C++ support and WCHAR enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "icu requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
