From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu,  3 Dec 2015 14:49:42 -0300
Subject: [Buildroot] [PATCH v2] openssl: security bump to version 1.0.2e
Message-ID: <1449164982-20789-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Fixes:
CVE-2015-3193 - BN_mod_exp may produce incorrect results on x86_64
CVE-2015-3194 - Certificate verify crash with missing PSS parameter
CVE-2015-3195 - X509_ATTRIBUTE memory leak

Enable IDEA as well since otherwise the build breaks (always great
upstream) - it's no longer patent encumbered.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/openssl/openssl.hash | 4 ++--
 package/openssl/openssl.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 355be79..bed1c1c 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,2 +1,2 @@
-# From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
-sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
+sha256	eee11def03647aa2267434a779608af6fca645023c9a194ddb82f14426835537	openssl-1.0.2e.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index da492ff..1f07df1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2d
+OPENSSL_VERSION = 1.0.2e
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
@@ -77,7 +77,6 @@ define OPENSSL_CONFIGURE_CMDS
 			--libdir=/lib \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
-			no-idea \
 			no-rc5 \
 			enable-camellia \
 			enable-mdc2 \
-- 
2.4.10
