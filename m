From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Nov 2015 16:30:46 -0300
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.18
Message-ID: <1447356646-19912-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a potential heap corruption on Windows when
mbedtls_x509_crt_parse_path() is passed a path longer than 2GB. This
cannot be triggered remotely. Found by Guido Vranken, Intelworks.

Fixes a potential buffer overflow in some asn1_write_xxx() functions.
This cannot be triggered remotely unless you create X.509 certificates
based on untrusted input or write keys of untrusted origin. Found by
Guido Vranken, Intelworks.

The X509 max_pathlen constraint was not enforced on intermediate
certificates. Found by Nicholas Wilson, and fix and tests provided by
Janos Follath.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.hash | 4 ++--
 package/polarssl/polarssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index c203392..71f7c29 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,2 +1,2 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.1.2-and-1.3.14-and-polarssl-1.2.17-released
-sha256	9301d4ebec3eb45bc9f28f2d79bfdb0c3dd351c386aa6cc66643e1b2be274d52	polarssl-1.2.17-gpl.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.2.0-2.1.3-1.3.15-and-polarssl.1.2.18-released
+sha256	63c4ed4d9f6a241088e2287958f265403f874248d6a98b98f27cd3aa2f90f030	polarssl-1.2.18-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index aaa6759..c589ec7 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://tls.mbed.org/code/releases
-POLARSSL_VERSION = 1.2.17
+POLARSSL_VERSION = 1.2.18
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-- 
2.4.10
