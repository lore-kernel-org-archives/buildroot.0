From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:34:23 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/mbedtls: security
 bump to version 2.16.5
Message-ID: <20200314142800.BE45882CFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=144bd2165bfd27f73711d8b9c75c63a750d26308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

- Fix potential memory overread when performing an ECDSA signature
   operation. The overread only happens with cryptographically low
   probability (of the order of 2^-n where n is the bitsize of the
   curve) unless the RNG is broken, and could result in information
   disclosure or denial of service (application crash or extra resource
   consumption).
 - To avoid a side channel vulnerability when parsing an RSA private
   key, read all the CRT parameters from the DER structure rather than
   reconstructing them.
 - Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 07fd2da5958b312aaa68d10b0496f9d120c37941)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 8 ++++----
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index db9d29d1d5..92e7d35a64 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.4-and-2.7.13-released
-sha1	e446cbac7d24fc3ff1b1c4ee7c021694ede86db6	mbedtls-2.16.4-apache.tgz
-sha256	3441f32bda9c8ef58acc9e18028d09eb9c17d199eb27141bec074905152fb2fb	mbedtls-2.16.4-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.5-and-2.7.14-released
+sha1  c36962183e05467aa1dadafcaacf90216a737866  mbedtls-2.16.5-apache.tgz
+sha256  65b4c6cec83e048fd1c675e9a29a394ea30ad0371d37b5742453f74084e7b04d  mbedtls-2.16.5-apache.tgz
 # Locally calculated
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index c6a7adc72a..5d0dd87339 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.16.4
+MBEDTLS_VERSION = 2.16.5
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
