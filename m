From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Sep 2017 22:05:26 +0300
Subject: [Buildroot] [PATCH 2/2] mbedtls: security bump to version 2.6.0
In-Reply-To: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
References: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
Message-ID: <4340454882827bf3f55e05edde6241878a072857.1504638326.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-14032: authentication bypass.

https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2017-02

Add license hash.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mbedtls/mbedtls.hash | 7 +++++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 70a0dc506d93..d04b8677540a 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,2 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.4.2-2.1.7-and-1.3.19-released
-sha256	17dd98af7478aadacc480c7e4159e447353b5b2037c1b6d48ed4fd157fb1b018	mbedtls-2.4.2-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.6.0-2.1.9-and-1.3.21-released
+sha1	e914288da50977f541773f9d36e26f14926594a5	mbedtls-2.6.0-apache.tgz
+sha256	99bc9d4212d3d885eeb96273bcde8ecc649a481404b8d7ea7bb26397c9909687	mbedtls-2.6.0-apache.tgz
+# Locally calculated
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index a571ed0e52f1..64ce18cf6fe5 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.4.2
+MBEDTLS_VERSION = 2.6.0
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.14.1
