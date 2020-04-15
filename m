From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:42:43 +0200
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.16.6
Message-ID: <20200415193448.C206A8ECD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5704f8869dc1f82790816e38de52aac6d709ffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2020-10932: fix side channel in ECC code that allowed an
  adversary with access to precise enough timing and memory access
  information (typically an untrusted operating system attacking a
  secure enclave) to fully recover an ECDSA private key.
- Fix a potentially remotely exploitable buffer overread in a DTLS
  client when parsing the Hello Verify Request message.
- Fix bug in DTLS handling of new associations with the same parameters
  (RFC 6347 section 4.2.8): after sending its HelloVerifyRequest, the
  server would end up with corrupted state and only send invalid records
  to the client. An attacker able to send forged UDP packets to the
  server could use that to obtain a Denial of Service. This could only
  happen when MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE was enabled in
  config.h (which it is by default).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 92e7d35a64..17ac18bb25 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.5-and-2.7.14-released
-sha1  c36962183e05467aa1dadafcaacf90216a737866  mbedtls-2.16.5-apache.tgz
-sha256  65b4c6cec83e048fd1c675e9a29a394ea30ad0371d37b5742453f74084e7b04d  mbedtls-2.16.5-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released
+sha1  3cb5b681597a5bd798d31038c129c0dc911d8a2c  mbedtls-2.16.6-apache.tgz
+sha256  66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770  mbedtls-2.16.6-apache.tgz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 5d0dd87339..50121fa6c7 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.16.5
+MBEDTLS_VERSION = 2.16.6
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
