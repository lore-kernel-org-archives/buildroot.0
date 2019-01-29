From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:09:53 +0100
Subject: [Buildroot] [git commit] mbedtls: security bump to version 2.7.9
Message-ID: <20190129220900.69960821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=848221b47c12a561a7521bf469dda37a1a9d80d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2018-19608 is fixed by bumping mbdedtls to a version greater or
equal to 2.7.8, see
https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2018-03

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 47e446dd07..57a5aeffcb 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.12.0-2.7.5-and-2.1.14-released
-sha1	180ca49e2bb6df3826113781b793529a81427ce3	mbedtls-2.7.5-apache.tgz
-sha256	a1302ad9094aabb9880d2755927b466a6bac8e02b68e04dee77321f3859e9b40	mbedtls-2.7.5-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.0-2.7.9-and-2.1.18-released
+sha1	70dc65f3f6f6b2392b821163be7f1f634f0012c8	mbedtls-2.7.9-apache.tgz
+sha256	18e57260b46579245744adb79c2924194dad36aac38c2d0be9e749b9181c706f	mbedtls-2.7.9-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index e07cc3d71c..4a5a731d42 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.5
+MBEDTLS_VERSION = 2.7.9
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
