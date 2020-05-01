From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Fri,  1 May 2020 18:51:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/qpdf: fix 'no such file' exeption
Message-ID: <20200501155139.4380-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/qpdf/qpdf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index ac703d716e..fd31140b0c 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -11,7 +11,7 @@ QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
-QPDF_CONF_OPTS = --without-random
+QPDF_CONF_OPTS = --with-random=/dev/urandom
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 QPDF_CONF_OPTS += --enable-crypto-gnutls
-- 
2.17.1
