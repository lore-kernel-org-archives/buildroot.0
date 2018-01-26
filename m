From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 13:38:43 +0100
Subject: [Buildroot] [git commit] zbar: enable static build
Message-ID: <20180126124345.1012283CCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc4a6abfa6bbffeabefb9967dbf378c410fb6318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libv4l supports static build since commit f837251785e9 (package/libv4l:
allow build of v4l2 utilities on noMMU platforms).

Cc: Volkov Viacheslav <sv99@inbox.ru>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zbar/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index 5097f57..05c9b76 100644
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
