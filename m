From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Aug 2018 23:15:10 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] mbedtls: security bump to
 version 2.7.5
Message-ID: <20180826210715.641988E77C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f09ed89b3ea7e63d1fcc3e3298c6187102bba29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

- CVE-2018-0497: Remote plaintext recovery on use of CBC based ciphersuites
  through a timing side-channel

- CVE-2018-0498: Plaintext recovery on use of CBC based ciphersuites through
  a cache based side-channel

For more info, see the advisory:
https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2018-02

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a7a1591350c29538e86cedebcb251ffac3daecc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index cf347d299f..47e446dd07 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.11.0-2.7.4-and-2.1.13-released
-sha1	20394e353050992c5f9699da7c9a336bd2ed2dea	mbedtls-2.7.4-apache.tgz
-sha256	34e164d49500e377970c5f6761a146078baae0e086ec88cdcfeb9c96878a38f5	mbedtls-2.7.4-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.12.0-2.7.5-and-2.1.14-released
+sha1	180ca49e2bb6df3826113781b793529a81427ce3	mbedtls-2.7.5-apache.tgz
+sha256	a1302ad9094aabb9880d2755927b466a6bac8e02b68e04dee77321f3859e9b40	mbedtls-2.7.5-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index ab415dd0b8..e07cc3d71c 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.4
+MBEDTLS_VERSION = 2.7.5
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
