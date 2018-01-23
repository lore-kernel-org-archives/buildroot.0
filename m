From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 23 Jan 2018 14:43:45 +0200
Subject: [Buildroot] [PATCH 2/2] zbar: enable static build
In-Reply-To: <f8d109392a311962340e48caaa33bac6b604c3a7.1516711425.git.baruch@tkos.co.il>
References: <f8d109392a311962340e48caaa33bac6b604c3a7.1516711425.git.baruch@tkos.co.il>
Message-ID: <6492a96c0f960314ba68459a9a99174c222327cc.1516711425.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libv4l supports static build since commit f837251785e9 (package/libv4l:
allow build of v4l2 utilities on noMMU platforms).

Cc: Volkov Viacheslav <sv99@inbox.ru>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zbar/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index 5097f5743913..05c9b769ceed 100644
--- a/package/zbar/Config.in
+++ b/package/zbar/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ZBAR
 	bool "zbar"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
 	depends on BR2_USE_MMU # libv4l
-	depends on !BR2_STATIC_LIBS # libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # libv4l
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
 	select BR2_PACKAGE_JPEG
@@ -12,7 +11,7 @@ config BR2_PACKAGE_ZBAR
 
 	  http://zbar.sourceforge.net/
 
-comment "zbar needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
2.15.1
