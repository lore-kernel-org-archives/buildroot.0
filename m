From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Aug 2016 07:39:33 +0300
Subject: [Buildroot] [PATCH] lirc-tools: enable for musl
Message-ID: <730163c3a1cee2a52aa6d5592c1a004c0aa5ef73.1471840773.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed use of the GLOB_BRACE glob(3) GNU extension in release 0.9.4
(commits 493857625 and 8bff82ed9c). See
https://sourceforge.net/p/lirc/tickets/174/.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lirc-tools/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index 60476b7935ac..6eaf8288179f 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIRC_TOOLS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
 	# dlopen()
 	depends on !BR2_STATIC_LIBS
 	help
@@ -19,7 +18,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 
 	  http://www.lirc.org/
 
-comment "lirc-tools needs a uClibc or glibc toolchain w/ threads, dynamic library, C++"
+comment "lirc-tools needs a toolchain w/ threads, dynamic library, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_MUSL
+		|| !BR2_INSTALL_LIBSTDCPP
-- 
2.8.1
