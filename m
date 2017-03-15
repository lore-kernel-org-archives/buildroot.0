From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Mar 2017 15:08:36 -0300
Subject: [Buildroot] [PATCH] mbedtls: security bump to verison 2.4.2
Message-ID: <20170315180836.29157-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2017-2784 - Freeing of memory allocated on stack when validating a
public key with a secp224k1 curve.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 5f9786c..70a0dc5 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,2 +1,2 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.3.0-2.1.5-and-1.3.17-released
-sha256	c1c3559ed39f7a1b1550c4cf4ccb918bf239301a3311d98dda92bed8a25b7f0d	mbedtls-2.4.0-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.4.2-2.1.7-and-1.3.19-released
+sha256	17dd98af7478aadacc480c7e4159e447353b5b2037c1b6d48ed4fd157fb1b018	mbedtls-2.4.2-apache.tgz
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 198879d..a571ed0 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.4.0
+MBEDTLS_VERSION = 2.4.2
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.10.2
