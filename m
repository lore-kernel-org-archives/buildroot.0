From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2016 11:38:36 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2g
Message-ID: <1456843116-18109-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-0800 - Cross-protocol attack on TLS using SSLv2 (DROWN)
CVE-2016-0705 - Double-free in DSA code
CVE-2016-0798 - Memory leak in SRP database lookups
CVE-2016-0797 - BN_hex2bn/BN_dec2bn NULL pointer deref/heap corruption
CVE-2016-0799 - Fix memory issues in BIO_*printf functions
CVE-2016-0702 - Side channel attack on modular exponentiation

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.hash | 4 ++--
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 2cf7516..e3ea2ae 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.0.2f.tar.gz.sha256
-sha256	932b4ee4def2b434f85435d9e3e19ca8ba99ce9a065a61524b429a9d5e9b2e9c	openssl-1.0.2f.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2g.tar.gz.sha256
+sha256	b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33	openssl-1.0.2g.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index b7498a7..30dfe31 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2f
+OPENSSL_VERSION = 1.0.2g
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.4.10
