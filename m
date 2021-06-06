From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Jun 2021 09:59:32 +0200
Subject: [Buildroot] [PATCH/next] package/freerdp: needs rc4 from libopenssl
Message-ID: <20210606075932.1242642-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/b21b21a66bef2bc09231e475037a8f9be5584fa4/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 5705ce0e0c..14c5f98671 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGLIB2
 	help
-- 
2.25.1
