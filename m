From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:01 -0400
Subject: [Buildroot] [PATCH v2 01/14] libressl: add host variant
Message-ID: <20170731120815.5315-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a package can be compiled against libressl, the package can build against
a host variant as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added this patch to the beginning of this series.

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
