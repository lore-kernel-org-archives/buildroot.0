From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 24 Feb 2018 22:49:00 +0200
Subject: [Buildroot] [PATCH master] mbedtls: fix API compatibility
Message-ID: <df116322c8e36b017055d6be9f5af3c1631fdf89.1519505340.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing API compatibility with previous releases.

Fixes (hiawatha):
http://autobuild.buildroot.net/results/ce6/ce6b4a50e6aafd06f82eaae688dd8720b982e9c2/
http://autobuild.buildroot.net/results/cde/cdec7ae3565d5b76a9bc50156c6244b44197534e/
http://autobuild.buildroot.net/results/9c1/9c1aec09c03f60bee9dc134da5a29e2671fc3b5e/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-dhm-Fix-typo-in-RFC-5114-constants.patch  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch

diff --git a/package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch b/package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch
new file mode 100644
index 000000000000..effaf3d931a5
--- /dev/null
+++ b/package/mbedtls/0001-dhm-Fix-typo-in-RFC-5114-constants.patch
@@ -0,0 +1,33 @@
+From 129f50838bf14f4e1319f06f41c827fae9cc4b73 Mon Sep 17 00:00:00 2001
+From: Jaeden Amero <jaeden.amero@arm.com>
+Date: Thu, 8 Feb 2018 14:25:36 +0000
+Subject: [PATCH] dhm: Fix typo in RFC 5114 constants
+
+We accidentally named the constant MBEDTLS_DHM_RFC5114_MODP_P instead of
+MBEDTLS_DHM_RFC5114_MODP_2048_P.
+
+Fixes #1358
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 129f50838bf
+
+ include/mbedtls/dhm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mbedtls/dhm.h b/include/mbedtls/dhm.h
+index da2e66b111b6..00fafd8d16f4 100644
+--- a/include/mbedtls/dhm.h
++++ b/include/mbedtls/dhm.h
+@@ -372,7 +372,7 @@ MBEDTLS_DEPRECATED typedef char const * mbedtls_deprecated_constant_t;
+  * in <em>RFC-5114: Additional Diffie-Hellman Groups for Use with
+  * IETF Standards</em>.
+  */
+-#define MBEDTLS_DHM_RFC5114_MODP_P                              \
++#define MBEDTLS_DHM_RFC5114_MODP_2048_P                         \
+     MBEDTLS_DEPRECATED_STRING_CONSTANT(                         \
+         "AD107E1E9123A9D0D660FAA79559C51FA20D64E5683B9FD1"      \
+         "B54B1597B61D0A75E6FA141DF95A56DBAF9A3C407BA1DF15"      \
+-- 
+2.16.1
+
-- 
2.16.1
