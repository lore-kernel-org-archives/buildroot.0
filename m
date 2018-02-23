From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Feb 2018 06:56:11 +0200
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.7.0
Message-ID: <e096f49c1c72f1bbd299136397eac58fe385618f.1519361771.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2018-0487: Remote attackers can execute arbitrary code or cause a
denial of service (buffer overflow) via a crafted certificate chain that
is mishandled during RSASSA-PSS signature verification within a TLS or
DTLS session.

CVE-2018-0488: When the truncated HMAC extension and CBC are used,
allows remote attackers to execute arbitrary code or cause a denial of
service (heap corruption) via a crafted application packet within a TLS
or DTLS session.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index d04b8677540a..a62c0f58decf 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.6.0-2.1.9-and-1.3.21-released
-sha1	e914288da50977f541773f9d36e26f14926594a5	mbedtls-2.6.0-apache.tgz
-sha256	99bc9d4212d3d885eeb96273bcde8ecc649a481404b8d7ea7bb26397c9909687	mbedtls-2.6.0-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.7.0-2.1.10-and-1.3.22-released
+sha1	01ffebf679c8696cc941c41224fa73d8944d2c85	mbedtls-2.7.0-apache.tgz
+sha256	aeb66d6cd43aa1c79c145d15845c655627a7fc30d624148aaafbb6c36d7f55ef	mbedtls-2.7.0-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 64ce18cf6fe5..7c26ea95ee60 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.6.0
+MBEDTLS_VERSION = 2.7.0
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.16.1
