From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Dec 2018 20:36:35 +1030
Subject: [Buildroot] [PATCH] libopenssl: Use HTTPS for URL
Message-ID: <20181210100635.7611-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host forces HTTPS regardless. This can be seen in the build logs:

 >>> host-libopenssl 1.0.2q Downloading
 URL transformed to HTTPS due to an HSTS policy
 --2018-12-10 09:53:27--  https://www.openssl.org/source/openssl-1.0.2q.tar.gz

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index ca0521b2291e..dc15abf66a08 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBOPENSSL_VERSION = 1.0.2q
-LIBOPENSSL_SITE = http://www.openssl.org/source
+LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
 LIBOPENSSL_LICENSE_FILES = LICENSE
-- 
2.19.1
