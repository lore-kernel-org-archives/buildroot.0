From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:11:01 +0200
Subject: [Buildroot] [PATCH 1/1] mbedtls: security bump to version 2.7.3
Message-ID: <20180520081101.6039-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extract from release announcement:

- (2.9, 2.7, 2.1) Fixed an issue in the X.509 module which could lead
to a buffer overread during certificate validation. Additionally, the
issue could also lead to unnecessary callback checks being made or to
some validation checks to be omitted. The overread could be triggered
remotely, while the other issues would require a non DER-compliant
certificate to be correctly signed by a trusted CA, or a trusted CA with
a non DER-compliant certificate. Found by luocm. Fixes #825.

- (2.9, 2.7, 2.1) Fixed the buffer length assertion in the
ssl_parse_certificate_request() function which could lead to an
arbitrary overread of the message buffer. The overreads could be caused
by receiving a malformed algorithms section which was too short. In
builds with debug output, this overread data was output with the debug
data.

- (2.9, 2.7, 2.1) Fixed a client-side bug in the validation of the
server's ciphersuite choice which could potentially lead to the client
accepting a ciphersuite it didn't offer or a ciphersuite that could not
be used with the TLS or DTLS version chosen by the server. This could
lead to corruption of internal data structures for some configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index f5331bed15..16f03fb7d8 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.8.0-2.7.2-and-2.1.11-released
-sha1	e36d7cbdc2ed0a5d5659385840e8fbb4d351234e	mbedtls-2.7.2-apache.tgz
-sha256	fd38c2bb5fbe1ffd3e7fdcdd71130986f2010f25b3a5575eb8ded0dd3bc573d7	mbedtls-2.7.2-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.9.0-2.7.3-and-2.1.12-released
+sha1	8352f6713a9ee695f6f19e893c0e85941af71967	mbedtls-2.7.3-apache.tgz
+sha256	05282af7d95fedb2430c248ffe3081646800b8dae9071f8da11a07100963d765	mbedtls-2.7.3-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index ca44ee3713..e6012dcb3f 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.2
+MBEDTLS_VERSION = 2.7.3
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.14.1
