From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 09:42:47 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mbedtls: security
 bump to version 2.16.8
Message-ID: <20200905073713.696AE86F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a36164400cd09bbb962d23062247cef0efaac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix a "Local side channel attack on classical CBC decryption in (D)TLS"
a.k.a. CVE-2020-16150:
https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-1

as well as a "Local side channel attack on RSA and static
Diffie-Hellman" (no CVE):
https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-2

Also change MBEDTLS_SITE and retrieve hash provided by upstream

https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61bb1370d0c9e86e1b2036bca89000b4296545a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 3 ++-
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index b75a8fa80c..0082eee4a2 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,3 +1,4 @@
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8:
+sha256  fe9e3b15c3375943bdfebbbb20dd6b4f1147b3b5d926248bd835d73247407430  mbedtls-2.16.8.tar.gz
 # Locally calculated
-sha256  4786b7d1676f5e4d248f3a7f2d28446876d64962634f060ff21b92c690cfbe86  mbedtls-2.16.7.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 4ae8291c11..5094434e6c 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.7
-MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,mbedtls-$(MBEDTLS_VERSION))
+MBEDTLS_VERSION = 2.16.8
+MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
 	-DENABLE_TESTING=OFF
