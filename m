From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 13:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/vtun: requires blowfish support in
 openssl
Message-ID: <20210612114954.52566-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable blowfish in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/38f6b92ead5861c2e15ca768acea9742ad4e0fec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vtun/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index d63e7c76ef..bf399c0709 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VTUN
 	bool "vtun"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-- 
2.30.2
