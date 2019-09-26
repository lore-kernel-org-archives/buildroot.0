From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 10:50:50 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libopenssl:
 security bump to version 1.1.1d
Message-ID: <20190926084550.5BAC38F7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67a0e38e7228f5f558bff36fefb9148f62602d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- ECDSA remote timing attack (CVE-2019-1547)
  Severity: Low

- Fork Protection (CVE-2019-1549)
  Severity: Low

- Padding Oracle in PKCS7_dataDecode and CMS_decrypt_set1_pkey (CVE-2019-1563)
  Severity: Low

For more details, see the advisory:
https://www.openssl.org/news/secadv/20190910.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 99a2f0dd6ada075a0a3d278487e0c4b7c6cb3ec1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 753f447abe..1b239fbee7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1b.tar.gz.sha256
-sha256	f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90	openssl-1.1.1c.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1d.tar.gz.sha256
+sha256	1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2	openssl-1.1.1d.tar.gz
 
 # License files
 sha256	c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c	LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 2a7514d590..4a430bcb4d 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1c
+LIBOPENSSL_VERSION = 1.1.1d
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
