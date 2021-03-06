From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Mar 2021 17:14:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 4.7.0
Message-ID: <20210306161450.2424523-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2021-3336: DoTls13CertificateVerify in tls13.c in wolfSSL before
4.7.0 does not cease processing for certain anomalous peer behavior
(sending an ED22519, ED448, ECC, or RSA signature without the
corresponding certificate). The client side is affected because
man-in-the-middle attackers can impersonate TLS 1.3 servers.

https://github.com/wolfSSL/wolfssl/releases/tag/v4.7.0-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index f5a25fe980..05fee25b6b 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  053aefbb02d0b06b27c5e2df6875b4b587318755b7db9d6aa8d72206b310a848  wolfssl-4.6.0-stable.tar.gz
+sha256  b0e740b31d4d877d540ad50cc539a8873fc41af02bd3091c4357b403f7106e31  wolfssl-4.7.0-stable.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index d66a1c2800..fe21ddcd4f 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.6.0-stable
+WOLFSSL_VERSION = 4.7.0-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.30.0
