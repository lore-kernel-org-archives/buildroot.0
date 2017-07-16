From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 16 Jul 2017 12:21:52 -0400
Subject: [Buildroot] [PATCH 1/1] libressl: add host variant
Message-ID: <20170716162152.5137-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a package can be compiled against libressl, the package can build
against a host variant as well.

We shouldn't be mixing OpenSSL and LibreSSL either, and forcing the
user to download and build OpenSSL when they selected LibreSSL causes
confusion and could potentially break things.

Let users who want to use LibreSSL use LibreSSL, and users who want
to use OpenSSL use OpenSSL.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/libressl/libressl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ccd236d29..a4d4098f4 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -18,3 +18,4 @@ LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.13.3
