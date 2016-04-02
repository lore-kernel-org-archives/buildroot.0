From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  3 Apr 2016 00:08:56 +0300
Subject: [Buildroot] [PATCH] mosh: requires wchar
Message-ID: <643411e30b09c28f7d60cc2f2f7e932862fd3aef.1459631336.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/dc6/dc60afdf2b6035cd72567cf37b837db087c79bea/
http://autobuild.buildroot.net/results/624/624a1fcae9633940714ae4e8ad9864e9611e93ec/
http://autobuild.buildroot.net/results/e95/e95c8cff40c87f167f82e37430ebd1f37c8c242e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mosh/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 26f72339896a..b4189ee10dd6 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,6 +1,6 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,6 +9,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
-- 
2.8.0.rc3
