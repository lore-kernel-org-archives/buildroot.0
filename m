From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:39:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mbedtls: security
 bump to version 2.7.14
Message-ID: <20200314142755.5293182CFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9edbee40207bfa0824fe88576b4fa1bbf10f1a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

- To avoid a side channel vulnerability when parsing an RSA private
  key, read all the CRT parameters from the DER structure rather than
  reconstructing them.

For more details, see the advisory:
https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.5-and-2.7.14-released

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 9edd4cd6da..6368dbbabe 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.4-and-2.7.13-released
-sha1	a539756905c312591aae757ecbf3e0aadc6d1c46	mbedtls-2.7.13-apache.tgz
-sha256	6772fe21c7755dc513920e84adec629d39188b6451542ebaece428f0eba655c9	mbedtls-2.7.13-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.5-and-2.7.14-released
+sha1	acc850069d38ce21c029358d7eb9d14691d7fc0a	mbedtls-2.7.14-apache.tgz
+sha256	9a8ff432b3dcd89c74770d914e28765e3faaea4206f7cc98b02a075994c5090f	mbedtls-2.7.14-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 42198c2e57..5f3208190f 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.13
+MBEDTLS_VERSION = 2.7.14
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
