From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 Oct 2015 12:54:36 -0300
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.17
Message-ID: <1445010876-13077-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-5291 - Remote attack on clients using session tickets or SNI

Also includes countermeasures against Lenstra's RSA-CRT attach for
PKCS#1 v1.5 signatures (1.2.16) and the Logjam attack (1.2.15).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.hash | 4 ++--
 package/polarssl/polarssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index e7883fd..c203392 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,2 +1,2 @@
-# From https://polarssl.org/tech-updates/releases/polarssl-1.2.14-released
-sha256	d7cbd8314aa3a5441f6282d13d07df610f49b4bc678088b04188adf093d17d37	polarssl-1.2.14-gpl.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.1.2-and-1.3.14-and-polarssl-1.2.17-released
+sha256	9301d4ebec3eb45bc9f28f2d79bfdb0c3dd351c386aa6cc66643e1b2be274d52	polarssl-1.2.17-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 289a28d..aaa6759 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://tls.mbed.org/code/releases
-POLARSSL_VERSION = 1.2.14
+POLARSSL_VERSION = 1.2.17
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-- 
2.4.9
