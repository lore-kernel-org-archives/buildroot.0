From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 20:07:10 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mbedtls: security
 bump to version 2.7.13
Message-ID: <20200229185740.02E468EF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf8b6053142276b2c03f46ffaae766699ab21bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fix CVE-2019-18222: Our bignum implementation is not constant
time/constant trace, so side channel attacks can retrieve the blinded
value, factor it (as it is smaller than RSA keys and not guaranteed to
have only large prime factors), and then, by brute force, recover the
key. Reported by Alejandro Cabrera Aldaya and Billy Brumley.

For more details, see the announcement:
https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.4-and-2.7.13-released

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 84fe820c5c..9edd4cd6da 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.3-and-2.7.12-released
-sha1	ce1af75d497cc03fe5c8e8e15fbf583d9dfbacd1	mbedtls-2.7.12-apache.tgz
-sha256	d3a36dbc9f607747daa6875c1ab2e41f49eff5fc99d3436b4f3ac90c89f3c143	mbedtls-2.7.12-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.4-and-2.7.13-released
+sha1	a539756905c312591aae757ecbf3e0aadc6d1c46	mbedtls-2.7.13-apache.tgz
+sha256	6772fe21c7755dc513920e84adec629d39188b6451542ebaece428f0eba655c9	mbedtls-2.7.13-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 427b2acb55..42198c2e57 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.12
+MBEDTLS_VERSION = 2.7.13
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
