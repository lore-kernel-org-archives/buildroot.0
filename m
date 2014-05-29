From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 May 2014 07:17:04 +0300
Subject: [Buildroot] [PATCH] thrift: disable for ARC
Message-ID: <e63eec000f13ac9865b58ab5efc736db87cb45d3.1401337024.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thrift uses the __sync_fetch_and_add() atomic primitive that is not available
for ARC.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/thrift/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index a7f3479982ed..ac998014bcc6 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc # atomic builtins
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -21,3 +22,4 @@ config BR2_PACKAGE_THRIFT
 comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_arc
-- 
2.0.0.rc2
